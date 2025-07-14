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
wire               clk;
wire               rst_n;
wire               r1_valid;
wire               r2_valid;
wire        [63:0] r1;
wire        [63:0] r2;

wire               val_valid;
wire signed [31:0] val;

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
    .r1_valid(r1_valid),
    .r1(r1),
    .r2_valid(r2_valid),
    .r2(r2),
    .val_valid(val_valid),
    .val(val)
    );
`elsif GATE
    MKGAUSS u_MKGAUSS(
    .clk(clk),
    .rst_n(rst_n),
    .r1_valid(r1_valid),
    .r1(r1),
    .r2_valid(r2_valid),
    .r2(r2),
    .val_valid(val_valid),
    .val(val)
    );
`endif
	
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .r1_valid(r1_valid),
    .r1(r1),
    .r2_valid(r2_valid),
    .r2(r2),
    .val_valid(val_valid),
    .val(val)
    );
 
 
endmodule
