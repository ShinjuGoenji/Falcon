`include "ZINT_MOD_SMALL_UNSIGNED.sv"
`include "ZINT_ADD_MUL_SMALL.sv"

/*
 * At the entry of each loop iteration:
 *  - the first u words of each array have been
 *    reassembled;
 *  - the first u words of tmp[] contains the
 * product of the prime moduli processed so far.
 *
 * We call 'q' the product of all previous primes.
 */
module ZINT_REBUILD_CRT (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    len_valid,
    mode,
    inf_logn,
    num,
    logn,
    xlen,
    input_ptr,
    intt_output_buffer_comb,
    // Output signals
    out_valid,
    // MODP_MONTYMUL_TOP
    modp_montymul_req,
    modp_montymul_resp,
    // RF_CRT
    is_write,
    is_read,
    CENB_comb, 
    AB_comb, 
    DB_comb,
    CENA, 
    AA, 
    QA
);
import FALCON_Config::*;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
typedef enum logic { 
    S_IDLE	  = 1'd0,
    S_EXE	  = 1'd1
} State;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
/*
 * Main channel
 */
input  logic            clk;
input  logic            rst_n;
input  logic            in_valid;
input  logic            len_valid;
input  FALCON_MODE      mode;
input  [LOGN_WIDTH-1:0] inf_logn;
input  [NUM_WIDTH-1:0]  num;
input  [LOGN_WIDTH-1:0] logn;
input  [XLEN_WIDTH-1:0] xlen;

input  [NUM_WIDTH:0]           input_ptr;
input  uint31_t         intt_output_buffer_comb [0:WORD_NUM-1];

output logic  out_valid;

/*
 * MODP_MONTYMUL
 */
output MODP_MONTYMUL_MASTER modp_montymul_req [0:WORD_NUM*2-1];
input  MODP_MONTYMUL_SLAVE  modp_montymul_resp [0:WORD_NUM*2-1];

/*
 * RF_CRT
 */
input  logic         is_write;
input  logic         is_read;

output logic                            CENA;
output logic    [RF_CRT_ADDR_WIDTH-1:0] AA;
input  uint31_t                         QA [0:WORD_NUM-1];

output logic                            CENB_comb;
output logic    [RF_CRT_ADDR_WIDTH-1:0] AB_comb;
output logic    [P_WIDTH*WORD_NUM-1:0]  DB_comb;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
State state, next_state;
logic [NUM_WIDTH-$clog2(WORD_NUM)+1:0] intt_AB, intt_AB_comb; // depend on input_ptr bit width & WORD_NUM
logic [NUM_WIDTH-$clog2(WORD_NUM)-2:0] num_1, num_1_comb;
logic [9:0] MOD_SMALL_UNSIGNED_PTR_END;
logic [9:0] ADD_MUL_SMALL_PTR_END;

/*
 * ZINT_MOD_SMALL_UNSIGNED
 */
logic [XLEN_WIDTH-1:0] u_mod_small_unsigned, u_mod_small_unsigned_comb;
logic [9:0] mod_small_unsigned_ptr, mod_small_unsigned_ptr_comb;
logic [9:0] mod_small_unsigned_ptr_reg, mod_small_unsigned_ptr_reg_comb, mod_small_unsigned_ptr_reg_reg;
logic [RF_CRT_ADDR_WIDTH-1:0] mod_small_unsigned_AA, mod_small_unsigned_AB, mod_small_unsigned_AB_comb;

logic intt_forwarding_mod_small_unsigned;
logic add_mul_small_forwarding_mod_small_unsigned;

logic in_valid_mod_small_unsigned, in_valid_mod_small_unsigned_comb;
uint31_t mod_small_unsigned_input_buffer [0:WORD_NUM-1], mod_small_unsigned_input_buffer_comb [0:WORD_NUM-1];

logic mod_small_unsigned_output_buffer_full, mod_small_unsigned_output_buffer_full_comb;
uint31_t mod_small_unsigned_output_buffer [0:WORD_NUM-1], mod_small_unsigned_output_buffer_comb [0:WORD_NUM-1];

logic [XLEN_WIDTH-1:0] dlen_mod_small_unsigned, dlen_mod_small_unsigned_comb, dlen_tmp_mod_small_unsigned;
uint31_t p_mod_small_unsigned, p_mod_small_unsigned_comb;
uint31_t p0i_mod_small_unsigned, p0i_mod_small_unsigned_comb;
uint31_t R2_mod_small_unsigned, R2_mod_small_unsigned_comb;
logic out_valid_mod_small_unsigned;
uint31_t x_mod_small_unsigned [0:WORD_NUM-1];

logic is_write_mod_small_unsigned;
logic read_ena_mod_small_unsigned, read_ena_mod_small_unsigned_comb;
logic read_ena_mod_small_unsigned_reg;
logic mod_small_unsigned_not_write, mod_small_unsigned_not_write_comb;
logic receive_mod_small_unsigned;
logic new_state_mod_small_unsigned;
logic read_xlast_mod_small_unsigned;
logic is_read_mod_small_unsigned;
logic mod_small_unsigned_CEB;

logic [XLEN_WIDTH-1:0] uA_mod_small_unsigned;

/*
 * ZINT_ADD_MUL_SMALL
 */
logic [XLEN_WIDTH-1:0] u_add_mul_small, u_add_mul_small_comb;
logic [9:0] add_mul_small_ptr, add_mul_small_ptr_comb;
logic [9:0] add_mul_small_ptr_reg, add_mul_small_ptr_reg_comb;

uint31_t add_mul_small_input_buffer [0:WORD_NUM-1], add_mul_small_input_buffer_comb [0:WORD_NUM-1];
logic add_mul_small_output_buffer_full, add_mul_small_output_buffer_full_comb;
uint31_t add_mul_small_output_buffer [0:WORD_NUM-1], add_mul_small_output_buffer_comb [0:WORD_NUM-1];

logic in_valid_add_mul_small, in_valid_add_mul_small_comb;
logic [XLEN_WIDTH-1:0] len_i_add_mul_small, len_i_add_mul_small_comb;
logic [XLEN_WIDTH-1:0] len_add_mul_small;
uint31_t s_add_mul_small, s_add_mul_small_comb;
uint31_t p_add_mul_small, p_add_mul_small_comb;
uint31_t p0i_add_mul_small, p0i_add_mul_small_comb;
logic out_valid_add_mul_small;
uint31_t x_add_mul_small [0:WORD_NUM-1];

logic is_write_add_mul_small, stall_add_mul_small;
logic [RF_CRT_ADDR_WIDTH-1:0] add_mul_small_AA, add_mul_small_AB, add_mul_small_AB_comb;

logic read_ena_add_mul_small, read_ena_add_mul_small_comb;
logic read_ena_add_mul_small_reg;
logic read_valid_add_mul_small;
logic new_state_add_mul_small;

typedef enum logic [1:0] { 
    READ_XQ   = 2'd0,
    READ_XP   = 2'd1,
    READ_X    = 2'd2
} Read;

logic [1:0] r_state_add_mul_small;
logic [XLEN_WIDTH-1:0] uA_add_mul_small, uB_add_mul_small;
logic [8:0] vB_add_mul_small, vB_add_mul_small_comb;
logic receive_add_mul_small;
logic cc_out_valid_add_mul_small, is_read_mod_small_unsigned_comb;
logic prime_ena_add_mul_small;

/*
 * RF_TMP
 */
logic tmp_valid, tmp_valid_comb;
uint31_t tmp_o;

uint31_t               tmp, tmp_comb;
logic                  rf_tmp_CENA;
logic [XLEN_WIDTH-1:0] rf_tmp_AA;
uint31_t               rf_tmp_QA;
logic                  rf_tmp_CENB, rf_tmp_CENB_comb;
logic [XLEN_WIDTH-1:0] rf_tmp_AB, rf_tmp_AB_comb;
uint31_t               rf_tmp_DB, rf_tmp_DB_comb;

/*
 * PRIMES
 */
logic [XLEN_WIDTH-1:0] prime_idx;
small_prime prime_comb;
logic mod_small_unsigned_prime_valid, add_mul_small_prime_valid;
logic mod_small_unsigned_round, add_mul_small_round;
//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
ZINT_MOD_SMALL_UNSIGNED #(.SLAVE_NUM(WORD_NUM)) u_ZINT_MOD_SMALL_UNSIGNED (
    // Main channel
    // Input signals
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid_mod_small_unsigned),
    .d(mod_small_unsigned_input_buffer),
    .dlen(dlen_mod_small_unsigned),
    .dlen_tmp(dlen_tmp_mod_small_unsigned),
    .p(p_mod_small_unsigned),
    .p0i(p0i_mod_small_unsigned),
    .R2(R2_mod_small_unsigned),
    .is_read(is_read_mod_small_unsigned),
    // Output signals
    .out_valid(out_valid_mod_small_unsigned),
    .x(x_mod_small_unsigned),
    .read_ena(read_ena_mod_small_unsigned),
    .receive(receive_mod_small_unsigned),
    .new_state(new_state_mod_small_unsigned),
    .uA(uA_mod_small_unsigned),
    .read_xlast(read_xlast_mod_small_unsigned),
    // MODP_MONTYMUL_TOP
    .modp_montymul_req(modp_montymul_req[0:WORD_NUM-1]),
    .modp_montymul_resp(modp_montymul_resp[0:WORD_NUM-1])
);

ZINT_ADD_MUL_SMALL #(.SLAVE_NUM(WORD_NUM)) u_ZINT_ADD_MUL_SMALL (
    // Input signals
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid_add_mul_small),
    .x_i(add_mul_small_input_buffer),
    .y(tmp),
    .s(s_add_mul_small),
    .p(p_add_mul_small),
    .p0i(p0i_add_mul_small),
    .len_i(len_i_add_mul_small),
    .read_valid(read_valid_add_mul_small),
    .is_write(is_write_add_mul_small),
    .stall(stall_add_mul_small),
    // Output signals
    .out_valid(out_valid_add_mul_small),
    .x_o(x_add_mul_small),
    .read_ena(read_ena_add_mul_small),
    .uA(uA_add_mul_small),
    .tmp(tmp_o),
    .r_state(r_state_add_mul_small),
    .new_state(new_state_add_mul_small), 
    .uB(uB_add_mul_small),
    .receive(receive_add_mul_small),
    .cc_out_valid(cc_out_valid_add_mul_small),
    .prime_ena(prime_ena_add_mul_small),
    .len(len_add_mul_small),
    // MODP_MONTYMUL_TOP
    .modp_montymul_req(modp_montymul_req[WORD_NUM:WORD_NUM*2-1]),
    .modp_montymul_resp(modp_montymul_resp[WORD_NUM:WORD_NUM*2-1])
);

PRIMES u_PRIMES (.idx(prime_idx), .prime(prime_comb));

RF_TMP u_RF_TMP (
    .clk(clk),
    .CENA(rf_tmp_CENA),
    .AA(rf_tmp_AA),
    .QA(rf_tmp_QA),
    .CENB(rf_tmp_CENB),
    .AB(rf_tmp_AB),
    .DB(rf_tmp_DB)
);
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
                next_state = S_EXE;
            else 
                next_state = state;
        S_EXE: 
            if (add_mul_small_ptr == ADD_MUL_SMALL_PTR_END && new_state_add_mul_small)
                next_state = S_IDLE;
            else 
                next_state = state;
    endcase
end

assign intt_AB_comb = input_ptr / WORD_NUM;

// num_1 = num - 1 = 2^logn - 1
always_comb begin
    if (len_valid)
        if (((1 << inf_logn) / WORD_NUM) > 0)
            num_1_comb = ((1 << inf_logn) / WORD_NUM) - 1;
        else 
            num_1_comb = 0;
    else
        num_1_comb = num_1;
end

