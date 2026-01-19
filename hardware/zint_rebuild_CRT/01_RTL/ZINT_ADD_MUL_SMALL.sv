`include "MODP_SUB.sv"

/*
 * Add y*s to x. x and y initially have length 'len' words; the new x
 * has length 'len+1' words. 's' must fit on 31 bits. x[] and y[] must
 * not overlap.
 */
module ZINT_ADD_MUL_SMALL #(parameter SLAVE_NUM) 
(
    // Input signals
    clk,
    rst_n,
    in_valid,
    x_i,
    y,
    s,
    p,
    p0i,
    len_i,
    read_valid,
    is_write,
    stall,
    // Output signals
    // ready,
    out_valid,
    x_o,
    read_ena,
    uA,
    tmp,
    new_state, 
    uB,
    receive,
    r_state,
    cc_out_valid,
    prime_ena,
    len,
    // MODP_MONTYMUL_TOP
    modp_montymul_req,
    modp_montymul_resp
    // modp_montymul_inf
);
import usertype::*;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
typedef enum logic [1:0] { 
    S_IDLE    = 2'd0,
    S_SUB     = 2'd1,
    S_MUL     = 2'd2,
    S_ADD_MUL = 2'd3
} State;

typedef enum logic [1:0] { 
    READ_XQ   = 2'd0,
    READ_XP   = 2'd1,
    READ_X    = 2'd2,
    READ_IDLE = 2'd3
} Read;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input           clk;
input           rst_n;
input           in_valid;
input  uint31_t x_i [0:SLAVE_NUM-1];
input  uint31_t y;
input  uint31_t s;
input  uint31_t p;
input  uint31_t p0i;
input  [XLEN_WIDTH-1:0] len_i;
input           read_valid;
input is_write;
input stall;

output logic    out_valid;
output uint31_t x_o [0:SLAVE_NUM-1];

output logic read_ena;
output logic [XLEN_WIDTH-1:0] uA;
output uint31_t tmp;
output Read r_state;
output logic new_state;
output logic [XLEN_WIDTH-1:0] uB;
output logic receive;
output logic cc_out_valid;
output logic prime_ena;
output logic [XLEN_WIDTH-1:0] len;
 
/*
 * MODP_MONTYMUL_TOP
 */
output MODP_MONTYMUL_MASTER modp_montymul_req [0:WORD_NUM-1];
input  MODP_MONTYMUL_SLAVE  modp_montymul_resp [0:WORD_NUM-1];
// ZINT_REBUILD_CRT_INF.ZINT_ADD_MUL_SMALL modp_montymul_inf;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
State state, next_state;
logic [XLEN_WIDTH-1:0] cnt, next_cnt;
logic [XLEN_WIDTH-1:0] uA_comb;
Read next_r_state;
logic [XLEN_WIDTH-1:0] len_comb;

uint31_t   xw [0:SLAVE_NUM-1];
uint31_t   yw [0:SLAVE_NUM-1];
uint31_t   xr [0:SLAVE_NUM-1], xr_comb [0:SLAVE_NUM-1];
logic [63:0] z [0:SLAVE_NUM-1];
uint31_t   cc [0:SLAVE_NUM-1], cc_comb [0:SLAVE_NUM-1];

/*
 * MODP_SUB
 */
uint31_t d_modp_sub [0:SLAVE_NUM-1];

/*
 * MODP_MONTYMUL_TOP
 */
logic in_valid_modp_montymul_comb [0:SLAVE_NUM-1];

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
genvar modp_sub_idx;
generate
    for (modp_sub_idx=0; modp_sub_idx<SLAVE_NUM; modp_sub_idx=modp_sub_idx+1) begin
        MODP_SUB u_MODP_SUB (
            .a(x_i[modp_sub_idx]), 
            .b(xr[modp_sub_idx]), 
            .p(p), 
            .d(d_modp_sub[modp_sub_idx])
        );
    end
endgenerate


//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * FSM
 */
always_comb begin
    case (state)
        S_IDLE: 
            if (in_valid) 
                next_state = S_SUB;
            else 
                next_state = state;
        S_SUB: 
            if (in_valid) 
                next_state = S_MUL;
            else    
                next_state = state;
        S_MUL: 
            if (modp_montymul_resp[0].out_valid)
                next_state = S_ADD_MUL;
            else
                next_state = state;
        S_ADD_MUL: 
            if (stall)
                next_state = state;
            else if (cnt == len)
                if (in_valid)
                    next_state = S_SUB;
                else 
                    next_state = S_IDLE;
            else
                next_state = state;
    endcase
end

always_comb begin
    if (state == S_ADD_MUL)
        if (stall)
            next_cnt = cnt;
        else if (cnt == len)
            next_cnt = 0;
        else if (in_valid)
            next_cnt = cnt + 1;
        else 
            next_cnt = cnt;
    else
        next_cnt = 0;
end

always_comb begin
    if (state != S_SUB && next_state == S_SUB)
        len_comb = len_i;
    else
        len_comb = len;
end

assign new_state = r_state == READ_X && next_r_state == READ_XQ;

always_comb begin
    case (state)
        S_IDLE: receive = in_valid;
        S_SUB: receive = in_valid;
        S_MUL: receive = 0;
        S_ADD_MUL: 
            if (stall)
                receive = 0;
            else 
                receive = in_valid;
    endcase
end

always_comb begin
    if (is_write && (state == S_ADD_MUL || state == S_MUL) && cnt != len) // stall
        next_r_state = r_state;
    else
        case (r_state)
            READ_XQ: 
                if (read_valid)
                    next_r_state = READ_XP;
                else
                    next_r_state = r_state;
            READ_XP: 
                if (read_valid)
                    next_r_state = READ_X;
                else
                    next_r_state = r_state;
            READ_X: 
                if (read_valid && uA == len_i) 
                    next_r_state = READ_XQ;
                else
                    next_r_state = r_state;
            default: 
                next_r_state = r_state;
        endcase
end

always_comb begin
    if (is_write && (state == S_ADD_MUL || state == S_MUL) && cnt != len) // stall
        uA_comb = uA;
    else
        case (r_state)
            READ_XQ: 
                if (read_valid)
                    uA_comb = len_i + 1; // "1" is register file offset
                else
                    uA_comb = uA;
            READ_XP: 
                if (read_valid)
                    uA_comb = 0 + 1; // "1" is register file offset
                else
                    uA_comb = uA;
            READ_X: 
                if (read_valid)
                    if (uA == len_i)
                        uA_comb = 0;
                    else
                        uA_comb = uA + 1;
                else 
                    uA_comb = uA;
            default: 
                uA_comb = uA;
        endcase
end

always_comb begin
    if (is_write && (state == S_ADD_MUL || state == S_MUL) && cnt != len) // stall
        read_ena = 0;
    else
        case (r_state)
            READ_XQ: 
                if (state == S_SUB || (state == S_MUL && next_state != S_ADD_MUL))
                    read_ena = 0;
                else 
                    read_ena = 1;
            READ_XP: read_ena = 1;
            READ_X: 
                if (uA != (0 + 1) && (state == S_SUB || (state == S_MUL && next_state != S_ADD_MUL)))
                    read_ena = 0;
                else 
                    read_ena = 1;
            default:
                read_ena = 1;
        endcase
end

assign cc_out_valid = state == S_ADD_MUL && cnt == len;

assign prime_ena = state == S_ADD_MUL && cnt == len;

genvar xr_comb_idx;
generate
    for (xr_comb_idx=0; xr_comb_idx<SLAVE_NUM; xr_comb_idx=xr_comb_idx+1) begin
        always_comb begin
            if (next_state == S_SUB && in_valid)
                xr_comb[xr_comb_idx] = x_i[xr_comb_idx];
            else if (state == S_SUB && next_state == S_MUL)
                xr_comb[xr_comb_idx] = d_modp_sub[xr_comb_idx];
            else if (modp_montymul_resp[xr_comb_idx].out_valid)
                xr_comb[xr_comb_idx] = modp_montymul_resp[xr_comb_idx].d;
            else 
                xr_comb[xr_comb_idx] = xr[xr_comb_idx];
        end
    end
endgenerate

/*
 * MODP_MONTYMUL
 */
genvar in_valid_modp_montymul_comb_idx;
generate
    for (in_valid_modp_montymul_comb_idx=0; in_valid_modp_montymul_comb_idx<SLAVE_NUM; in_valid_modp_montymul_comb_idx=in_valid_modp_montymul_comb_idx+1) begin
        always_comb begin
            if (state == S_SUB && next_state == S_MUL) 
                in_valid_modp_montymul_comb[in_valid_modp_montymul_comb_idx] = 1;
            else if (modp_montymul_resp[in_valid_modp_montymul_comb_idx].ready)
                in_valid_modp_montymul_comb[in_valid_modp_montymul_comb_idx] = 0;
            else 
                in_valid_modp_montymul_comb[in_valid_modp_montymul_comb_idx] = modp_montymul_req[in_valid_modp_montymul_comb_idx].in_valid;
        end
    end
endgenerate

genvar i_modp_montymul_idx;
generate
    for (i_modp_montymul_idx=0; i_modp_montymul_idx<SLAVE_NUM; i_modp_montymul_idx=i_modp_montymul_idx+1) begin
        always_comb begin
            modp_montymul_req[i_modp_montymul_idx].a = s;
            modp_montymul_req[i_modp_montymul_idx].b = xr[i_modp_montymul_idx];
            modp_montymul_req[i_modp_montymul_idx].p = p;
            modp_montymul_req[i_modp_montymul_idx].p0i = p0i;
            modp_montymul_req[i_modp_montymul_idx].isMQ = 1'b0;
        end
    end
endgenerate

/*
 * variable
 */
genvar variable_idx;
generate
    for (variable_idx=0; variable_idx<SLAVE_NUM; variable_idx=variable_idx+1) begin
        always_comb begin
            xw[variable_idx] = x_i[variable_idx];
            yw[variable_idx] = y;
            z[variable_idx] = yw[variable_idx] * xr[variable_idx] + xw[variable_idx] + cc[variable_idx];
        end
    end
endgenerate

genvar cc_comb_idx;
generate
    for (cc_comb_idx=0; cc_comb_idx<SLAVE_NUM; cc_comb_idx=cc_comb_idx+1) begin
        always_comb begin
            if (state == S_ADD_MUL)
                if (!in_valid || stall)
                    cc_comb[cc_comb_idx] = cc[cc_comb_idx];
                else 
                    cc_comb[cc_comb_idx] = z[cc_comb_idx] >> 31;
            else
                cc_comb[cc_comb_idx] = 0;
        end
    end
endgenerate

/*
 * zint_mul_small
 */
logic [P_WIDTH*2-1:0] z_tmp;
uint31_t cc_tmp, cc_tmp_comb;
uint31_t p_tmp, p_tmp_comb;

always_comb begin
    if (state == S_SUB && in_valid)
        p_tmp_comb = p;
    else
        p_tmp_comb = p_tmp;
end

assign z_tmp = y * p_tmp + cc_tmp;

always_comb begin
    if (state == S_ADD_MUL)
        if (!in_valid || stall)
            cc_tmp_comb = cc_tmp;
        else 
            cc_tmp_comb = z_tmp >> 31;
    else
        cc_tmp_comb = 0;
end

/*
 * Output
 */
always_comb begin
    if (state == S_ADD_MUL && (in_valid || cnt == len))
        out_valid = 1;
    else
        out_valid = 0;
end

genvar x_o_idx;
generate
    for (x_o_idx=0; x_o_idx<SLAVE_NUM; x_o_idx=x_o_idx+1) begin
        always_comb begin
            if (cnt == len)
                x_o[x_o_idx] = cc[x_o_idx];
            else 
                x_o[x_o_idx] = z[x_o_idx] & 'h7FFFFFFF;
        end
    end
endgenerate

always_comb begin
    if (cnt == len)
        tmp = cc_tmp;
    else 
        tmp = z_tmp & 'h7FFFFFFF;
end

assign uB = cnt + 1;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
genvar ff_idx;
generate
    for (ff_idx=0; ff_idx<SLAVE_NUM; ff_idx=ff_idx+1) begin
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                xr[ff_idx] <= 0;
                modp_montymul_req[ff_idx].in_valid <= 0;
                cc[ff_idx] <= 0;
            end
            else begin
                xr[ff_idx] <= xr_comb[ff_idx];
                modp_montymul_req[ff_idx].in_valid <= in_valid_modp_montymul_comb[ff_idx];
                cc[ff_idx] <= cc_comb[ff_idx];
            end
        end
    end
endgenerate

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= S_IDLE;
        cnt <= 0;
        r_state <= READ_XQ;
        uA <= 0;
        len <= 0;
        cc_tmp <= 0;
        p_tmp <= 0;
    end
    else begin
        state <= next_state;
        cnt <= next_cnt;
        r_state <= next_r_state;
        uA <= uA_comb;
        len <= len_comb;
        cc_tmp <= cc_tmp_comb;
        p_tmp <= p_tmp_comb;
    end
end

endmodule
