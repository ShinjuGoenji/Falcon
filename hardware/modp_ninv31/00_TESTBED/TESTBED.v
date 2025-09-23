`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "MODP_NINV31.v"
`elsif GATE
    `include "MODP_NINV31_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Parameter & Integer
//================================================================
localparam P_WIDTH = 31;

//================================================================
// Wire Declarations
//================================================================
wire               clk;
wire               rst_n;
wire               in_valid;
wire [P_WIDTH-1:0] p;

wire               out_valid;
wire [P_WIDTH-1:0] p0i;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("MODP_NINV31.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("MODP_NINV31_SYN.sdf",u_MODP_NINV31);
    // $fsdbDumpfile("MODP_NINV31_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    MODP_NINV31 u_MODP_NINV31 (
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .p(p),
    .out_valid(out_valid),
    .p0i(p0i)
    );
`elsif GATE
    MODP_NINV31 u_MODP_NINV31 (
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .p(p),
    .out_valid(out_valid),
    .p0i(p0i)
    );
`endif
	
PATTERN u_PATTERN (
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .p(p),
    .out_valid(out_valid),
    .p0i(p0i)
    );
 
 
endmodule
