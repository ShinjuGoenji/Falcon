`include "MODP_ADD.sv"

/*
 * Reduce a big integer d modulo a small integer p.
 * Rules:
 *  d is unsigned
 *  p is prime
 *  2^30 < p < 2^31
 *  p0i = -(1/p) mod 2^31
 *  R2 = 2^62 mod p
 */
module ZINT_MOD_SMALL_UNSIGNED #(parameter SLAVE_NUM)
(
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    d,
    dlen,
    dlen_tmp,
    p,
    p0i,
    R2,
    is_read,
    // Output signals
    out_valid,
    x,
    read_ena,
    receive,
    uA,
    new_state,
    read_xlast,
    // MODP_MONTYMUL_TOP
    modp_montymul_req,
    modp_montymul_resp
);
import usertype::*;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
typedef enum logic { 
    S_IDLE = 1'd0,
    S_EXE  = 1'd1
} State;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
/*
 * Main channel
 */
input                   clk;
input                   rst_n;
input                   in_valid;
input  uint31_t         d [0:SLAVE_NUM-1];
input  [XLEN_WIDTH-1:0] dlen;
input  [XLEN_WIDTH-1:0] dlen_tmp;
input  uint31_t         p;
input  uint31_t         p0i;
input  uint31_t         R2;
input is_read;

output                  out_valid;
output uint31_t         x [0:SLAVE_NUM-1];
output logic            read_ena;
output logic            receive;
output logic [XLEN_WIDTH-1:0] uA;
output logic new_state;
output logic read_xlast;


/*
 * MODP_MONTYMUL_TOP
 */
output MODP_MONTYMUL_MASTER modp_montymul_req [0:WORD_NUM-1];
input  MODP_MONTYMUL_SLAVE  modp_montymul_resp [0:WORD_NUM-1];

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
State                 state, next_state;
logic [XLEN_WIDTH-1:0] cnt, next_cnt;
logic ready;
logic read_ena_reg;

uint31_t d_p [0:SLAVE_NUM-1];
uint31_t x0 [0:SLAVE_NUM-1], x0_comb [0:SLAVE_NUM-1];
uint31_t x1 [0:SLAVE_NUM-1];
uint31_t w [0:SLAVE_NUM-1], w_comb [0:SLAVE_NUM-1];
logic out_valid_modp_add, out_valid_modp_add_comb;
logic in_valid_modp_montymul_comb [0:SLAVE_NUM-1];
logic modp_montymul_done, modp_montymul_done_comb;

//---------------------------------------------------------------------
//  Submodule
//---------------------------------------------------------------------
genvar modp_add_idx;
generate
    for (modp_add_idx=0; modp_add_idx<SLAVE_NUM; modp_add_idx=modp_add_idx+1) begin
        MODP_ADD u_MODP_ADD (
            .a(x0[modp_add_idx]), 
            .b(w[modp_add_idx]), 
            .p(p), 
            .d(x1[modp_add_idx])
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
        S_IDLE: begin
            if (in_valid)
                next_state = S_EXE;
            else
                next_state = state;
        end
        S_EXE: begin
            if (cnt == 0)
                if (in_valid)
                    next_state = state;
                else 
                    next_state = S_IDLE;
            else
                next_state = state;
        end
    endcase
end

always_comb begin
    if (in_valid)
        if (cnt == 0)
            next_cnt = dlen;
        else if (ready && in_valid)
            next_cnt = cnt - 1;
        else
            next_cnt = cnt;
    else
        next_cnt = cnt;
end

always_comb begin
    if (read_ena_reg)
        if (in_valid && state == S_IDLE)
            read_ena = 1;
        else if (cnt != 0 && !is_read)
            read_ena = 0;
        else if (state == S_EXE && cnt == 0 && !is_read)
            read_ena = 0;
        else if (state == S_IDLE) // TODO: a little bit weird
            read_ena = 0;
        else
            read_ena = read_ena_reg;
    else 
        if (state == S_IDLE)
            read_ena = 1;
        else if (ready)
            read_ena = 1;
        else
            read_ena = read_ena_reg;
end

always_comb begin
    if (in_valid && dlen == 0)
        receive = 1;
    else 
        receive = (cnt != next_cnt);
end

always_comb begin
    if (next_cnt == 0)
        uA = dlen_tmp + 1;
    else
        uA = next_cnt;
end

assign new_state = next_cnt == 0 && in_valid && ready;
assign read_xlast = next_cnt == 0;

/*
 * MODP_MONTYMUL
 */
genvar i_modp_montymul_idx;
generate
    for (i_modp_montymul_idx=0; i_modp_montymul_idx<SLAVE_NUM; i_modp_montymul_idx=i_modp_montymul_idx+1) begin
        always_comb begin
            modp_montymul_req[i_modp_montymul_idx].a = x0[i_modp_montymul_idx];
            modp_montymul_req[i_modp_montymul_idx].b = R2;
            modp_montymul_req[i_modp_montymul_idx].p = p;
            modp_montymul_req[i_modp_montymul_idx].p0i = p0i;
            modp_montymul_req[i_modp_montymul_idx].isMQ = 1'b0;
        end
    end
endgenerate

// in_valid
genvar in_valid_modp_montymul_comb_idx;
generate
    for (in_valid_modp_montymul_comb_idx=0; in_valid_modp_montymul_comb_idx<SLAVE_NUM; in_valid_modp_montymul_comb_idx=in_valid_modp_montymul_comb_idx+1) begin
        always_comb begin
            if (state == S_EXE && cnt != 0) 
                if (out_valid_modp_add)
                    in_valid_modp_montymul_comb[in_valid_modp_montymul_comb_idx] = 1;
                else if (modp_montymul_resp[in_valid_modp_montymul_comb_idx].ready)
                    in_valid_modp_montymul_comb[in_valid_modp_montymul_comb_idx] = 0;
                else 
                    in_valid_modp_montymul_comb[in_valid_modp_montymul_comb_idx] = modp_montymul_req[in_valid_modp_montymul_comb_idx].in_valid;
            else
                in_valid_modp_montymul_comb[in_valid_modp_montymul_comb_idx] = modp_montymul_req[in_valid_modp_montymul_comb_idx].in_valid;
        end
    end
endgenerate

always_comb begin
    if (in_valid)
        modp_montymul_done_comb = 0;
    else if (modp_montymul_resp[0].out_valid)
        modp_montymul_done_comb = 1;
    else
        modp_montymul_done_comb = modp_montymul_done;
end

/*
 * variable
 */
genvar d_p_idx;
generate
    for (d_p_idx=0; d_p_idx<SLAVE_NUM; d_p_idx=d_p_idx+1) begin
        always_comb begin
            if (d[d_p_idx] < p)
                d_p[d_p_idx] = d[d_p_idx];
            else
                d_p[d_p_idx] = d[d_p_idx] - p;
        end
    end
endgenerate

genvar w_comb_idx;
generate
    for (w_comb_idx=0; w_comb_idx<SLAVE_NUM; w_comb_idx=w_comb_idx+1) begin
        always_comb begin
            if (in_valid)
                if (cnt == 0)
                    w_comb[w_comb_idx] = d_p[w_comb_idx];
                else if (ready && in_valid)
                    w_comb[w_comb_idx] = d_p[w_comb_idx];
                else 
                    w_comb[w_comb_idx] = w[w_comb_idx];
            else
                w_comb[w_comb_idx] = w[w_comb_idx];
        end
    end
endgenerate

genvar x0_comb_idx;
generate
    for (x0_comb_idx=0; x0_comb_idx<SLAVE_NUM; x0_comb_idx=x0_comb_idx+1) begin
        always_comb begin
            if (state == S_IDLE)
                x0_comb[x0_comb_idx] = 0;
            else if (cnt == 0 && in_valid)
                x0_comb[x0_comb_idx] = 0;
            else if (out_valid_modp_add)
                x0_comb[x0_comb_idx] = x1[x0_comb_idx];
            else if (modp_montymul_resp[x0_comb_idx].out_valid)
                x0_comb[x0_comb_idx] = modp_montymul_resp[x0_comb_idx].d;
            else
                x0_comb[x0_comb_idx] = x0[x0_comb_idx];
        end
    end
endgenerate

always_comb begin
    if (in_valid)
        if (cnt == 0)
            out_valid_modp_add_comb = 1;
        else if (ready)
            out_valid_modp_add_comb = 1;
        else 
            out_valid_modp_add_comb = 0;
    else
        out_valid_modp_add_comb = 0;
end

/*
 * Output
 */
assign ready = (state == S_EXE) ? modp_montymul_resp[0].out_valid || modp_montymul_done : 1;
assign out_valid = state == S_EXE && cnt == 0;
assign x = x1;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
genvar ff_idx;
generate
    for (ff_idx=0; ff_idx<SLAVE_NUM; ff_idx=ff_idx+1) begin
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                x0[ff_idx] <= 0;
                w[ff_idx] <= 0;
                modp_montymul_req[ff_idx].in_valid <= 0;
            end
            else begin
                x0[ff_idx] <= x0_comb[ff_idx];
                w[ff_idx] <= w_comb[ff_idx];
                modp_montymul_req[ff_idx].in_valid <= in_valid_modp_montymul_comb[ff_idx];
            end
        end
    end
endgenerate

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= S_IDLE;
        cnt <= 0;
        out_valid_modp_add <= 0;
        modp_montymul_done <= 0;
        read_ena_reg <= 0;
    end
    else begin
        state <= next_state;
        cnt <= next_cnt;
        out_valid_modp_add <= out_valid_modp_add_comb;
        modp_montymul_done <= modp_montymul_done_comb;
        read_ena_reg <= read_ena;
    end
end

endmodule