// MOD_SMALL_UNSIGNED_PTR_END = num * (xlen - 1)
// ADD_MUL_SMALL_PTR_END      = num * xlen - 1
always_comb begin
    if (mode) begin // FALCON-1024
        case (logn)
            10:  case (xlen)
                    2: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<10)/WORD_NUM)*(2-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<10)/WORD_NUM)*2-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            8:  case (xlen)
                    2: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<8)/WORD_NUM)*(2-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<8)/WORD_NUM)*2-1;
                    end
                    3: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<8)/WORD_NUM)*(3-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<8)/WORD_NUM)*3-1;
                    end
                    5: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<8)/WORD_NUM)*(5-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<8)/WORD_NUM)*5-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            7:  case (xlen)
                    2: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<7)/WORD_NUM)*(2-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<7)/WORD_NUM)*2-1;
                    end
                    3: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<7)/WORD_NUM)*(3-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<7)/WORD_NUM)*3-1;
                    end
                    7: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<7)/WORD_NUM)*(7-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<7)/WORD_NUM)*7-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            6:  case (xlen)
                    4: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<6)/WORD_NUM)*(4-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<6)/WORD_NUM)*4-1;
                    end
                    5: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<6)/WORD_NUM)*(5-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<6)/WORD_NUM)*5-1;
                    end
                    12: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<6)/WORD_NUM)*(12-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<6)/WORD_NUM)*12-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            5:  case (xlen)
                    7: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<5)/WORD_NUM)*(7-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<5)/WORD_NUM)*7-1;
                    end
                    21: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<5)/WORD_NUM)*(21-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<5)/WORD_NUM)*21-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            4:  case (xlen)
                    14: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<4)/WORD_NUM)*(14-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<4)/WORD_NUM)*14-1;
                    end
                    40: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<4)/WORD_NUM)*(40-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<4)/WORD_NUM)*40-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            default: begin
                if ($clog2(WORD_NUM) == 3) begin
                    if (logn == 3) begin
                        case (xlen)
                            27: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(27-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*27-1;
                            end
                            78: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(78-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*78-1;
                            end
                            53: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(53-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*53-1;
                            end
                            157: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(157-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*157-1;
                            end
                            106: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(106-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*106-1;
                            end
                            209: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(209-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*209-1;
                            end
                            308: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(308-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*308-1;
                            end
                            default: begin
                                MOD_SMALL_UNSIGNED_PTR_END = 'x;
                                ADD_MUL_SMALL_PTR_END      = 'x;
                            end
                        endcase
                    end
                    else begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                end
                else if ($clog2(WORD_NUM) == 2) begin
                    if (logn == 3) begin
                        case (xlen)
                            27: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(27-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*27-1;
                            end
                            78: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(78-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*78-1;
                            end
                            default: begin
                                MOD_SMALL_UNSIGNED_PTR_END = 'x;
                                ADD_MUL_SMALL_PTR_END      = 'x;
                            end
                        endcase
                    end
                    else if (logn == 2) begin
                        case (xlen)
                            53: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<2)/WORD_NUM)*(53-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<2)/WORD_NUM)*53-1;
                            end
                            157: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<2)/WORD_NUM)*(157-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<2)/WORD_NUM)*157-1;
                            end
                            106: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<2)/WORD_NUM)*(106-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<2)/WORD_NUM)*106-1;
                            end
                            209: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<2)/WORD_NUM)*(209-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<2)/WORD_NUM)*209-1;
                            end
                            308: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<2)/WORD_NUM)*(308-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<2)/WORD_NUM)*308-1;
                            end
                            default: begin
                                MOD_SMALL_UNSIGNED_PTR_END = 'x;
                                ADD_MUL_SMALL_PTR_END      = 'x;
                            end
                        endcase
                    end
                    else begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                end
                else if ($clog2(WORD_NUM) == 1) begin
                    if (logn == 3) begin
                        case (xlen)
                            27: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(27-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*27-1;
                            end
                            78: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(78-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*78-1;
                            end
                            default: begin
                                MOD_SMALL_UNSIGNED_PTR_END = 'x;
                                ADD_MUL_SMALL_PTR_END      = 'x;
                            end
                        endcase
                    end
                    else if (logn == 2) begin
                        case (xlen)
                            53: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<2)/WORD_NUM)*(53-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<2)/WORD_NUM)*53-1;
                            end
                            157: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<2)/WORD_NUM)*(157-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<2)/WORD_NUM)*157-1;
                            end
                            default: begin
                                MOD_SMALL_UNSIGNED_PTR_END = 'x;
                                ADD_MUL_SMALL_PTR_END      = 'x;
                            end
                        endcase
                    end
                    else if (logn == 1) begin
                        case (xlen)
                            106: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<1)/WORD_NUM)*(106-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<1)/WORD_NUM)*106-1;
                            end
                            209: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<1)/WORD_NUM)*(209-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<1)/WORD_NUM)*209-1;
                            end
                            308: begin
                                MOD_SMALL_UNSIGNED_PTR_END = ((1<<1)/WORD_NUM)*(308-1);
                                ADD_MUL_SMALL_PTR_END      = ((1<<1)/WORD_NUM)*308-1;
                            end
                            default: begin
                                MOD_SMALL_UNSIGNED_PTR_END = 'x;
                                ADD_MUL_SMALL_PTR_END      = 'x;
                            end
                        endcase
                    end
                    else begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                end
                else begin
                    MOD_SMALL_UNSIGNED_PTR_END = 'x;
                    ADD_MUL_SMALL_PTR_END      = 'x;
                end
            end 
        endcase
    end
    else begin // FALCON-512
        case (logn)
            7:  case (xlen)
                    2: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<7)/WORD_NUM)*(2-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<7)/WORD_NUM)*2-1;
                    end
                    3: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<7)/WORD_NUM)*(3-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<7)/WORD_NUM)*3-1;
                    end
                    5: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<7)/WORD_NUM)*(5-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<7)/WORD_NUM)*5-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            6:  case (xlen)
                    2: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<6)/WORD_NUM)*(2-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<6)/WORD_NUM)*2-1;
                    end
                    3: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<6)/WORD_NUM)*(3-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<6)/WORD_NUM)*3-1;
                    end
                    7: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<6)/WORD_NUM)*(7-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<6)/WORD_NUM)*7-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            5:  case (xlen)
                    4: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<5)/WORD_NUM)*(4-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<5)/WORD_NUM)*4-1;
                    end
                    5: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<5)/WORD_NUM)*(5-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<5)/WORD_NUM)*5-1;
                    end
                    12: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<5)/WORD_NUM)*(12-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<5)/WORD_NUM)*12-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            4:  case (xlen)
                    7: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<4)/WORD_NUM)*(7-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<4)/WORD_NUM)*7-1;
                    end
                    21: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<4)/WORD_NUM)*(21-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<4)/WORD_NUM)*21-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            3:  case (xlen)
                    14: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(14-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*14-1;
                    end
                    40: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<3)/WORD_NUM)*(40-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<3)/WORD_NUM)*40-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            2:  case (xlen)
                    27: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<2)/WORD_NUM)*(27-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<2)/WORD_NUM)*27-1;
                    end
                    78: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<2)/WORD_NUM)*(78-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<2)/WORD_NUM)*78-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            1:  case (xlen)
                    53: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<1)/WORD_NUM)*(53-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<1)/WORD_NUM)*53-1;
                    end
                    106: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<1)/WORD_NUM)*(106-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<1)/WORD_NUM)*106-1;
                    end
                    157: begin
                        MOD_SMALL_UNSIGNED_PTR_END = ((1<<1)/WORD_NUM)*(157-1);
                        ADD_MUL_SMALL_PTR_END      = ((1<<1)/WORD_NUM)*157-1;
                    end
                    default: begin
                        MOD_SMALL_UNSIGNED_PTR_END = 'x;
                        ADD_MUL_SMALL_PTR_END      = 'x;
                    end
                endcase
            default: begin
                MOD_SMALL_UNSIGNED_PTR_END = 'x;
                ADD_MUL_SMALL_PTR_END      = 'x;
            end 
        endcase
    end
end

/*
 * ZINT_MOD_SMALL_UNSIGNED
 */
// u = ptr / num
assign u_mod_small_unsigned = ((mod_small_unsigned_ptr & ~num_1) * WORD_NUM) >> logn; 
assign u_mod_small_unsigned_comb = ((mod_small_unsigned_ptr_comb & ~num_1) * WORD_NUM) >> logn;

always_comb begin
    if (len_valid)
        mod_small_unsigned_ptr_comb = 0;
    else if (new_state_mod_small_unsigned)
        mod_small_unsigned_ptr_comb = mod_small_unsigned_ptr + 1;
    else
        mod_small_unsigned_ptr_comb = mod_small_unsigned_ptr;
end

// fowarding
assign intt_forwarding_mod_small_unsigned = is_write && input_ptr / WORD_NUM == mod_small_unsigned_ptr && u_mod_small_unsigned == 0;
assign add_mul_small_forwarding_mod_small_unsigned = cc_out_valid_add_mul_small && read_xlast_mod_small_unsigned && mod_small_unsigned_ptr_comb == add_mul_small_ptr_reg && mod_small_unsigned_ptr_comb < MOD_SMALL_UNSIGNED_PTR_END;

// input buffer
genvar mod_small_unsigned_input_buffer_comb_idx;
generate
    for (mod_small_unsigned_input_buffer_comb_idx=0; mod_small_unsigned_input_buffer_comb_idx<WORD_NUM; mod_small_unsigned_input_buffer_comb_idx=mod_small_unsigned_input_buffer_comb_idx+1) begin
        always_comb begin
            if (intt_forwarding_mod_small_unsigned) // intt forwarding
                mod_small_unsigned_input_buffer_comb[mod_small_unsigned_input_buffer_comb_idx] = intt_output_buffer_comb[mod_small_unsigned_input_buffer_comb_idx];
            else if (add_mul_small_forwarding_mod_small_unsigned) // add_mul_small forwarding
                mod_small_unsigned_input_buffer_comb[mod_small_unsigned_input_buffer_comb_idx] = x_add_mul_small[mod_small_unsigned_input_buffer_comb_idx];
            else if (read_ena_mod_small_unsigned_reg)        
                mod_small_unsigned_input_buffer_comb[mod_small_unsigned_input_buffer_comb_idx] = QA[mod_small_unsigned_input_buffer_comb_idx];
            else
                mod_small_unsigned_input_buffer_comb[mod_small_unsigned_input_buffer_comb_idx] = mod_small_unsigned_input_buffer[mod_small_unsigned_input_buffer_comb_idx];
        end
    end
endgenerate

// in_valid
always_comb begin
    if (intt_forwarding_mod_small_unsigned)
        in_valid_mod_small_unsigned_comb = 1;
    else if (mod_small_unsigned_output_buffer_full_comb)
        in_valid_mod_small_unsigned_comb = 0;
    else if (add_mul_small_forwarding_mod_small_unsigned)
        in_valid_mod_small_unsigned_comb = 1;
    else if (read_ena_mod_small_unsigned_reg)        
        in_valid_mod_small_unsigned_comb = 1;
    else if (receive_mod_small_unsigned)
        in_valid_mod_small_unsigned_comb = 0;
    else
        in_valid_mod_small_unsigned_comb = in_valid_mod_small_unsigned;
end

always_comb begin
    if (state == S_EXE && read_ena_mod_small_unsigned)
        if (!(mod_small_unsigned_ptr_comb < MOD_SMALL_UNSIGNED_PTR_END) || mod_small_unsigned_ptr_comb > add_mul_small_ptr_reg) // TODO: restrict ptr stop point
            read_ena_mod_small_unsigned_comb = 0;
        else if (u_mod_small_unsigned == 0) // intt forwarding
            read_ena_mod_small_unsigned_comb = 0;
        else if (mod_small_unsigned_output_buffer_full_comb)
            read_ena_mod_small_unsigned_comb = 0;
        else if (mod_small_unsigned_ptr_comb == add_mul_small_ptr_reg && read_xlast_mod_small_unsigned)
            read_ena_mod_small_unsigned_comb = 0;
        else if (!is_read && !read_ena_add_mul_small_comb && mod_small_unsigned_ptr_comb < add_mul_small_ptr_reg)
            read_ena_mod_small_unsigned_comb = 1;
        else 
            read_ena_mod_small_unsigned_comb = 0;
    else 
        read_ena_mod_small_unsigned_comb = 0;
end

assign is_read_mod_small_unsigned_comb = is_read || read_ena_add_mul_small_comb;

// dlen
assign dlen_mod_small_unsigned_comb = u_mod_small_unsigned_comb; 
assign dlen_tmp_mod_small_unsigned = u_mod_small_unsigned_comb; 

// is_write
assign is_write_mod_small_unsigned = is_write || add_mul_small_output_buffer_full_comb;

// output buffer
always_comb begin
    if (!is_write_mod_small_unsigned)
        mod_small_unsigned_output_buffer_full_comb = 0;
    else if (out_valid_mod_small_unsigned)
        mod_small_unsigned_output_buffer_full_comb = 1;
    else
        mod_small_unsigned_output_buffer_full_comb = mod_small_unsigned_output_buffer_full;
end

always_comb begin
    if (out_valid_mod_small_unsigned || mod_small_unsigned_output_buffer_full)
        mod_small_unsigned_CEB = 1;
    else
        mod_small_unsigned_CEB = 0;
end

