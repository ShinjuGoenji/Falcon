`include "MODP_NTT2_1.sv"
// `include "MODP_MONTYMUL_TOP.sv"

module MAKE_FG (
    clk,
    rst_n,
    // Inputs
    inf_in_valid,
    inf_in_data,
    inf_len_valid,
    inf_logn,
    // Outputs
    inf_out_valid,
    inf_out_data
);
import FALCON_Config::*;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input clk;
input rst_n;

input inf_in_valid;
input inf_len_valid;
input uint31_t inf_in_data;
input [LOGN_WIDTH-1:0] inf_logn;

output logic inf_out_valid;
output uint31_t inf_out_data;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
logic [NUM_WIDTH-1:0]  num;
logic [LOGN_WIDTH-1:0] logn, logn_comb;

uint31_t input_buffer [0:WORD_NUM-1], input_buffer_comb [0:WORD_NUM-1];
logic [NUM_WIDTH:0] input_ptr, input_ptr_comb;
logic input_write;

/*
 * RF_CRT
 */
logic                         rf_crt_CENA;
logic [RF_CRT_ADDR_WIDTH-1:0] rf_crt_AA;
logic [P_WIDTH*WORD_NUM-1:0]  rf_crt_QA;

logic                         rf_crt_CENB, rf_crt_CENB_comb;
logic [RF_CRT_ADDR_WIDTH-1:0] rf_crt_AB, rf_crt_AB_comb;
logic [P_WIDTH*WORD_NUM-1:0]  rf_crt_DB, rf_crt_DB_comb;

/*
 * MODP_MONTYMUL_TOP
 */
// MODP_MONTYMUL_MASTER modp_montymul_req [0:WORD_NUM*2-1];
// MODP_MONTYMUL_SLAVE  modp_montymul_resp [0:WORD_NUM*2-1];

/*
 * ZINT_REBUILD_CRT
 */
// logic                         zint_rebuild_crt_CENB_comb;
// logic [RF_CRT_ADDR_WIDTH-1:0] zint_rebuild_crt_AB_comb;
// logic [P_WIDTH*WORD_NUM-1:0]  zint_rebuild_crt_DB_comb;
// logic                         is_read; // TODO: may not be necessary
// logic                         zint_rebuild_crt_CENA;
// logic [RF_CRT_ADDR_WIDTH-1:0] zint_rebuild_crt_AA;
// uint31_t                      zint_rebuild_crt_QA [0:WORD_NUM-1];
// logic                         zint_rebuild_out_valid;

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

MODP_NTT2 u_MODP_NTT2 (
    // Input signals
   .clk(),
   .rst_n(),
   .in_valid(),
   .a_i(),
   .logn(),
   .p(),
   .p0i(),
   .isMQ(),
   .s_bus(),
   // Output signals
   .out_valid(),
   .a_o(),
   .tw_idx_bus()
);

// ZINT_REBUILD_CRT u_ZINT_REBUILD_CRT (
//     // Main channel
//     // Input signals
//     .clk(clk),
//     .rst_n(rst_n),
//     .in_valid(inf.in_valid),
//     .len_valid(inf.len_valid),
//     .mode(inf.mode),
//     .inf_logn(inf.logn),
//     .logn(logn),
//     .num(num),
//     .xlen(xlen),
//     .input_ptr(input_ptr),
//     .input_buffer_comb(input_buffer_comb),
//     // Output signals
//     .out_valid(zint_rebuild_out_valid),
//     // MODP_MONTYMUL_TOP
//     .modp_montymul_req(modp_montymul_req),
//     .modp_montymul_resp(modp_montymul_resp),
//     // RF_CRT
//     .is_write(input_write),
//     .is_read(is_read),
//     .CENB_comb(zint_rebuild_crt_CENB_comb),
//     .AB_comb(zint_rebuild_crt_AB_comb),
//     .DB_comb(zint_rebuild_crt_DB_comb),
//     .CENA(zint_rebuild_crt_CENA),
//     .AA(zint_rebuild_crt_AA),
//     .QA(zint_rebuild_crt_QA)
// );

