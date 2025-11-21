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