genvar mod_small_unsigned_output_buffer_comb_idx;
generate
    for (mod_small_unsigned_output_buffer_comb_idx=0; mod_small_unsigned_output_buffer_comb_idx<WORD_NUM; mod_small_unsigned_output_buffer_comb_idx=mod_small_unsigned_output_buffer_comb_idx+1) begin
        always_comb begin
            if (out_valid_mod_small_unsigned)
                if (!mod_small_unsigned_output_buffer_full) // buffer is empty
                    mod_small_unsigned_output_buffer_comb[mod_small_unsigned_output_buffer_comb_idx] = x_mod_small_unsigned[mod_small_unsigned_output_buffer_comb_idx];
                else if (mod_small_unsigned_output_buffer_full && !is_write) // buffer will be written and empty next cycle
                    mod_small_unsigned_output_buffer_comb[mod_small_unsigned_output_buffer_comb_idx] = x_mod_small_unsigned[mod_small_unsigned_output_buffer_comb_idx];
                else // TODO: handle buffer full condition
                    mod_small_unsigned_output_buffer_comb[mod_small_unsigned_output_buffer_comb_idx] = mod_small_unsigned_output_buffer[mod_small_unsigned_output_buffer_comb_idx];
            else
                mod_small_unsigned_output_buffer_comb[mod_small_unsigned_output_buffer_comb_idx] = mod_small_unsigned_output_buffer[mod_small_unsigned_output_buffer_comb_idx];
        end
    end
endgenerate

always_comb begin
    if (len_valid)
        mod_small_unsigned_ptr_reg_comb = mod_small_unsigned_ptr_comb;
    else if ((out_valid_mod_small_unsigned && !mod_small_unsigned_output_buffer_full_comb) || (mod_small_unsigned_output_buffer_full && !mod_small_unsigned_output_buffer_full_comb))
        mod_small_unsigned_ptr_reg_comb = mod_small_unsigned_ptr;
    else
        mod_small_unsigned_ptr_reg_comb = mod_small_unsigned_ptr_reg;
end

always_comb begin
    if (state == S_IDLE)
        mod_small_unsigned_AB_comb = 0;
    else if (out_valid_mod_small_unsigned) // TODO: check if correct
        mod_small_unsigned_AB_comb = mod_small_unsigned_ptr_reg & num_1;
    else
        mod_small_unsigned_AB_comb = mod_small_unsigned_AB;
end

/*
 * ZINT_ADD_MUL_SMALL
 */
// u = ptr / num
assign u_add_mul_small = ((add_mul_small_ptr & ~num_1) * WORD_NUM) >> logn; 
assign u_add_mul_small_comb = ((add_mul_small_ptr_comb & ~num_1) * WORD_NUM) >> logn; 

always_comb begin
    if (len_valid)
        add_mul_small_ptr_comb = (1 << inf_logn) / WORD_NUM;
    else if (new_state_add_mul_small)
        if (add_mul_small_ptr == ADD_MUL_SMALL_PTR_END)
            add_mul_small_ptr_comb = add_mul_small_ptr;
        else
            add_mul_small_ptr_comb = add_mul_small_ptr + 1;
    else
        add_mul_small_ptr_comb = add_mul_small_ptr;
end

// input buffer
genvar add_mul_small_input_buffer_comb_idx;
generate
    for (add_mul_small_input_buffer_comb_idx=0; add_mul_small_input_buffer_comb_idx<WORD_NUM; add_mul_small_input_buffer_comb_idx=add_mul_small_input_buffer_comb_idx+1) begin
        always_comb begin
            if (read_ena_add_mul_small_reg) // read from RF
                add_mul_small_input_buffer_comb[add_mul_small_input_buffer_comb_idx] = QA[add_mul_small_input_buffer_comb_idx];
            else if (mod_small_unsigned_ptr_reg == 0 && out_valid_mod_small_unsigned) // mod_small_unsigned forwarding
                add_mul_small_input_buffer_comb[add_mul_small_input_buffer_comb_idx] = x_mod_small_unsigned[add_mul_small_input_buffer_comb_idx];
            else
                add_mul_small_input_buffer_comb[add_mul_small_input_buffer_comb_idx] = add_mul_small_input_buffer[add_mul_small_input_buffer_comb_idx];
        end
    end
endgenerate

// in_valid
always_comb begin
    if (read_ena_add_mul_small_reg) // read from RF
        in_valid_add_mul_small_comb = 1;
    else if (mod_small_unsigned_ptr_reg == 0 && out_valid_mod_small_unsigned) // mod_small_unsigned forwarding
        in_valid_add_mul_small_comb = 1;
    else if (receive_add_mul_small)
        in_valid_add_mul_small_comb = 0;
    else 
        in_valid_add_mul_small_comb = in_valid_add_mul_small;
end

always_comb begin
    if ((add_mul_small_ptr - num / WORD_NUM) > mod_small_unsigned_ptr_reg_reg)
        mod_small_unsigned_not_write_comb = 1;
    else if ((add_mul_small_ptr - num / WORD_NUM) == mod_small_unsigned_ptr_reg_reg)
        if (mod_small_unsigned_ptr_reg_reg == MOD_SMALL_UNSIGNED_PTR_END)
            mod_small_unsigned_not_write_comb = 0;
        else
            mod_small_unsigned_not_write_comb = 1;
    else 
        mod_small_unsigned_not_write_comb = 0;
end

always_comb begin
    if (state == S_EXE && read_ena_add_mul_small)
        case (r_state_add_mul_small)
            READ_XQ: 
                if (mod_small_unsigned_ptr_reg == 0)
                    read_valid_add_mul_small = out_valid_mod_small_unsigned;
                else if (mod_small_unsigned_not_write || mod_small_unsigned_not_write_comb)
                    read_valid_add_mul_small = 0;
                else 
                    read_valid_add_mul_small = !is_read;
            READ_XP: 
                if (!is_read && add_mul_small_ptr < intt_AB)
                    read_valid_add_mul_small = 1;
                else 
                    read_valid_add_mul_small = 0;
            READ_X: 
                read_valid_add_mul_small = !is_read;
            default:
                read_valid_add_mul_small = 0;
        endcase
    else 
        read_valid_add_mul_small = 0;
end

always_comb begin
    if (state == S_EXE && read_ena_add_mul_small)
        case (r_state_add_mul_small)
            READ_XQ: 
                if (mod_small_unsigned_ptr_reg == 0) // mod_small_unsigned forwarding
                    read_ena_add_mul_small_comb = 0;
                else if (mod_small_unsigned_not_write || mod_small_unsigned_not_write_comb)
                    read_ena_add_mul_small_comb = 0;
                else 
                    read_ena_add_mul_small_comb = !is_read;
            READ_XP: 
                if (!is_read && add_mul_small_ptr < intt_AB)
                    read_ena_add_mul_small_comb = 1;
                else 
                    read_ena_add_mul_small_comb = 0;
            READ_X: 
                read_ena_add_mul_small_comb = !is_read;
            default:
                read_ena_add_mul_small_comb = 0;
        endcase
    else 
        read_ena_add_mul_small_comb = 0;
end

// len
assign len_i_add_mul_small_comb = u_add_mul_small_comb;

// is_write
assign is_write_add_mul_small = is_write;

// output buffer
always_comb begin
    if (out_valid_add_mul_small)
        add_mul_small_output_buffer_full_comb = 1;
    else if (!stall_add_mul_small)
        add_mul_small_output_buffer_full_comb = 0;
    else
        add_mul_small_output_buffer_full_comb = add_mul_small_output_buffer_full;
end

genvar add_mul_small_output_buffer_comb_idx;
generate
    for (add_mul_small_output_buffer_comb_idx=0; add_mul_small_output_buffer_comb_idx<WORD_NUM; add_mul_small_output_buffer_comb_idx=add_mul_small_output_buffer_comb_idx+1) begin
        always_comb begin
            if (out_valid_add_mul_small)
                if (!add_mul_small_output_buffer_full) // buffer is empty
                    add_mul_small_output_buffer_comb[add_mul_small_output_buffer_comb_idx] = x_add_mul_small[add_mul_small_output_buffer_comb_idx];
                else if (add_mul_small_output_buffer_full && !stall_add_mul_small) // buffer will be written and empty next cycle
                    add_mul_small_output_buffer_comb[add_mul_small_output_buffer_comb_idx] = x_add_mul_small[add_mul_small_output_buffer_comb_idx];
                else
                    add_mul_small_output_buffer_comb[add_mul_small_output_buffer_comb_idx] = add_mul_small_output_buffer[add_mul_small_output_buffer_comb_idx];
            else
                add_mul_small_output_buffer_comb[add_mul_small_output_buffer_comb_idx] = add_mul_small_output_buffer[add_mul_small_output_buffer_comb_idx];
        end
    end
endgenerate

always_comb begin
    if (len_valid)
        add_mul_small_ptr_reg_comb = add_mul_small_ptr_comb;
    else if (!add_mul_small_output_buffer_full_comb && add_mul_small_output_buffer_full && uB_add_mul_small == 1)
        add_mul_small_ptr_reg_comb = add_mul_small_ptr_reg + 1;
    else
        add_mul_small_ptr_reg_comb = add_mul_small_ptr_reg;
end

always_comb begin
    if (len_valid)
        vB_add_mul_small_comb = add_mul_small_ptr_comb;
    else if (!add_mul_small_output_buffer_full_comb && add_mul_small_output_buffer_full && uB_add_mul_small == 1)
        vB_add_mul_small_comb = vB_add_mul_small + 1;
    else
        vB_add_mul_small_comb = vB_add_mul_small;
end

always_comb begin
    if (out_valid_add_mul_small)
        if (!add_mul_small_output_buffer_full) // buffer is empty
            if (logn == 10)
                add_mul_small_AB_comb = (((uB_add_mul_small>>1) << logn) / WORD_NUM) | (vB_add_mul_small & num_1);
            else
                add_mul_small_AB_comb = ((uB_add_mul_small << logn) / WORD_NUM) | (vB_add_mul_small & num_1);
        else if (add_mul_small_output_buffer_full && !stall_add_mul_small) // buffer will be written and empty next cycle
            if (logn == 10)
                add_mul_small_AB_comb = (((uB_add_mul_small>>1) << logn) / WORD_NUM) | (vB_add_mul_small & num_1);
            else
                add_mul_small_AB_comb = ((uB_add_mul_small << logn) / WORD_NUM) | (vB_add_mul_small & num_1);
        else
           add_mul_small_AB_comb = add_mul_small_AB;
    else
        add_mul_small_AB_comb = add_mul_small_AB;
end

/*
 * prime
 */
