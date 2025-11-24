module MAKE_FG (
    clk,
    rst_n,
    inf
);
import usertype::*;

//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------
localparam WORD_NUM = 4;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input clk;
input rst_n;
TOP_INF.MAKE_FG inf;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
State state, next_state;

logic [LOGN_WIDTH-1:0] logn, logn_comb;
logic [XLEN_WIDTH-1:0] xlen, xlen_comb;

logic [P_WIDTH-1:0] rf_crt_write_buffer [0:WORD_NUM-1], rf_crt_write_buffer_comb [0:WORD_NUM-1];

logic [9:0] input_ptr, input_ptr_comb;

logic all_done, output_done;

/*
 * RF_CRT
 */
logic         rf_crt_CENA;
logic         rf_crt_CENB;
logic [6:0]   rf_crt_AA;
logic [6:0]   rf_crt_AB;
logic [127:0] rf_crt_DB;
logic [127:0] rf_crt_QA;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
always_comb begin
    case (state)
        S_IDLE: 
            if (inf.len_valid)
                next_state = S_INPUT;
            else
                next_state = next_state;
        S_INPUT: 
            if (all_done)
                next_state = S_OUTPUT;
            else
                next_state = next_state;
        S_OUTPUT: 
            if (output_done)
                next_state = S_IDLE;
            else
                next_state = next_state;
        default: 
            next_state = S_IDLE;
    endcase
end

/*
 * input
 */
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


//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
RF_CRT u_RF_CRT(
    // Input signals
    .CLK(clk),
	.CENA(rf_crt_CENA),
	.CENB(rf_crt_CENB),
	.AA(rf_crt_AA),
	.AB(rf_crt_AB),
	.DB(rf_crt_DB),
    // Output signals
    .QA(rf_crt_QA)
);

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= 0;
        logn <= 0;
        xlen <= 0;
        input_ptr <= 0;
        rf_crt_write_buffer <= {0, 0, 0, 0}; // TODO: parameterize reset value
    end
    else begin
        state <= next_state;
        logn <= logn_comb;
        xlen <= xlen_comb;
        input_ptr <= input_ptr_comb;
        rf_crt_write_buffer <= rf_crt_write_buffer_comb;
    end
end

endmodule

module RF_CRT (
    // Input signals
    CLK,
	CENA,
	CENB,
	AA,
	AB,
	DB,
    // Output signals
    QA
);

//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input          CLK;
input          CENA;
input          CENB;
input [6:0]    AA;
input [6:0]    AB;
input [127:0]  DB;

output [127:0] QA;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
// Redundent
logic         rf_2p_crt_CENYA;
logic [6:0]   rf_2p_crt_AYA;
logic         rf_2p_crt_CENYB;
logic [6:0]   rf_2p_crt_AYB;
logic [127:0] rf_2p_crt_DYB;

//---------------------------------------------------------------------
//   SRAM
//---------------------------------------------------------------------

rf_2p_hse_crt u_rf_2p_hse_crt (
	.CENYA(rf_2p_crt_CENYA), 
	.AYA(rf_2p_crt_AYA),     
	.CENYB(rf_2p_crt_CENYB), 
	.AYB(rf_2p_crt_AYB),     
	.DYB(rf_2p_crt_DYB),     
    .QA(QA),
    .CLKA(CLK),
    .CENA(CENA),
    .AA(AA),
    .CLKB(CLK),
    .CENB(CENB),
    .AB(AB),
    .DB(DB),
	// Extra margin adjustment pins input
	.EMAA(3'b000), .EMASA(1'b0),  .STOVA(1'b0),
	.EMAB(3'b000), .EMAWB(2'b00), .STOVB(1'b0),
	// Test mode pins (Redundent), active low 
	.TENA(1'b1), .BENA(1'b1),
	.TENB(1'b1),
	.TCENA(1'b1), .TAA(7'b0), .TQA(128'b0), 
	.TCENB(1'b1), .TAB(7'b0), .TDB(128'b0),
	// Retention mode (power down) (active low)
	.RET1N(1'b1),
	// Additional support pins input
	.COLLDISN(1'b1)
);

endmodule
