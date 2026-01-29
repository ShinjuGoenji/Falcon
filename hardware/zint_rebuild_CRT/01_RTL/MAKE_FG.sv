`include "ZINT_REBUILD_CRT.sv"
`include "MODP_MONTYMUL_TOP.sv"

module MAKE_FG (
    clk,
    rst_n,
    inf
);
import usertype::*;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input clk;
input rst_n;
TOP_INF.MAKE_FG inf;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
logic [NUM_WIDTH-1:0]  num;
logic [LOGN_WIDTH-1:0] logn, logn_comb;
logic [XLEN_WIDTH-1:0] xlen, xlen_comb;

uint31_t intt_output_buffer [0:WORD_NUM-1], intt_output_buffer_comb [0:WORD_NUM-1];
logic [9:0] input_ptr, input_ptr_comb;
logic intt_write;

/*
 * RF_CRT
 */
logic         rf_crt_CENA;
logic [7:0]   rf_crt_AA;
logic [123:0] rf_crt_QA;

logic         rf_crt_CENB, rf_crt_CENB_comb;
logic [7:0]   rf_crt_AB, rf_crt_AB_comb;
logic [123:0] rf_crt_DB, rf_crt_DB_comb;

/*
 * MODP_MONTYMUL_TOP
 */
MODP_MONTYMUL_MASTER modp_montymul_req [0:WORD_NUM*2-1];
MODP_MONTYMUL_SLAVE  modp_montymul_resp [0:WORD_NUM*2-1];

/*
 * ZINT_REBUILD_CRT
 */
logic         zint_rebuild_crt_CENB_comb;
logic [7:0]   zint_rebuild_crt_AB_comb;
logic [123:0] zint_rebuild_crt_DB_comb;
logic         is_read; // TODO: may not be necessary
logic         zint_rebuild_crt_CENA;
logic [7:0]   zint_rebuild_crt_AA;
uint31_t      zint_rebuild_crt_QA [0:WORD_NUM-1];
logic         zint_rebuild_out_valid;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
RF_CRT u_RF_CRT(
    .clk(clk),
    .CENA(rf_crt_CENA),
    .AA(rf_crt_AA),
    .QA(rf_crt_QA),
    .CENB(rf_crt_CENB),
    .AB(rf_crt_AB),
    .DB(rf_crt_DB)
);

ZINT_REBUILD_CRT u_ZINT_REBUILD_CRT (
    // Main channel
    // Input signals
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(inf.in_valid),
    .len_valid(inf.len_valid),
    .x_i(inf.in_data),
    .inf_logn(inf.logn),
    .logn(logn),
    .num(num),
    .xlen(xlen),
    .input_ptr(input_ptr),
    .intt_output_buffer_comb(intt_output_buffer_comb),
    // Output signals
    .out_valid(zint_rebuild_out_valid),
    // MODP_MONTYMUL_TOP
    .modp_montymul_req(modp_montymul_req),
    .modp_montymul_resp(modp_montymul_resp),
    // RF_CRT
    .is_write(intt_write),
    .is_read(is_read),
    .CENB_comb(zint_rebuild_crt_CENB_comb),
    .AB_comb(zint_rebuild_crt_AB_comb),
    .DB_comb(zint_rebuild_crt_DB_comb),
    .CENA(zint_rebuild_crt_CENA),
    .AA(zint_rebuild_crt_AA),
    .QA(zint_rebuild_crt_QA)
);

MODP_MONTYMUL_TOP #(.MASTER_NUM(WORD_NUM*2), .MUL_NUM(4)) 
u_MODP_MONTYMUL_TOP (
    .clk(clk),
    .rst_n(rst_n),
    .in_bus(modp_montymul_req),
    .out_bus(modp_montymul_resp)
);

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * input
 */
// num
assign num = 1 << logn;

// logn
always_comb begin
    if (inf.len_valid)
        logn_comb = inf.logn;
    else
        logn_comb = logn;
end

// xlen
always_comb begin
    if (inf.len_valid)
        xlen_comb = inf.xlen;
    else
        xlen_comb = xlen;
end

/*
 * input data
 */
// input pointer
always_comb begin
    if (inf.len_valid)
        input_ptr_comb = 0;
    else if (inf.in_valid)
        input_ptr_comb = input_ptr + 1;
    else
        input_ptr_comb = input_ptr;
end

// input data
genvar intt_output_buffer_comb_idx;
generate
    for (intt_output_buffer_comb_idx=0; intt_output_buffer_comb_idx<WORD_NUM-1; intt_output_buffer_comb_idx=intt_output_buffer_comb_idx+1) begin
        always_comb begin
            if (inf.in_valid)
                intt_output_buffer_comb[intt_output_buffer_comb_idx] = intt_output_buffer[intt_output_buffer_comb_idx+1];
            else
                intt_output_buffer_comb[intt_output_buffer_comb_idx] = intt_output_buffer[intt_output_buffer_comb_idx];
        end
    end
endgenerate

always_comb begin
    if (inf.in_valid)
        intt_output_buffer_comb[WORD_NUM-1] = inf.in_data;
    else
        intt_output_buffer_comb[WORD_NUM-1] = intt_output_buffer[WORD_NUM-1];
end

/*
 * CRT Register File
 */
// write
assign intt_write = inf.in_valid && input_ptr % WORD_NUM == (WORD_NUM - 1);

// enable
always_comb begin
    if (intt_write || !zint_rebuild_crt_CENB_comb)
        rf_crt_CENB_comb = 0;
    else
        rf_crt_CENB_comb = 1;
end