assign mod_small_unsigned_round = (mod_small_unsigned_ptr & num_1) == 0 && mod_small_unsigned_ptr != 0;
assign add_mul_small_round = ({2'b0, vB_add_mul_small} & num_1) == num_1;

assign mod_small_unsigned_prime_valid = (state == S_IDLE && in_valid) || (mod_small_unsigned_round && out_valid_mod_small_unsigned);
assign add_mul_small_prime_valid = (state == S_IDLE && len_valid) || (prime_ena_add_mul_small && add_mul_small_round);

always_comb begin // TODO: may have race condition for MOD_SMALL_UNSIGNED & ADD_MUL_SMALL
    if (state == S_IDLE && len_valid)
        prime_idx = 1;
    else if (prime_ena_add_mul_small && add_mul_small_round)
        prime_idx = u_add_mul_small;
    else if (state == S_EXE && mod_small_unsigned_round && out_valid_mod_small_unsigned)
        prime_idx = u_mod_small_unsigned + 1;
    else
        prime_idx = 0;
end

always_comb begin
    if (add_mul_small_prime_valid) begin
        s_add_mul_small_comb = prime_comb.s;
        p_add_mul_small_comb = prime_comb.p;
        p0i_add_mul_small_comb = prime_comb.p0i;
    end
    else begin
        s_add_mul_small_comb = s_add_mul_small;
        p_add_mul_small_comb = p_add_mul_small;
        p0i_add_mul_small_comb = p0i_add_mul_small;
    end
end

always_comb begin
    if (mod_small_unsigned_prime_valid) begin
        p_mod_small_unsigned_comb = prime_comb.p;
        p0i_mod_small_unsigned_comb = prime_comb.p0i;
        R2_mod_small_unsigned_comb = prime_comb.R2;
    end
    else begin
        p_mod_small_unsigned_comb = p_mod_small_unsigned;
        p0i_mod_small_unsigned_comb = p0i_mod_small_unsigned;
        R2_mod_small_unsigned_comb = R2_mod_small_unsigned;
    end
end

/*
 * tmp
 */
// read
always_comb begin
    if (add_mul_small_round && len_add_mul_small == 1 && (num / WORD_NUM) > 1)
        if (out_valid_add_mul_small && uB_add_mul_small == 1 && !stall_add_mul_small)
            tmp_comb = tmp_o;
        else
            tmp_comb = tmp;
    else if (tmp_valid)
        tmp_comb = rf_tmp_QA;
    else
        tmp_comb = tmp;
end

always_comb begin
    if (add_mul_small_round && len_add_mul_small == 1 && uA_add_mul_small == 1 && (num / WORD_NUM) > 1)
        tmp_valid_comb = 0;
    else if (state == S_EXE && read_ena_add_mul_small && r_state_add_mul_small == READ_X)
        tmp_valid_comb = !is_read;
    else 
        tmp_valid_comb = 0;
end

always_comb begin
    rf_tmp_CENA = !tmp_valid_comb;
end

assign rf_tmp_AA = uA_add_mul_small;

// write
always_comb begin
    if (len_valid)
        rf_tmp_CENB_comb = 0;
    else if (add_mul_small_round && out_valid_add_mul_small)
        rf_tmp_CENB_comb = 0;
    else
        rf_tmp_CENB_comb = 1;
end

always_comb begin
    if (len_valid)
        rf_tmp_AB_comb = 1;
    else if (add_mul_small_round && out_valid_add_mul_small)
        rf_tmp_AB_comb = uB_add_mul_small;
    else 
        rf_tmp_AB_comb = 0;
end

always_comb begin
    if (len_valid)
        rf_tmp_DB_comb = 2147473409;
    else if (add_mul_small_round && out_valid_add_mul_small)
        rf_tmp_DB_comb = tmp_o;
    else 
        rf_tmp_DB_comb = 0;
end

/*
 * RF_CRT
 */
// write
always_comb begin
    if (mod_small_unsigned_CEB || add_mul_small_output_buffer_full_comb)
        CENB_comb = 0;
    else 
        CENB_comb = 1;
end

always_comb begin
    if (add_mul_small_output_buffer_full_comb)
        AB_comb = add_mul_small_AB_comb;
    else if (mod_small_unsigned_CEB)
        AB_comb = mod_small_unsigned_AB_comb;
    else
        AB_comb = 0;
end

always_comb begin
    if (add_mul_small_output_buffer_full_comb)
        DB_comb = {>> {add_mul_small_output_buffer_comb}};
    else if (mod_small_unsigned_CEB)
        DB_comb = {>> {mod_small_unsigned_output_buffer_comb}};
    else
        DB_comb = 0;
end

// read
assign CENA = !(read_ena_add_mul_small_comb || read_ena_mod_small_unsigned_comb);

always_comb begin
    if (logn == 10 && r_state_add_mul_small == READ_XQ)
        add_mul_small_AA = (1024 / WORD_NUM) | (add_mul_small_ptr & num_1);
    else 
        add_mul_small_AA = ((uA_add_mul_small << logn) / WORD_NUM) | (add_mul_small_ptr & num_1);
end
assign mod_small_unsigned_AA = ((uA_mod_small_unsigned << logn) / WORD_NUM) | (mod_small_unsigned_ptr_comb & num_1);

always_comb begin
    if (read_ena_add_mul_small_comb)
        AA = add_mul_small_AA;
    else
        AA = mod_small_unsigned_AA;
end

/*
 * output
 */
assign out_valid = add_mul_small_ptr_reg == ADD_MUL_SMALL_PTR_END && add_mul_small_output_buffer_full && !add_mul_small_output_buffer_full_comb;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
genvar mod_small_unsigned_input_buffer_idx;
generate
    for (mod_small_unsigned_input_buffer_idx=0; mod_small_unsigned_input_buffer_idx<WORD_NUM; mod_small_unsigned_input_buffer_idx=mod_small_unsigned_input_buffer_idx+1) begin
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                mod_small_unsigned_input_buffer[mod_small_unsigned_input_buffer_idx] <= 0;
            end
            else begin
                mod_small_unsigned_input_buffer[mod_small_unsigned_input_buffer_idx] <= mod_small_unsigned_input_buffer_comb[mod_small_unsigned_input_buffer_idx];
            end
        end
    end
endgenerate

genvar mod_small_unsigned_output_buffer_idx;
generate
    for (mod_small_unsigned_output_buffer_idx=0; mod_small_unsigned_output_buffer_idx<WORD_NUM; mod_small_unsigned_output_buffer_idx=mod_small_unsigned_output_buffer_idx+1) begin
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                mod_small_unsigned_output_buffer[mod_small_unsigned_output_buffer_idx] <= 0;
            end
            else begin
                mod_small_unsigned_output_buffer[mod_small_unsigned_output_buffer_idx] <= mod_small_unsigned_output_buffer_comb[mod_small_unsigned_output_buffer_idx];
            end
        end
    end
endgenerate

genvar add_mul_small_input_buffer_idx;
generate
    for (add_mul_small_input_buffer_idx=0; add_mul_small_input_buffer_idx<WORD_NUM; add_mul_small_input_buffer_idx=add_mul_small_input_buffer_idx+1) begin
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                add_mul_small_input_buffer[add_mul_small_input_buffer_idx] <= 0;
            end
            else begin
                add_mul_small_input_buffer[add_mul_small_input_buffer_idx] <= add_mul_small_input_buffer_comb[add_mul_small_input_buffer_idx];
            end
        end
    end
endgenerate

genvar add_mul_small_output_buffer_idx;
generate
    for (add_mul_small_output_buffer_idx=0; add_mul_small_output_buffer_idx<WORD_NUM; add_mul_small_output_buffer_idx=add_mul_small_output_buffer_idx+1) begin
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                add_mul_small_output_buffer[add_mul_small_output_buffer_idx] <= 0;
            end
            else begin
                add_mul_small_output_buffer[add_mul_small_output_buffer_idx] <= add_mul_small_output_buffer_comb[add_mul_small_output_buffer_idx];
            end
        end
    end
endgenerate

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= S_IDLE;
        num_1 <= 0;
        // ZINT_MOD_SMALL_UNSIGNED
        mod_small_unsigned_ptr <= 0;
        // u_mod_small_unsigned <= 0;
        in_valid_mod_small_unsigned <= 0;
        dlen_mod_small_unsigned <= 0;
        p_mod_small_unsigned <= 0;
        p0i_mod_small_unsigned <= 0;
        R2_mod_small_unsigned <= 0;
        mod_small_unsigned_output_buffer_full <= 0;
        mod_small_unsigned_AB <= 0;
        mod_small_unsigned_ptr_reg <= 0;
        mod_small_unsigned_ptr_reg_reg <= 0;
        is_read_mod_small_unsigned <= 0;
        // ZINT_ADD_MUL_SMALL
        mod_small_unsigned_not_write <= 0;
        add_mul_small_ptr <= 0;
        in_valid_add_mul_small <= 0;
        len_i_add_mul_small <= 0;
        s_add_mul_small <= 0;
        p_add_mul_small <= 0;
        p0i_add_mul_small <= 0;
        add_mul_small_output_buffer_full <= 0;
        add_mul_small_AB <= 0;
        add_mul_small_ptr_reg <= 0;
        vB_add_mul_small <= 0;
        intt_AB <= 0;
        stall_add_mul_small <= 0;
        read_ena_add_mul_small_reg <= 0;
        read_ena_mod_small_unsigned_reg <= 0;
        // tmp
        rf_tmp_CENB <= 0;
        rf_tmp_AB <= 0;
        rf_tmp_DB <= 0;
        tmp_valid <= 0;
        tmp <= 0;
    end
    else begin
        state <= next_state;
        num_1 <= num_1_comb;
        // ZINT_MOD_SMALL_UNSIGNED
        mod_small_unsigned_ptr <= mod_small_unsigned_ptr_comb;
        // u_mod_small_unsigned <= u_mod_small_unsigned_comb;
        in_valid_mod_small_unsigned <= in_valid_mod_small_unsigned_comb;
        dlen_mod_small_unsigned <= dlen_mod_small_unsigned_comb;
        p_mod_small_unsigned <= p_mod_small_unsigned_comb;
        p0i_mod_small_unsigned <= p0i_mod_small_unsigned_comb;
        R2_mod_small_unsigned <= R2_mod_small_unsigned_comb;
        mod_small_unsigned_output_buffer_full <= mod_small_unsigned_output_buffer_full_comb;
        mod_small_unsigned_AB <= mod_small_unsigned_AB_comb;
        mod_small_unsigned_ptr_reg <= mod_small_unsigned_ptr_reg_comb;
        mod_small_unsigned_ptr_reg_reg <= mod_small_unsigned_ptr_reg;
        is_read_mod_small_unsigned <= is_read_mod_small_unsigned_comb;
        // ZINT_ADD_MUL_SMALL
        mod_small_unsigned_not_write <= mod_small_unsigned_not_write_comb;
        add_mul_small_ptr <= add_mul_small_ptr_comb;
        in_valid_add_mul_small <= in_valid_add_mul_small_comb;
        len_i_add_mul_small <= len_i_add_mul_small_comb;
        s_add_mul_small <= s_add_mul_small_comb;
        p_add_mul_small <= p_add_mul_small_comb;
        p0i_add_mul_small <= p0i_add_mul_small_comb;
        add_mul_small_output_buffer_full <= add_mul_small_output_buffer_full_comb;
        add_mul_small_AB <= add_mul_small_AB_comb;
        add_mul_small_ptr_reg <= add_mul_small_ptr_reg_comb;
        vB_add_mul_small <= vB_add_mul_small_comb;
        intt_AB <= intt_AB_comb;
        stall_add_mul_small <= is_write_add_mul_small;
        read_ena_add_mul_small_reg <= read_ena_add_mul_small_comb;
        read_ena_mod_small_unsigned_reg <= read_ena_mod_small_unsigned_comb;
        // tmp
        rf_tmp_CENB <= rf_tmp_CENB_comb;
        rf_tmp_AB <= rf_tmp_AB_comb;
        rf_tmp_DB <= rf_tmp_DB_comb;
        tmp_valid <= tmp_valid_comb;
        tmp <= tmp_comb;
    end
end

endmodule

module PRIMES (
    idx,
    prime
);
import FALCON_Config::*;

input [8:0] idx; // TODO: PRIMES should have 522 index
output small_prime prime;

always_comb begin
    case (idx)       
        0: prime = {31'd2147473409, 31'd2042615807, 31'd10239, 31'd104837121};
        1: prime = {31'd2147389441, 31'd1862176767, 31'd471403745, 31'd285401085};
        2: prime = {31'd2147387393, 31'd1472104447, 31'd1329335065, 31'd675475453};
        3: prime = {31'd2147377153, 31'd1543397375, 31'd968223422, 31'd604299260};
        4: prime = {31'd2147358721, 31'd1572739071, 31'd132460015, 31'd575244282};
        5: prime = {31'd2147352577, 31'd2147352575, 31'd598693809, 31'd786425};
        6: prime = {31'd2147346433, 31'd498984959, 31'd1056257184, 31'd1649184761};
        7: prime = {31'd2147338241, 31'd331204607, 31'd421286710, 31'd1817151480};
        8: prime = {31'd2147309569, 31'd1908234239, 31'd1111201074, 31'd241164275};
        9: prime = {31'd2147297281, 31'd1774004223, 31'd1042003613, 31'd375902193};
        10: prime = {31'd2147295233, 31'd1006444543, 31'd19440033, 31'd1143488497};
        11: prime = {31'd2147239937, 31'd733759487, 31'd353296760, 31'd1419573222};
        12: prime = {31'd2147235841, 31'd867973119, 31'd1703918027, 31'd1285705701};
        13: prime = {31'd2147217409, 31'd2130440191, 31'd1258919613, 31'd25030624};
        14: prime = {31'd2147205121, 31'd1878769663, 31'd1089726929, 31'd277905373};
        15: prime = {31'd2147196929, 31'd1543217151, 31'd1946238668, 31'd614301659};
        16: prime = {31'd2147178497, 31'd1371232255, 31'd1347028164, 31'd788457430};
        17: prime = {31'd2147100673, 31'd1505372159, 31'd701164723, 31'd667004861};
        18: prime = {31'd2147082241, 31'd2079973375, 31'd617820870, 31'd96411574};
        19: prime = {31'd2147074049, 31'd1878638591, 31'd158382189, 31'd299564979};
        20: prime = {31'd2147051521, 31'd96036863, 31'd522758543, 31'd2087313323};
        21: prime = {31'd2147043329, 31'd1538869247, 31'd37227845, 31'd646922151};
        22: prime = {31'd2147039233, 31'd62470143, 31'd1133356428, 31'd2124122022};
        23: prime = {31'd2146988033, 31'd1324904447, 31'd73861329, 31'd877592463};
        24: prime = {31'd2146963457, 31'd2130186239, 31'd653019435, 31'd81280899};
        25: prime = {31'd2146959361, 31'd2146959359, 31'd995143093, 31'd66060161};
        26: prime = {31'd2146938881, 31'd1727508479, 31'd634921513, 31'd493518711};
        27: prime = {31'd2146908161, 31'd1672951807, 31'd1985060172, 31'd561430375};
        28: prime = {31'd2146885633, 31'd1006034943, 31'd298238186, 31'd1238925147};
        29: prime = {31'd2146871297, 31'd834054143, 31'd291810829, 31'd1418141523};
        30: prime = {31'd2146846721, 31'd196495359, 31'd915902322, 31'd2068819781};
        31: prime = {31'd2146834433, 31'd1572214783, 31'd47859524, 31'd700567357};
        32: prime = {31'd2146818049, 31'd1505089535, 31'd646281055, 31'd777510707};
        33: prime = {31'd2146775041, 31'd385167359, 31'd1597832891, 31'd1925295896};
        34: prime = {31'd2146756609, 31'd1840572415, 31'd1228090888, 31'd483581707};
        35: prime = {31'd2146744321, 31'd1001699327, 31'd1176377637, 31'd1331355395};
        36: prime = {31'd2146738177, 31'd469016575, 31'd1054971214, 31'd1868562175};
        37: prime = {31'd2146736129, 31'd1706334207, 31'd933422153, 31'd633261821};
        38: prime = {31'd2146713601, 31'd1878278143, 31'd1406621510, 31'd479428333};
        39: prime = {31'd2146695169, 31'd1068759039, 31'd1514178701, 31'd1304229600};
        40: prime = {31'd2146656257, 31'd468934655, 31'd384505091, 31'd1939177155};
        41: prime = {31'd2146650113, 31'd1001605119, 31'd537575289, 31'd1412609726};
        42: prime = {31'd2146646017, 31'd598947839, 31'd1799464037, 31'd1819090619};
        43: prime = {31'd2146643969, 31'd1458778111, 31'd1348954416, 31'd961601209};
        44: prime = {31'd2146603009, 31'd1861390335, 31'd1521547704, 31'd601362072};
        45: prime = {31'd2146572289, 31'd498210815, 31'd1310832121, 31'd1998323327};
        46: prime = {31'd2146547713, 31'd196196351, 31'd1019041349, 31'd182857321};
        47: prime = {31'd2146508801, 31'd1005658111, 31'd38582496, 31'd1569783367};
        48: prime = {31'd2146492417, 31'd1005641727, 31'd532424562, 31'd1591860792};
        49: prime = {31'd2146490369, 31'd1236326399, 31'd896447978, 31'd1364092470};
        50: prime = {31'd2146459649, 31'd1542479871, 31'd1327906900, 31'd1101643289};
        51: prime = {31'd2146447361, 31'd1995452415, 31'd958645253, 31'd667065869};
        52: prime = {31'd2146441217, 31'd2108692479, 31'd287271128, 31'd563133959};
        53: prime = {31'd2146437121, 31'd2142242815, 31'd2009822534, 31'd535830019};
        54: prime = {31'd2146430977, 31'd2129653759, 31'd1359155584, 31'd557850109};
        55: prime = {31'd2146418689, 31'd1877983231, 31'd1790248672, 31'd828603889};
        56: prime = {31'd2146406401, 31'd1324322815, 31'd1584833571, 31'd1401642469};
        57: prime = {31'd2146404353, 31'd1202685951, 31'd607120498, 31'd1526537699};
        58: prime = {31'd2146379777, 31'd1236215807, 31'd1897049071, 31'd1533851082};
        59: prime = {31'd2146363393, 31'd1303308287, 31'd1986921567, 31'd1495043513};
        60: prime = {31'd2146355201, 31'd61786111, 31'd849968120, 31'd603997616};
        61: prime = {31'd2146336769, 31'd1072594943, 31'd1655544036, 31'd1773338013};
        62: prime = {31'd2146312193, 31'd2079203327, 31'd273671831, 31'd813325698};
        63: prime = {31'd2146293761, 31'd1504565247, 31'd467406983, 31'd1423484270};
        64: prime = {31'd2146283521, 31'd653111295, 31'd1523950494, 31'd148573538};
        65: prime = {31'd2146203649, 31'd128743423, 31'd1170834574, 31'd844055814};
        66: prime = {31'd2146154497, 31'd732674047, 31'd1064856763, 31'd357229770};
        67: prime = {31'd2146142209, 31'd128681983, 31'd1406840151, 31'd991419579};
        68: prime = {31'd2146127873, 31'd116084735, 31'd2088393537, 31'd1040391337};
        69: prime = {31'd2146099201, 31'd1005248511, 31'd690673370, 31'd226909316};
        70: prime = {31'd2146093057, 31'd1135265791, 31'd315136610, 31'd113484924};
        71: prime = {31'd2146091009, 31'd1877655551, 31'd973539425, 31'd1523203194};
        72: prime = {31'd2146078721, 31'd1860866047, 31'd2132275436, 31'd1573530730};
        73: prime = {31'd2146060289, 31'd1269450751, 31'd360423481, 31'd69930065};
        74: prime = {31'd2146048001, 31'd497686527, 31'd1951981294, 31'd876227649};
        75: prime = {31'd2146041857, 31'd2146041855, 31'd2075683489, 31'd1392770105};
        76: prime = {31'd2146019329, 31'd1101637631, 31'd1753219918, 31'd356824090};
        77: prime = {31'd2145986561, 31'd698951679, 31'd2034028118, 31'd859515885};
        78: prime = {31'd2145976321, 31'd2145976319, 31'd1173377644, 31'd1591737311};
        79: prime = {31'd2145964033, 31'd1458098175, 31'd1281344586, 31'd172448717};
        80: prime = {31'd2145906689, 31'd2129129471, 31'd906178216, 31'd1839741819};
        81: prime = {31'd2145875969, 31'd933722111, 31'd1043521212, 31'd997100365};
        82: prime = {31'd2145871873, 31'd631728127, 31'd1399796492, 31'd1313684295};
        83: prime = {31'd2145841153, 31'd1592193023, 31'd1324527802, 31'd467495704};
        84: prime = {31'd2145832961, 31'd384225279, 31'd554084759, 31'd1705544460};
        85: prime = {31'd2145816577, 31'd1860603903, 31'd427340863, 31'd293251826};
        86: prime = {31'd2145785857, 31'd1571166207, 31'd316590738, 31'd703873730};
        87: prime = {31'd2145755137, 31'd1541775359, 31'd1684294304, 31'd859126417};
        88: prime = {31'd2145742849, 31'd1860530175, 31'd724873116, 31'd592255613};
        89: prime = {31'd2145728513, 31'd1134901247, 31'd431671476, 31'd1378452070};
        90: prime = {31'd2145699841, 31'd598001663, 31'd1619722537, 31'd2040248887};
        91: prime = {31'd2145691649, 31'd1369745407, 31'd982974435, 31'd1305709097};
        92: prime = {31'd2145687553, 31'd1705285631, 31'd1293154300, 31'd988856866};
        93: prime = {31'd2145673217, 31'd1541693439, 31'd881778029, 31'd1217403402};
        94: prime = {31'd2145630209, 31'd732149759, 31'd837364988, 31'd82162112};
        95: prime = {31'd2145595393, 31'd1457729535, 31'd851648427, 31'd1672997252};
        96: prime = {31'd2145587201, 31'd518197247, 31'd635342424, 31'd507074933};
        97: prime = {31'd2145525761, 31'd2078416895, 31'd1677228081, 31'd1412495623};
        98: prime = {31'd2145495041, 31'd1101113343, 31'd200685896, 31'd410439886};
        99: prime = {31'd2145466369, 31'd60897279, 31'd1809146322, 31'd1610328217};
        100: prime = {31'd2145445889, 31'd765519871, 31'd95316881, 31'd1023946866};
        101: prime = {31'd2145390593, 31'd2128613375, 31'd1428671135, 31'd2137032712};
        102: prime = {31'd2145372161, 31'd1939851263, 31'd159350694, 31'd294000611};
        103: prime = {31'd2145361921, 31'd1541382143, 31'd1589134749, 31'd756152271};
        104: prime = {31'd2145359873, 31'd1436522495, 31'd1561543010, 31'd873797579};
        105: prime = {31'd2145355777, 31'd1201637375, 31'd83865711, 31'd1134303171};
        106: prime = {31'd2145343489, 31'd295655423, 31'd641430002, 31'd2117539755};
        107: prime = {31'd2145325057, 31'd517935103, 31'd1528469895, 31'd2014406534};
        108: prime = {31'd2145318913, 31'd1872689151, 31'd65809740, 31'd701114233};
        109: prime = {31'd2145312769, 31'd1004462079, 31'd1919775760, 31'd1608791917};
        110: prime = {31'd2145300481, 31'd1188999167, 31'd1229540578, 31'd1505781588};
        111: prime = {31'd2145282049, 31'd1973315583, 31'd1964062701, 31'd846008110};
        112: prime = {31'd2145232897, 31'd27109375, 31'd450152063, 31'd985194184};
        113: prime = {31'd2145218561, 31'd1860005887, 31'd1794509700, 31'd1401538218};
        114: prime = {31'd2145187841, 31'd1335687167, 31'd1272467582, 31'd3255912};
        115: prime = {31'd2145181697, 31'd1004331007, 31'd1380363849, 31'd379614811};
        116: prime = {31'd2145175553, 31'd597477375, 31'd1316870546, 31'd831630926};
        117: prime = {31'd2145079297, 31'd115036159, 31'd1391797340, 31'd2060105083};
        118: prime = {31'd2145021953, 31'd249196543, 31'd720510798, 31'd255255800};
        119: prime = {31'd2145015809, 31'd26892287, 31'd1651459955, 31'd529448170};
        120: prime = {31'd2145003521, 31'd1503275007, 31'd1393381284, 31'd1304841422};
        121: prime = {31'd2144960513, 31'd1071218687, 31'd31937275, 31'd2112386154};
        122: prime = {31'd2144944129, 31'd1876508671, 31'd2019419520, 31'd1454699587};
        123: prime = {31'd2144935937, 31'd1004085247, 31'd1841489054, 31'd255194159};
        124: prime = {31'd2144894977, 31'd1071153151, 31'd157985831, 31'd565638093};
        125: prime = {31'd2144888833, 31'd1436051455, 31'd2128592228, 31'd258837438};
        126: prime = {31'd2144880641, 31'd1805142015, 31'd2076128344, 31'd2112377771};
        127: prime = {31'd2144864257, 31'd2140669951, 31'd2029969964, 31'd1933316995};
        128: prime = {31'd2144827393, 31'd932673535, 31'd406627220, 31'd1353329448};
        129: prime = {31'd2144806913, 31'd1234642943, 31'd1501080290, 31'd1255170805};
        130: prime = {31'd2144796673, 31'd2144796671, 31'd2084736519, 31'd449049307};
        131: prime = {31'd2144778241, 31'd1536604159, 31'd1746416203, 31'd1243677357};
        132: prime = {31'd2144759809, 31'd248934399, 31'd716464489, 31'd574718590};
        133: prime = {31'd2144757761, 31'd1972791295, 31'd1823728177, 31'd1019052665};
        134: prime = {31'd2144729089, 31'd1603663871, 31'd1836644881, 31'd1688496688};
        135: prime = {31'd2144727041, 31'd1054207999, 31'd520296412, 31'd114246186};
        136: prime = {31'd2144696321, 31'd395671551, 31'd852964281, 31'd1101730267};
        137: prime = {31'd2144667649, 31'd798296063, 31'd504992927, 31'd1014069648};
        138: prime = {31'd2144573441, 31'd361994239, 31'd1617144982, 31'd384264340};
        139: prime = {31'd2144555009, 31'd114511871, 31'd155821259, 31'd850911330};
        140: prime = {31'd2144550913, 31'd1876115455, 31'd1819937644, 31'd1285419095};
        141: prime = {31'd2144536577, 31'd1335035903, 31'd962942255, 31'd1998878768};
        142: prime = {31'd2144524289, 31'd1771231231, 31'd2471321, 31'd1713018894};
        143: prime = {31'd2144512001, 31'd1905436671, 31'd124190939, 31'd1729984492};
        144: prime = {31'd2144468993, 31'd2144468991, 31'd1260072806, 31'd2029645684};
        145: prime = {31'd2144458753, 31'd428988415, 31'd1569240563, 31'd1728720727};
        146: prime = {31'd2144421889, 31'd1536247807, 31'd1825620763, 31'd1100097262};
        147: prime = {31'd2144409601, 31'd1301354495, 31'd351648117, 31'd1496256203};
        148: prime = {31'd2144370689, 31'd1070628863, 31'd958186029, 31'd102592090};
        149: prime = {31'd2144348161, 31'd2039490559, 31'd540353574, 31'd1586757145};
        150: prime = {31'd2144335873, 31'd2140141567, 31'd919598847, 31'd1655717365};
        151: prime = {31'd2144329729, 31'd2077220863, 31'd1448552668, 31'd1803775459};
        152: prime = {31'd2144327681, 31'd2039470079, 31'd590222840, 31'd1869954525};
        153: prime = {31'd2144309249, 31'd1322225663, 31'd1459294624, 31'd699850150};
        154: prime = {31'd2144296961, 31'd466575359, 31'd1649016934, 31'd1727925634};
        155: prime = {31'd2144290817, 31'd2072987647, 31'd447427206, 31'd211250543};
        156: prime = {31'd2144243713, 31'd1859031039, 31'd893050215, 31'd1105829090};
        157: prime = {31'd2144237569, 31'd663648255, 31'd900860862, 31'd245460175};
        158: prime = {31'd2144161793, 31'd1187860479, 31'd1567868672, 31'd864054247};
        159: prime = {31'd2144155649, 31'd1133328383, 31'd1247993134, 31'd1013416916};
        160: prime = {31'd2144137217, 31'd516747263, 31'd515841070, 31'd1915890587};
        161: prime = {31'd2144120833, 31'd114077695, 31'd770877302, 31'd431450983};
        162: prime = {31'd2144071681, 31'd2127294463, 31'd964296120, 31'd1353652940};
        163: prime = {31'd2144065537, 31'd965466111, 31'd204564472, 31'd469697208};
        164: prime = {31'd2144028673, 31'd998983679, 31'd2091019760, 31'd1044628034};
        165: prime = {31'd2144010241, 31'd2144010239, 31'd1518702610, 31'd210561542};
        166: prime = {31'd2143952897, 31'd2076844031, 31'd475672271, 31'd1260480843};
        167: prime = {31'd2143940609, 31'd1053421567, 31'd1176750846, 31'd353089826};
        168: prime = {31'd2143918081, 31'd1971951615, 31'd786785803, 31'd1977729240};
        169: prime = {31'd2143899649, 31'd1187598335, 31'd1562292083, 31'd946034842};
        170: prime = {31'd2143891457, 31'd382283775, 31'd87166451, 31'd1897392255};
        171: prime = {31'd2143885313, 31'd1300830207, 31'd394460854, 31'd1091367018};
        172: prime = {31'd2143854593, 31'd466132991, 31'd133877196, 31'd341428226};
        173: prime = {31'd2143836161, 31'd1636325375, 31'd1861591875, 31'd1658036164};
        174: prime = {31'd2143762433, 31'd1669806079, 31'd1335934145, 31'd879521478};
        175: prime = {31'd2143756289, 31'd1002905599, 31'd102999236, 31'd1664362161};
        176: prime = {31'd2143713281, 31'd663123967, 31'd1156900308, 31'd704548378};
        177: prime = {31'd2143690753, 31'd2076581887, 31'd1926468019, 31'd1887528395};
        178: prime = {31'd2143670273, 31'd918933503, 31'd1756689401, 31'd1313428866};
        179: prime = {31'd2143666177, 31'd1875230719, 31'd986629565, 31'd442164595};
        180: prime = {31'd2143645697, 31'd1858433023, 31'd371842865, 31'd878294314};
        181: prime = {31'd2143641601, 31'd465919999, 31'd2023974350, 31'd209085723};
        182: prime = {31'd2143635457, 31'd461719551, 31'd1389027526, 31'd340235525};
        183: prime = {31'd2143621121, 31'd1589972991, 31'd1732632006, 31'd1655444690};
        184: prime = {31'd2143598593, 31'd998553599, 31'd1825417506, 31'd574659712};
        185: prime = {31'd2143567873, 31'd1875132415, 31'd1073787233, 31'd352855056};
        186: prime = {31'd2143561729, 31'd964962303, 31'd949167309, 31'd1393236986};
        187: prime = {31'd2143553537, 31'd1065617407, 31'd1652037534, 31'd1469238236};
        188: prime = {31'd2143541249, 31'd964941823, 31'd1097027618, 31'd1835819951};
        189: prime = {31'd2143531009, 31'd1724100607, 31'd478640055, 31'd1301070729};
        190: prime = {31'd2143522817, 31'd1321439231, 31'd1550531668, 31'd1882235755};
        191: prime = {31'd2143506433, 31'd113463295, 31'd1824320165, 31'd1305187118};
        192: prime = {31'd2143488001, 31'd1333987327, 31'd1604011510, 31'd496317161};
        193: prime = {31'd2143469569, 31'd1875034111, 31'd502095196, 31'd369468068};
        194: prime = {31'd2143426561, 31'd495065087, 31'd1044637111, 31'd582363650};
        195: prime = {31'd2143383553, 31'd1858170879, 31'd1902463734, 31'd221802846};
        196: prime = {31'd2143377409, 31'd830560255, 31'd2056861771, 31'd1392025927};
        197: prime = {31'd2143363073, 31'd1002512383, 31'd1965915971, 31'd1559429392};
        198: prime = {31'd2143260673, 31'd1321177087, 31'd1523257541, 31'd1589051265};
        199: prime = {31'd2143246337, 31'd293558271, 31'd764541916, 31'd829945672};
        200: prime = {31'd2143209473, 31'd58640383, 31'd1920672844, 31'd1997592246};
        201: prime = {31'd2143203329, 31'd1186902015, 31'd2049774209, 31'd1028685469};
        202: prime = {31'd2143160321, 31'd528353279, 31'd728535665, 31'd655189488};
        203: prime = {31'd2143129601, 31'd247304191, 31'd603052992, 31'd1743957364};
        204: prime = {31'd2143123457, 31'd394098687, 31'd8348679, 31'd1760492891};
        205: prime = {31'd2143100929, 31'd1002250239, 31'd694209023, 31'd1755307263};
        206: prime = {31'd2143092737, 31'd2143092735, 31'd1979934533, 31'd837147869};
        207: prime = {31'd2143082497, 31'd159176703, 31'd2026175670, 31'd950516915};
        208: prime = {31'd2143062017, 31'd2004649983, 31'd377451099, 31'd1808981087};
        209: prime = {31'd2143051777, 31'd1539071999, 31'd979255473, 31'd411024436};
        210: prime = {31'd2143025153, 31'd1065089023, 31'd1449196896, 31'd1619370950};
        211: prime = {31'd2143006721, 31'd1723576319, 31'd1739650365, 31'd1476508537};
        212: prime = {31'd2142996481, 31'd125536255, 31'd996160050, 31'd1215746894};
        213: prime = {31'd2142976001, 31'd595277823, 31'd1166847574, 31'd1326011128};
        214: prime = {31'd2142965761, 31'd515575807, 31'd661974566, 31'd1697037005};
        215: prime = {31'd2142916609, 31'd649744383, 31'd1787161127, 31'd837872124};
        216: prime = {31'd2142892033, 31'd1052372991, 31'd675335382, 31'd1156487571};
        217: prime = {31'd2142885889, 31'd427415551, 31'd1323096997, 31'd1961412985};
        218: prime = {31'd2142871553, 31'd1538891775, 31'd1411877159, 31'd1277253947};
        219: prime = {31'd2142861313, 31'd1467578367, 31'd1438410687, 31'd1653561615};
        220: prime = {31'd2142830593, 31'd2142830591, 31'd1767860634, 31'd1903351946};
        221: prime = {31'd2142803969, 31'd628660223, 31'd359782919, 31'd2081783830};
        222: prime = {31'd2142785537, 31'd1723355135, 31'd513932862, 31'd1555937221};
        223: prime = {31'd2142779393, 31'd1937258495, 31'd218943121, 31'd1532313514};
        224: prime = {31'd2142724097, 31'd465002495, 31'd416687049, 31'd446568117};
        225: prime = {31'd2142707713, 31'd1001857023, 31'd1356813523, 31'd431519340};
        226: prime = {31'd2142658561, 31'd1538678783, 31'd2074011722, 31'd1479292304};
        227: prime = {31'd2142638081, 31'd1052119039, 31'd1647339939, 31'd491459891};
        228: prime = {31'd2142564353, 31'd515174399, 31'd1483107336, 31'd1341494243};
        229: prime = {31'd2142533633, 31'd125073407, 31'd1135938817, 31'd633873237};
        230: prime = {31'd2142529537, 31'd359950335, 31'd1531961857, 31'd539953986};
        231: prime = {31'd2142527489, 31'd1538547711, 31'd1725566162, 31'd1576899385};
        232: prime = {31'd2142502913, 31'd2142502911, 31'd182053257, 31'd1822413511};
        233: prime = {31'd2142498817, 31'd2125721599, 31'd701443447, 31'd1981317812};
        234: prime = {31'd2142416897, 31'd1186115583, 31'd411931819, 31'd1526436147};
        235: prime = {31'd2142363649, 31'd2075254783, 31'd1517191733, 31'd428150837};
        236: prime = {31'd2142351361, 31'd649179135, 31'd1575712703, 31'd159866874};
        237: prime = {31'd2142330881, 31'd464609279, 31'd1769087884, 31'd1101148056};
        238: prime = {31'd2142314497, 31'd1001463807, 31'd1833745524, 31'd1175654217};
        239: prime = {31'd2142289921, 31'd1873854463, 31'd1714775493, 31'd1227755218};
        240: prime = {31'd2142283777, 31'd292595711, 31'd1070584533, 31'd894867124};
        241: prime = {31'd2142277633, 31'd783323135, 31'd702157145, 31'd637845142};
        242: prime = {31'd2142263297, 31'd1634752511, 31'd431364395, 31'd333162064};
        243: prime = {31'd2142208001, 31'd1068466175, 31'd2053967982, 31'd884919617};
        244: prime = {31'd2142164993, 31'd695130111, 31'd1031836848, 31'd802276460};
        245: prime = {31'd2142097409, 31'd917360639, 31'd712772031, 31'd1145355034};
        246: prime = {31'd2142087169, 31'd23963647, 31'd822276067, 31'd310534886};
        247: prime = {31'd2142078977, 31'd1735231487, 31'd1765268066, 31'd1079687869};
        248: prime = {31'd2142074881, 31'd393050111, 31'd643204925, 31'd443810472};
        249: prime = {31'd2142044161, 31'd2142044159, 31'd1297890174, 31'd2104871437};
        250: prime = {31'd2142025729, 31'd996980735, 31'd1000425730, 31'd1870023087};
        251: prime = {31'd2142011393, 31'd1068269567, 31'd1679401033, 31'd255510885};
        252: prime = {31'd2141974529, 31'd2125197311, 31'd468119557, 31'd755054760};
        253: prime = {31'd2141943809, 31'd2003531775, 31'd449305555, 31'd45250569};
        254: prime = {31'd2141933569, 31'd111890431, 31'd841867925, 31'd230250452};
        255: prime = {31'd2141931521, 31'd996886527, 31'd743823916, 31'd1577705418};
        256: prime = {31'd2141902849, 31'd1768609791, 31'd401687910, 31'd2050053941};
        257: prime = {31'd2141890561, 31'd1902815231, 31'd1720336972, 31'd310546164};
        258: prime = {31'd2141857793, 31'd1500129279, 31'd663880489, 31'd11873864};
        259: prime = {31'd2141833217, 31'd1399441407, 31'd1819208266, 31'd1204553159};
        260: prime = {31'd2141820929, 31'd1969854463, 31'd1403090096, 31'd1185344902};
        261: prime = {31'd2141786113, 31'd1588137983, 31'd1523542501, 31'd994747597};
        262: prime = {31'd2141771777, 31'd1231607807, 31'd463556492, 31'd2002613377};
        263: prime = {31'd2141759489, 31'd292071423, 31'd2124928282, 31'd1359594559};
        264: prime = {31'd2141749249, 31'd1068007423, 31'd940339153, 31'd1055671304};
        265: prime = {31'd2141685761, 31'd1197967359, 31'd477141499, 31'd1735645874};
        266: prime = {31'd2141673473, 31'd291985407, 31'd1122558298, 31'd1076249199};
        267: prime = {31'd2141669377, 31'd2070366207, 31'd1373818177, 31'd1637814873};
        268: prime = {31'd2141655041, 31'd514265087, 31'd296887082, 31'd1727300107};
        269: prime = {31'd2141587457, 31'd526780415, 31'd1585913875, 31'd679119000};
        270: prime = {31'd2141583361, 31'd1600518143, 31'd1802457360, 31'd1949149314};
        271: prime = {31'd2141575169, 31'd1499846655, 31'd712760980, 31'd307263572};
        272: prime = {31'd2141546497, 31'd1164273663, 31'd1250270109, 31'd2048202678};
        273: prime = {31'd2141515777, 31'd514125823, 31'd356001130, 31'd2076901131};
        274: prime = {31'd2141495297, 31'd463773695, 31'd1060744866, 31'd1008950936};
        275: prime = {31'd2141483009, 31'd1319399423, 31'd1168297026, 31'd773094995};
        276: prime = {31'd2141458433, 31'd2124681215, 31'd733225819, 31'd1212440009};
        277: prime = {31'd2141360129, 31'd1856147455, 31'd948342276, 31'd127724442};
        278: prime = {31'd2141325313, 31'd1600260095, 31'd2129965998, 31'd77353682};
        279: prime = {31'd2141317121, 31'd1566697471, 31'd1843844634, 31'd545807011};
        280: prime = {31'd2141286401, 31'd1856073727, 31'd1750465696, 31'd1898777074};
        281: prime = {31'd2141267969, 31'd694233087, 31'd186160720, 31'd1908734343};
        282: prime = {31'd2141255681, 31'd258013183, 31'd1876677959, 31'd867547455};
        283: prime = {31'd2141243393, 31'd1667287039, 31'd1340009628, 31'd130119927};
        284: prime = {31'd2141214721, 31'd1633703935, 31'd1087819477, 31'd1731956816};
        285: prime = {31'd2141212673, 31'd1721782271, 31'd1786328049, 31'd1756710980};
        286: prime = {31'd2141202433, 31'd2036344831, 31'd940682169, 31'd2007048200};
        287: prime = {31'd2141175809, 31'd1872740351, 31'd993089586, 31'd1503967083};
        288: prime = {31'd2141165569, 31'd1432328191, 31'd289019479, 31'd372547374};
        289: prime = {31'd2141073409, 31'd916336639, 31'd507864514, 31'd1824245002};
        290: prime = {31'd2141052929, 31'd2073944063, 31'd311252465, 31'd1850586255};
        291: prime = {31'd2141040641, 31'd647868415, 31'd280941862, 31'd1843254341};
        292: prime = {31'd2141028353, 31'd1067286527, 31'd375035110, 31'd2139730939};
        293: prime = {31'd2141011969, 31'd1872576511, 31'd164696620, 31'd152941463};
        294: prime = {31'd2140999681, 31'd1587351551, 31'd966175067, 31'd1158320973};
        295: prime = {31'd2140997633, 31'd794626047, 31'd1290889438, 31'd2069087041};
        296: prime = {31'd2140993537, 31'd1331492863, 31'd375366253, 31'd1774938920};
        297: prime = {31'd2140942337, 31'd1989947391, 31'd785367828, 31'd2016993776};
        298: prime = {31'd2140925953, 31'd2124148735, 31'd836552317, 31'd725021067};
        299: prime = {31'd2140917761, 31'd1989922815, 31'd1001839569, 31'd1352061273};
        300: prime = {31'd2140887041, 31'd1364940799, 31'd2098732796, 31'd1694804124};
        301: prime = {31'd2140837889, 31'd1163565055, 31'd924094810, 31'd627036011};
        302: prime = {31'd2140788737, 31'd425318399, 31'd2045368990, 31'd139511352};
        303: prime = {31'd2140766209, 31'd1067024383, 31'd1800295504, 31'd916565419};
        304: prime = {31'd2140764161, 31'd1465481215, 31'd2106792035, 31'd648623518};
        305: prime = {31'd2140696577, 31'd1318612991, 31'd1885987531, 31'd823815155};
        306: prime = {31'd2140684289, 31'd1872248831, 31'd1098116827, 31'd1064905637};
        307: prime = {31'd2140653569, 31'd1935132671, 31'd1796728247, 31'd856570593};
        308: prime = {31'd2140594177, 31'd999743487, 31'd377310938, 31'd1415973220};
        309: prime = {31'd2140579841, 31'd827762687, 31'd1504505945, 31'd400353543};
        310: prime = {31'd2140569601, 31'd1066827775, 31'd358291016, 31'd845588677};
        311: prime = {31'd2140567553, 31'd659978239, 31'd1909137143, 31'd1388077240};
        312: prime = {31'd2140557313, 31'd647385087, 31'd1175330270, 31'd2086590582};
        313: prime = {31'd2140549121, 31'd915812351, 31'd525007007, 31'd228710464};
        314: prime = {31'd2140477441, 31'd223680511, 31'd1031159814, 31'd1507849837};
        315: prime = {31'd2140469249, 31'd1330968575, 31'd1029951320, 31'd967173687};
        316: prime = {31'd2140426241, 31'd1720995839, 31'd1676273461, 31'd1415361820};
        317: prime = {31'd2140420097, 31'd861157375, 31'd846024476, 31'd560268531};
        318: prime = {31'd2140413953, 31'd2073305087, 31'd1816354149, 31'd1921590475};
        319: prime = {31'd2140383233, 31'd559130623, 31'd1296921241, 31'd1306502143};
        320: prime = {31'd2140366849, 31'd1699964927, 31'd147196204, 31'd1327258514};
        321: prime = {31'd2140354561, 31'd592656383, 31'd1349052107, 31'd1162402624};
        322: prime = {31'd2140348417, 31'd999497727, 31'd1860485634, 31'd1193976599};
        323: prime = {31'd2140323841, 31'd1871888383, 31'd1790256483, 31'd2080285299};
        324: prime = {31'd2140321793, 31'd458405887, 31'd150031888, 31'd1495593573};
        325: prime = {31'd2140315649, 31'd462594047, 31'd395510935, 31'd1932509756};
        326: prime = {31'd2140280833, 31'd491919359, 31'd831417909, 31'd136532305};
        327: prime = {31'd2140250113, 31'd1536270335, 31'd697349101, 31'd1334083714};
        328: prime = {31'd2140229633, 31'd1183928319, 31'd243875754, 31'd1047863287};
        329: prime = {31'd2140223489, 31'd55654399, 31'd1396270850, 31'd484618189};
        330: prime = {31'd2140200961, 31'd999350271, 31'd1895572209, 31'd1209925428};
        331: prime = {31'd2140162049, 31'd1800423423, 31'd2045297469, 31'd1173075498};
        332: prime = {31'd2140149761, 31'd2102401023, 31'd785217995, 31'd1794885078};
        333: prime = {31'd2140137473, 31'd2102388735, 31'd536866543, 31'd580611457};
        334: prime = {31'd2140119041, 31'd1536139263, 31'd1740434653, 31'd399408386};
        335: prime = {31'd2140090369, 31'd1452224511, 31'd21051094, 31'd526257212};
        336: prime = {31'd2140076033, 31'd1867446271, 31'd319910029, 31'd1210502105};
        337: prime = {31'd2140047361, 31'd1464764415, 31'd1488632070, 31'd1680585490};
        338: prime = {31'd2140041217, 31'd244215807, 31'd2012026134, 31'd1232411367};
        339: prime = {31'd2140008449, 31'd1049489407, 31'd1613440760, 31'd839477762};
        340: prime = {31'd2139924481, 31'd1363978239, 31'd1280649481, 31'd742242227};
        341: prime = {31'd2139906049, 31'd1535926271, 31'd1185646076, 31'd2047498033};
        342: prime = {31'd2139867137, 31'd860604415, 31'd372783595, 31'd1581596188};
        343: prime = {31'd2139842561, 31'd1699440639, 31'd216848235, 31'd606264684};
        344: prime = {31'd2139826177, 31'd155920383, 31'd1784999464, 31'd1345213687};
        345: prime = {31'd2139824129, 31'd998973439, 31'd1513323027, 31'd673166568};
        346: prime = {31'd2139789313, 31'd1162516479, 31'd858192859, 31'd1240169454};
        347: prime = {31'd2139783169, 31'd1066041343, 31'd1583261448, 31'd1845433282};
        348: prime = {31'd2139770881, 31'd646598655, 31'd179702100, 31'd1144304489};
        349: prime = {31'd2139768833, 31'd1263159295, 31'd964612676, 31'd700394330};
        350: prime = {31'd2139666433, 31'd2068363263, 31'd764666914, 31'd2116696178};
        351: prime = {31'd2139641857, 31'd1632131071, 31'd1313764644, 31'd379117501};
        352: prime = {31'd2139635713, 31'd1871200255, 31'd519212449, 31'd669765520};
        353: prime = {31'd2139598849, 31'd1720168447, 31'd1769667104, 31'd1871113857};
        354: prime = {31'd2139574273, 31'd109531135, 31'd820739925, 31'd1340296651};
        355: prime = {31'd2139568129, 31'd1665611775, 31'd472447405, 31'd327949725};
        356: prime = {31'd2139549697, 31'd1585901567, 31'd1412328531, 31'd2026384661};
        357: prime = {31'd2139537409, 31'd1871101951, 31'd1609362979, 31'd686230713};
        358: prime = {31'd2139475969, 31'd914739199, 31'd1696720421, 31'd688700142};
        359: prime = {31'd2139455489, 31'd1065713663, 31'd1584935400, 31'd240323156};
        360: prime = {31'd2139432961, 31'd1766139903, 31'd950121150, 31'd1579051435};
        361: prime = {31'd2139424769, 31'd793053183, 31'd1635486858, 31'd1152448877};
        362: prime = {31'd2139406337, 31'd1870970879, 31'd1674423301, 31'd1756743906};
        363: prime = {31'd2139396097, 31'd1698994175, 31'd1483470544, 31'd724304020};
        364: prime = {31'd2139383809, 31'd356804607, 31'd1741699084, 31'd1047939127};
        365: prime = {31'd2139369473, 31'd1988374527, 31'd1242798709, 31'd740399050};
        366: prime = {31'd2139351041, 31'd1027860479, 31'd2120712049, 31'd1259183934};
        367: prime = {31'd2139334657, 31'd558082047, 31'd1427249225, 31'd1106564801};
        368: prime = {31'd2139332609, 31'd1535352831, 31'd623011170, 31'd323274417};
        369: prime = {31'd2139310081, 31'd994265087, 31'd1605466350, 31'd822294021};
        370: prime = {31'd2139303937, 31'd1451438079, 31'd828392831, 31'd941413846};
        371: prime = {31'd2139301889, 31'd155396095, 31'd1788073219, 31'd284925382};
        372: prime = {31'd2139283457, 31'd998432767, 31'd595079358, 31'd1174816057};
        373: prime = {31'd2139248641, 31'd21125119, 31'd573424177, 31'd1158370349};
        374: prime = {31'd2139240449, 31'd323106815, 31'd885781403, 31'd1635372014};
        375: prime = {31'd2139222017, 31'd1048702975, 31'd1221054839, 31'd529105759};
        376: prime = {31'd2139215873, 31'd423745535, 31'd1724006500, 31'd1738660656};
        377: prime = {31'd2139150337, 31'd1228986367, 31'd1609133294, 31'd834832690};
        378: prime = {31'd2139144193, 31'd1870708735, 31'd1137491905, 31'd792838402};
        379: prime = {31'd2139117569, 31'd1631606783, 31'd964728507, 31'd1490094130};
        380: prime = {31'd2139076609, 31'd1799337983, 31'd756508944, 31'd1074509552};
        381: prime = {31'd2139062273, 31'd1065320447, 31'd884826059, 31'd1086291583};
        382: prime = {31'd2139045889, 31'd1870610431, 31'd1202295476, 31'd1912618494};
        383: prime = {31'd2139033601, 31'd511643647, 31'd632234634, 31'd213667228};
        384: prime = {31'd2139006977, 31'd826189823, 31'd231626690, 31'd428870857};
        385: prime = {31'd2138951681, 31'd914214911, 31'd838350879, 31'd1657281297};
        386: prime = {31'd2138945537, 31'd1262335999, 31'd404460202, 31'd1936601824};
        387: prime = {31'd2138920961, 31'd1899845631, 31'd1282911681, 31'd1675958811};
        388: prime = {31'd2138910721, 31'd377303039, 31'd103472415, 31'd2104973769};
        389: prime = {31'd2138904577, 31'd222107647, 31'd993513549, 31'd752728471};
        390: prime = {31'd2138902529, 31'd1585254399, 31'd1055904361, 31'd1744828807};
        391: prime = {31'd2138816513, 31'd1870381055, 31'd1706202469, 31'd1854355152};
        392: prime = {31'd2138810369, 31'd557557759, 31'd405677177, 31'd1669123742};
        393: prime = {31'd2138787841, 31'd108744703, 31'd1964773901, 31'd215262694};
        394: prime = {31'd2138775553, 31'd997924863, 31'd1247087473, 31'd631297410};
        395: prime = {31'd2138767361, 31'd2138767359, 31'd1576073565, 31'd364868927};
        396: prime = {31'd2138757121, 31'd1765464063, 31'd993541415, 31'd1826188524};
        397: prime = {31'd2138748929, 31'd456833023, 31'd1043206483, 31'd1864213673};
        398: prime = {31'd2138744833, 31'd1899669503, 31'd800141243, 31'd864597127};
        399: prime = {31'd2138738689, 31'd1853526015, 31'd1450660558, 31'd1567347797};
        400: prime = {31'd2138695681, 31'd1564076031, 31'd342611472, 31'd62952179};
        401: prime = {31'd2138658817, 31'd825841663, 31'd672674190, 31'd520016323};
        402: prime = {31'd2138644481, 31'd997793791, 31'd1538874380, 31'd1913073997};
        403: prime = {31'd2138632193, 31'd511242239, 31'd686911254, 31'd1603858663};
        404: prime = {31'd2138607617, 31'd779653119, 31'd1435142134, 31'd1898917915};
        405: prime = {31'd2138591233, 31'd1719160831, 31'd1290458549, 31'd633692050};
        406: prime = {31'd2138572801, 31'd2134378495, 31'd2011138646, 31'd124729080};
        407: prime = {31'd2138552321, 31'd1798813695, 31'd1076414907, 31'd600407629};
        408: prime = {31'd2138546177, 31'd1534566399, 31'd2108985273, 31'd1549618714};
        409: prime = {31'd2138533889, 31'd779579391, 31'd198172413, 31'd1537879475};
        410: prime = {31'd2138523649, 31'd2067220479, 31'd1277003968, 31'd1404296541};
        411: prime = {31'd2138490881, 31'd53921791, 31'd1976858109, 31'd687160393};
        412: prime = {31'd2138460161, 31'd645287935, 31'd1979278293, 31'd1447009094};
        413: prime = {31'd2138429441, 31'd1496700927, 31'd203441928, 31'd1971778114};
        414: prime = {31'd2138400769, 31'd1161127935, 31'd628395069, 31'd1327661390};
        415: prime = {31'd2138398721, 31'd460677119, 31'd758486760, 31'd123160892};
        416: prime = {31'd2138376193, 31'd792004607, 31'd977554090, 31'd262426748};
        417: prime = {31'd2138351617, 31'd1362405375, 31'd2004708503, 31'd415473578};
        418: prime = {31'd2138337281, 31'd1316253695, 31'd1049002108, 31'd2136528688};
        419: prime = {31'd2138320897, 31'd1987325951, 31'd1442269609, 31'd1250829987};
        420: prime = {31'd2138290177, 31'd724809727, 31'd1647139103, 31'd1851491739};
        421: prime = {31'd2138234881, 31'd997384191, 31'd1746591962, 31'd1742840765};
        422: prime = {31'd2138214401, 31'd1853001727, 31'd781416444, 31'd1208886027};
        423: prime = {31'd2138202113, 31'd1534222335, 31'd1622508515, 31'd867025568};
        424: prime = {31'd2138191873, 31'd322058239, 31'd1025408615, 31'd1171202631};
        425: prime = {31'd2138183681, 31'd489822207, 31'd827063290, 31'd1994488320};
        426: prime = {31'd2138173441, 31'd1047654399, 31'd749670117, 31'd541258150};
        427: prime = {31'd2138103809, 31'd997253119, 31'd2126787647, 31'd546029380};
        428: prime = {31'd2138099713, 31'd1450233855, 31'd1892961817, 31'd599404320};
        429: prime = {31'd2138085377, 31'd623941631, 31'd1525506535, 31'd1052780194};
        430: prime = {31'd2138060801, 31'd1932539903, 31'd1259580138, 31'd656641481};
        431: prime = {31'd2138044417, 31'd2133850111, 31'd1731266562, 31'd356881720};
        432: prime = {31'd2138042369, 31'd2121265151, 31'd1627902259, 31'd624749862};
        433: prime = {31'd2138032129, 31'd1932511231, 31'd1108640984, 31'd2091025612};
        434: prime = {31'd2138011649, 31'd925857791, 31'd1017980050, 31'd1382229014};
        435: prime = {31'd2137993217, 31'd1450127359, 31'd1351778704, 31'd1040313202};
        436: prime = {31'd2137888769, 31'd892180479, 31'd1053090405, 31'd2074742732};
        437: prime = {31'd2137853953, 31'd1584205823, 31'd1254192789, 31'd1610581650};
        438: prime = {31'd2137833473, 31'd1869398015, 31'd896995556, 31'd1851446745};
        439: prime = {31'd2137817089, 31'd1064075263, 31'd1251031181, 31'd515757380};
        440: prime = {31'd2137792513, 31'd2070683647, 31'd368077456, 31'd596907109};
        441: prime = {31'd2137786369, 31'd1059850239, 31'd1035375025, 31'd273204269};
        442: prime = {31'd2137767937, 31'd1869332479, 31'd1156563902, 31'd1896977286};
        443: prime = {31'd2137755649, 31'd1315672063, 31'd1686559583, 31'd1935229718};
        444: prime = {31'd2137724929, 31'd1831540735, 31'd1681096331, 31'd1226383869};
        445: prime = {31'd2137704449, 31'd1126877183, 31'd630551727, 31'd386851137};
        446: prime = {31'd2137673729, 31'd644501503, 31'd1892091571, 31'd714854439};
        447: prime = {31'd2137620481, 31'd1063878655, 31'd48456461, 31'd1092800060};
        448: prime = {31'd2137618433, 31'd1462335487, 31'd1713336725, 31'd974978601};
        449: prime = {31'd2137581569, 31'd757655551, 31'd1378891359, 31'd301952211};
        450: prime = {31'd2137538561, 31'd1869103103, 31'd1950165220, 31'd846220099};
        451: prime = {31'd2137526273, 31'd2120749055, 31'd1500789441, 31'd160717520};
        452: prime = {31'd2137516033, 31'd2099767295, 31'd1499525372, 31'd1603574385};
        453: prime = {31'd2137491457, 31'd1193773055, 31'd556382829, 31'd1655024011};
        454: prime = {31'd2137440257, 31'd1869004799, 31'd412760291, 31'd1759610794};
        455: prime = {31'd2137374721, 31'd1868939263, 31'd1954137185, 31'd382305598};
        456: prime = {31'd2137362433, 31'd241537023, 31'd861024672, 31'd1623749834};
        457: prime = {31'd2137313281, 31'd1449447423, 31'd980638386, 31'd1088680694};
        458: prime = {31'd2137311233, 31'd589613055, 31'd1793212117, 31'd103586530};
        459: prime = {31'd2137255937, 31'd2120478719, 31'd1410253405, 31'd217718993};
        460: prime = {31'd2137243649, 31'd1868808191, 31'd1966999887, 31'd131612763};
        461: prime = {31'd2137182209, 31'd375574527, 31'd1939301431, 31'd65035};
        462: prime = {31'd2137171969, 31'd1898096639, 31'd758913141, 31'd6825384};
        463: prime = {31'd2137159681, 31'd1730312191, 31'd218668666, 31'd2004165938};
        464: prime = {31'd2137147393, 31'd1260537855, 31'd2045670345, 31'd32101562};
        465: prime = {31'd2137141249, 31'd912404479, 31'd518199643, 31'd1297562751};
        466: prime = {31'd2137139201, 31'd1495410687, 31'd674695848, 31'd1023941739};
        467: prime = {31'd2137133057, 31'd1046614015, 31'd830956306, 31'd253901871};
        468: prime = {31'd2137122817, 31'd1562503167, 31'd1555268614, 31'd1277035468};
        469: prime = {31'd2137116673, 31'd912379903, 31'd1871449599, 31'd710282128};
        470: prime = {31'd2137110529, 31'd186759167, 31'd811805080, 31'd219763540};
        471: prime = {31'd2137102337, 31'd1965135871, 31'd1184997641, 31'd1821428485};
        472: prime = {31'd2137098241, 31'd656508927, 31'd1715693095, 31'd1604528861};
        473: prime = {31'd2137090049, 31'd86075391, 31'd2085660657, 31'd1272375949};
        474: prime = {31'd2137085953, 31'd824268799, 31'd1349626963, 31'd1157122661};
        475: prime = {31'd2137055233, 31'd996204543, 31'd1449960883, 31'd1372715321};
        476: prime = {31'd2137030657, 31'd1063288831, 31'd1369303716, 31'd780384328};
        477: prime = {31'd2136987649, 31'd2032130047, 31'd103875114, 31'd7726753};
        478: prime = {31'd2136969217, 31'd1314885631, 31'd1662964115, 31'd1430750700};
        479: prime = {31'd2136924161, 31'd996073471, 31'd4738842, 31'd199906350};
        480: prime = {31'd2136895489, 31'd241070079, 31'd570436091, 31'd1162969874};
        481: prime = {31'd2136893441, 31'd1964926975, 31'd1568349634, 31'd1905838846};
        482: prime = {31'd2136887297, 31'd643715071, 31'd273612548, 31'd2048381633};
        483: prime = {31'd2136850433, 31'd1868414975, 31'd1181257116, 31'd231125329};
        484: prime = {31'd2136809473, 31'd995958783, 31'd1680317971, 31'd1194020792};
        485: prime = {31'd2136764417, 31'd1314680831, 31'd14011331, 31'd1680236020};
        486: prime = {31'd2136741889, 31'd1025251327, 31'd1129154251, 31'd1324408081};
        487: prime = {31'd2136727553, 31'd2069618687, 31'd1838555253, 31'd466291840};
        488: prime = {31'd2136721409, 31'd857458687, 31'd1363928244, 31'd530875458};
        489: prime = {31'd2136698881, 31'd777744383, 31'd1560383828, 31'd2132355935};
        490: prime = {31'd2136649729, 31'd1180348415, 31'd800014364, 31'd1221335404};
        491: prime = {31'd2136606721, 31'd1595541503, 31'd1433096652, 31'd1490214838};
        492: prime = {31'd2136563713, 31'd458842111, 31'd1919611038, 31'd1223017982};
        493: prime = {31'd2136555521, 31'd1868120063, 31'd165591039, 31'd1188881834};
        494: prime = {31'd2136549377, 31'd689514495, 31'd217165345, 31'd1252263275};
        495: prime = {31'd2136526849, 31'd1448660991, 31'd939647887, 31'd681091};
        496: prime = {31'd2136508417, 31'd924354559, 31'd1619926572, 31'd1487461318};
        497: prime = {31'd2136477697, 31'd2119700479, 31'd35065157, 31'd1217905289};
        498: prime = {31'd2136471553, 31'd2132277247, 31'd1452259468, 31'd110940745};
        499: prime = {31'd2136457217, 31'd1868021759, 31'd824816521, 31'd673292725};
        500: prime = {31'd2136422401, 31'd1662466047, 31'd1526049830, 31'd410712140};
        501: prime = {31'd2136420353, 31'd1448554495, 31'd1530623527, 31'd974233655};
        502: prime = {31'd2136371201, 31'd240545791, 31'd1804812805, 31'd2086538808};
        503: prime = {31'd2136334337, 31'd2069225471, 31'd336977082, 31'd249707702};
        504: prime = {31'd2136322049, 31'd643149823, 31'd1904972151, 31'd1671949366};
        505: prime = {31'd2136297473, 31'd1179996159, 31'd172182411, 31'd1159244596};
        506: prime = {31'd2136248321, 31'd777293823, 31'd369032670, 31'd1659509039};
        507: prime = {31'd2136242177, 31'd118781951, 31'd1640007994, 31'd1264263406};
        508: prime = {31'd2136229889, 31'd722749439, 31'd75585225, 31'd702660716};
        509: prime = {31'd2136219649, 31'd2069110783, 31'd1970086149, 31'd1179858944};
        510: prime = {31'd2136207361, 31'd2119430143, 31'd537760675, 31'd1177757566};
        511: prime = {31'd2136176641, 31'd1997764607, 31'd1533487619, 31'd371510840};
    endcase
end

endmodule

module RF_TMP (
    clk,
	CENA,
    AA,
    QA,
    CENB,
    AB,
    DB
);
import FALCON_Config::*;
//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                   clk;
input                   CENA;
input  [XLEN_WIDTH-1:0] AA;
output uint31_t         QA;
input                   CENB;
input  [XLEN_WIDTH-1:0] AB;
input  uint31_t         DB;

//---------------------------------------------------------------------
//   SRAM
//---------------------------------------------------------------------

RF_2p_CRT_TMP u_RF_2p_CRT_TMP (  
    .CLKA(clk),
    .CENA(CENA),
    .AA(AA),
    .QA(QA),
    .CLKB(clk),
    .CENB(CENB),
    .AB(AB),
    .DB(DB),
	// Extra margin adjustment pins input
	.EMAA(3'b000), .EMASA(1'b0),  .STOVA(1'b0),
	.EMAB(3'b000), .EMAWB(2'b00), .STOVB(1'b0),
	// Test mode pins (Redundent), active low 
	.TENA(1'b1), .BENA(1'b1),
	.TENB(1'b1),
	.TCENA(1'b1), .TAA(9'b0), .TQA(31'b0), 
	.TCENB(1'b1), .TAB(9'b0), .TDB(31'b0),
	// Retention mode (power down) (active low)
	.RET1N(1'b1),
	// Additional support pins input
	.COLLDISN(1'b1),
    // Redundent
	.CENYA(), 
	.AYA(),     
	.CENYB(), 
	.AYB(),     
	.DYB()
);

endmodule
