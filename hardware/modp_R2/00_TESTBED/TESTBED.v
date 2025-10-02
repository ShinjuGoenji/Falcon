`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "KEYGEN.v"
`elsif GATE
    `include "KEYGEN_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Parameter
//================================================================
localparam P_WIDTH = 31;

localparam MODP_R2_NUM = 3;
localparam MODP_MONTYMUL_NUM = 2;

//================================================================
// Wire Declarations
//================================================================
wire                           clk;
wire                           rst_n;
wire [MODP_R2_NUM-1:0]         in_valid_bus;
wire [P_WIDTH*MODP_R2_NUM-1:0] p_bus;
wire [P_WIDTH*MODP_R2_NUM-1:0] p0i_bus;

wire [MODP_R2_NUM-1:0]         out_valid_bus;
wire [P_WIDTH*MODP_R2_NUM-1:0] R2_bus;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("KEYGEN.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("KEYGEN_SYN.sdf",u_KEYGEN);
    // $fsdbDumpfile("KEYGEN_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    KEYGEN #(.MODP_R2_NUM(MODP_R2_NUM), .MODP_MONTYMUL_NUM(MODP_MONTYMUL_NUM)) 
    u_KEYGEN(
      .clk(clk),
      .rst_n(rst_n),
      .in_valid_bus(in_valid_bus),
      .p_bus(p_bus),
      .p0i_bus(p0i_bus),
      .out_valid_bus(out_valid_bus),
      .R2_bus(R2_bus)
    );
`elsif GATE
    KEYGEN u_KEYGEN(
      .clk(clk),
      .rst_n(rst_n),
      .in_valid_bus(in_valid_bus),
      .p_bus(p_bus),
      .p0i_bus(p0i_bus),
      .out_valid_bus(out_valid_bus),
      .R2_bus(R2_bus)
    );
`endif
	
PATTERN #(.MODP_R2_NUM(MODP_R2_NUM)) 
u_PATTERN(
  .clk(clk),
  .rst_n(rst_n),
  .in_valid_bus(in_valid_bus),
  .p_bus(p_bus),
  .p0i_bus(p0i_bus),
  .out_valid_bus(out_valid_bus),
  .R2_bus(R2_bus)
);
 
endmodule