// address
always_comb begin
    if (intt_write)
        rf_crt_AB_comb = (input_ptr + num) / WORD_NUM;
    else if (!zint_rebuild_crt_CENB_comb)
        rf_crt_AB_comb = zint_rebuild_crt_AB_comb;
    else
        rf_crt_AB_comb = 0;
end

// data
always_comb begin
    if (intt_write)
        rf_crt_DB_comb = {>> {intt_output_buffer_comb}};
    else if (!zint_rebuild_crt_CENB_comb)
        rf_crt_DB_comb = {>> {zint_rebuild_crt_DB_comb}};
    else
        rf_crt_DB_comb = 0;
end

// read
assign is_read = 0;

logic debug_state, next_debug_state;
logic [11:0] debug_cnt, debug_cnt_comb;

logic debug_CENA, debug_CENA_reg;
logic [7:0] debug_AA;
uint31_t debug_QA [0:WORD_NUM-1], debug_QA_comb [0:WORD_NUM-1];

// enable
always_comb begin
    if (is_read || !debug_CENA || !zint_rebuild_crt_CENA)
        rf_crt_CENA = 0;
    else
        rf_crt_CENA = 1;
end

// address
always_comb begin
    if (is_read)
        rf_crt_AA = 0; 
    else if (!debug_CENA)
        rf_crt_AA = debug_AA; 
    else 
        rf_crt_AA = zint_rebuild_crt_AA;
end

// data
assign {>> {zint_rebuild_crt_QA}} = rf_crt_QA;

/*
 * TODO: debug
 */
logic out_valid_reg1, out_valid_reg2;
uint31_t out_data_comb;

always_comb begin
    case (debug_state)
        0: 
            if (zint_rebuild_out_valid)
                next_debug_state <= 1;
            else
                next_debug_state <= debug_state;
        1:
            if (debug_cnt == num * xlen - 1)
                next_debug_state <= 0;
            else
                next_debug_state <= debug_state;
    endcase
end

always_comb begin
    if (debug_state)
        debug_cnt_comb = debug_cnt + 1;
    else
        debug_cnt_comb = 0;
end

assign debug_CENA = !(debug_state && debug_cnt % WORD_NUM == 0);
assign debug_AA = (debug_cnt + num) / WORD_NUM;

genvar i;
generate
    for (i = 0; i < WORD_NUM-1; i=i+1) begin
        always_comb begin
            if (!debug_CENA_reg)
                debug_QA_comb[i] = rf_crt_QA[(WORD_NUM*P_WIDTH-1)-(i*P_WIDTH) -: P_WIDTH];
            else 
                debug_QA_comb[i] = debug_QA[i+1];
        end
    end
endgenerate

always_comb begin
    if (!debug_CENA_reg)
        debug_QA_comb[WORD_NUM-1] = rf_crt_QA[(WORD_NUM*P_WIDTH-1)-((WORD_NUM-1)*P_WIDTH) -: P_WIDTH];
    else if (debug_state)
        debug_QA_comb[WORD_NUM-1] = 0;
    else 
        debug_QA_comb[WORD_NUM-1] = debug_QA[WORD_NUM-1];
end

assign out_data_comb = debug_QA[0];

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        debug_state <= 0;
        debug_cnt <= 0;
        debug_CENA_reg <= 1;
        debug_QA <= '{default: '0};
        out_valid_reg1 <= 0;
        out_valid_reg2 <= 0;
        inf.out_valid <= 0;
        inf.out_data <= 0;
    end
    else begin
        debug_state <= next_debug_state;
        debug_cnt <= debug_cnt_comb;
        debug_CENA_reg <= debug_CENA;
        debug_QA <= debug_QA_comb;
        out_valid_reg1 <= debug_state;
        out_valid_reg2 <= out_valid_reg1;
        inf.out_valid <= out_valid_reg2;
        inf.out_data <= out_data_comb;
    end
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        logn <= 0;
        xlen <= 0;
        input_ptr <= 0;
        intt_output_buffer <= '{default: '0};
        // RF_CRT
        rf_crt_CENB <= 1;
        rf_crt_AB <= 0;
        rf_crt_DB <= 0;
    end
    else begin
        logn <= logn_comb;
        xlen <= xlen_comb;
        input_ptr <= input_ptr_comb;
        intt_output_buffer <= intt_output_buffer_comb;
        // RF_CRT
        rf_crt_CENB <= rf_crt_CENB_comb;
        rf_crt_AB <= rf_crt_AB_comb;
        rf_crt_DB <= rf_crt_DB_comb;
    end
end

endmodule

module RF_CRT (
    clk,
    CENA,
    AA,
    QA,
    CENB,
    AB,
    DB
);
import usertype::*;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input          clk;
input          CENA;
input  [7:0]   AA;
output [123:0] QA;
input          CENB;
input  [7:0]   AB;
input  [123:0] DB;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
// Redundent
logic         CENYA;
logic [7:0]   AYA;
logic         CENYB;
logic [7:0]   AYB;
logic [123:0] DYB;

//---------------------------------------------------------------------
//   SRAM
//---------------------------------------------------------------------

RF_2p_CRT_4x256 u_RF_2p_CRT_4x256 (
	.CENYA(CENYA), 
	.AYA(AYA),     
	.CENYB(CENYB), 
	.AYB(AYB),     
	.DYB(DYB),     
    .QA(QA),
    .CLKA(clk),
    .CENA(CENA),
    .AA(AA),
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
	.TCENA(1'b1), .TAA(8'b0), .TQA(124'b0), 
	.TCENB(1'b1), .TAB(8'b0), .TDB(124'b0),
	// Retention mode (power down) (active low)
	.RET1N(1'b1),
	// Additional support pins input
	.COLLDISN(1'b1)
);

endmodule
