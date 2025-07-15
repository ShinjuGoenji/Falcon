`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "MKGAUSS.v"
`elsif GATE
    `include "MKGAUSS_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Wire Declarations
//================================================================
wire               clk;
wire               rst_n;
wire               r_valid;
wire        [63:0] r1;
wire        [63:0] r2;

wire               val_valid;
wire signed [31:0] val;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("MKGAUSS.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("MKGAUSS_SYN.sdf",u_MKGAUSS);
    // $fsdbDumpfile("MKGAUSS_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    MKGAUSS u_MKGAUSS(
    .clk(clk),
    .rst_n(rst_n),
    .r_valid(r_valid),
    .r1(r1),
    .r2(r2),
    .val_valid(val_valid),
    .val(val)
    );
`elsif GATE
    MKGAUSS u_MKGAUSS(
    .clk(clk),
    .rst_n(rst_n),
    .r_valid(r_valid),
    .r1(r1),
    .r2(r2),
    .val_valid(val_valid),
    .val(val)
    );
`endif
	
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .r_valid(r_valid),
    .r1(r1),
    .r2(r2),
    .val_valid(val_valid),
    .val(val)
    );
 
 
endmodule
