`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "mkgauss.v"
`elsif GATE
    `include "mkgauss_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Wire Declarations
//================================================================
wire          clk;
wire          rst_n;
wire          in_valid;
wire [63:0]   rng;

wire          out_valid;
wire [31:0]   val;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("mkgauss.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("mkgauss_SYN.sdf",u_MKGAUSS);
    $fsdbDumpfile("MKGAUSS_SYN.fsdb");
    $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    MKGAUSS u_MKGAUSS(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .rng(rng),
    .out_valid(out_valid),
    .val(val)
    );
`elsif GATE
    MKGAUSS u_MKGAUSS(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .rng(rng),
    .out_valid(out_valid),
    .val(val)
    );
`endif
	
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .rng(rng),
    .out_valid(out_valid),
    .val(val)
    );
 
 
endmodule