// MODP_MONTYMUL_TOP #(.MASTER_NUM(WORD_NUM*2), .MUL_NUM(WORD_NUM)) 
// u_MODP_MONTYMUL_TOP (
//     .clk(clk),
//     .rst_n(rst_n),
//     .in_bus(modp_montymul_req),
//     .out_bus(modp_montymul_resp)
// );

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * input
 */
// num
// assign num = 1 << logn;

// logn
always_comb begin
    if (inf_len_valid)
        logn_comb = inf_logn;
    else
        logn_comb = logn;
end

/*
 * TODO: input data (debug)
 */
// input pointer
always_comb begin
    if (inf_in_valid)
        input_ptr_comb = input_ptr + 1;
    else if (inf_len_valid)
        input_ptr_comb = 0;
    else
        input_ptr_comb = input_ptr;
end

// input data
genvar input_buffer_comb_idx;
generate
    for (input_buffer_comb_idx=0; input_buffer_comb_idx<WORD_NUM-1; input_buffer_comb_idx=input_buffer_comb_idx+1) begin
        always_comb begin
            if (inf_in_valid)
                input_buffer_comb[input_buffer_comb_idx] = input_buffer[input_buffer_comb_idx+1];
            else
                input_buffer_comb[input_buffer_comb_idx] = input_buffer[input_buffer_comb_idx];
        end
    end
endgenerate

always_comb begin
    if (inf_in_valid)
        input_buffer_comb[WORD_NUM-1] = inf_in_data;
    else
        input_buffer_comb[WORD_NUM-1] = input_buffer[WORD_NUM-1];
end

/*
 * CRT Register File
 */
// write
assign input_write = inf_in_valid && input_ptr % WORD_NUM == (WORD_NUM - 1);

// enable
always_comb begin
    if (input_write)
        rf_crt_CENB_comb = 0;
    else
        rf_crt_CENB_comb = 1;
end

// address
always_comb begin
    if (input_write)
        rf_crt_AB_comb = input_ptr / WORD_NUM;
    else
        rf_crt_AB_comb = 0;
end

// data
always_comb begin
    if (input_write)
        rf_crt_DB_comb = {>> {input_buffer_comb}};
    else
        rf_crt_DB_comb = 0;
end

// read
assign is_read = 0;

// enable
always_comb begin
    if (is_read)
        rf_crt_CENA = 0;
    else
        rf_crt_CENA = 1;
end

// address
always_comb begin
    if (is_read)
        rf_crt_AA = 0; 
    else 
        rf_crt_AA = 0;
end

// data
// assign {>> {zint_rebuild_crt_QA}} = rf_crt_QA;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        logn <= 0;
        input_ptr <= 0;
        input_buffer <= '{default: '0};
        // RF_CRT
        rf_crt_CENB <= 1;
        rf_crt_AB <= 0;
        rf_crt_DB <= 0;
        // output
        inf_out_valid <= 0;
        inf_out_data <= 0;
    end
    else begin
        logn <= logn_comb;
        input_ptr <= input_ptr_comb;
        input_buffer <= input_buffer_comb;
        // RF_CRT
        rf_crt_CENB <= rf_crt_CENB_comb;
        rf_crt_AB <= rf_crt_AB_comb;
        rf_crt_DB <= rf_crt_DB_comb;
        // output
        inf_out_valid <= 0;
        inf_out_data <= 0;
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
import FALCON_Config::*;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                          clk;
input                          CENA;
input  [RF_CRT_ADDR_WIDTH-1:0] AA;
output [P_WIDTH*WORD_NUM-1:0]  QA;
input                          CENB;
input  [RF_CRT_ADDR_WIDTH-1:0] AB;
input  [P_WIDTH*WORD_NUM-1:0]  DB;

//---------------------------------------------------------------------
//   SRAM
//---------------------------------------------------------------------
RF_2p_CRT_4x512 u_RF_2p_CRT_4x512 (
    .CLKA(clk),
    .QA(QA),
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
    .TENA(1'b1), .BENA(1'b1), .TENB(1'b1),
    .TCENA(1'b1), .TAA(9'b0), .TQA(124'b0), 
    .TCENB(1'b1), .TAB(9'b0), .TDB(124'b0),
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
