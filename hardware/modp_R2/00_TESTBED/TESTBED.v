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

//================================================================
// Wire Declarations
//================================================================
wire               clk;
wire               rst_n;
wire               in_valid;
wire [P_WIDTH-1:0] p;
wire [P_WIDTH-1:0] p0i;

wire               out_valid;
wire [P_WIDTH-1:0] R2;

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
    KEYGEN u_KEYGEN(
      .clk(clk),
      .rst_n(rst_n),
      .in_valid(in_valid),
      .p(p),
      .p0i(p0i),
      .out_valid(out_valid),
      .R2(R2)
    );
`elsif GATE
    KEYGEN u_KEYGEN(
      .clk(clk),
      .rst_n(rst_n),
      .in_valid(in_valid),
      .p(p),
      .p0i(p0i),
      .out_valid(out_valid),
      .R2(R2)
    );
`endif
	
PATTERN u_PATTERN(
  .clk(clk),
  .rst_n(rst_n),
  .in_valid(in_valid),
  .p(p),
  .p0i(p0i),
  .out_valid(out_valid),
  .R2(R2)
);
 
endmodule
