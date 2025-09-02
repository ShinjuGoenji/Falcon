`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "POLY_INVNORM2_FFT.v"
`elsif GATE
    `include "POLY_INVNORM2_FFT_SYN.v"
`endif
	  		  	
module TESTBED;

parameter FLOAT_PRECISION = 64;

//================================================================
// Wire Declarations
//================================================================
wire                       clk;
wire                       rst_n;
wire [FLOAT_PRECISION-1:0] a_re, a_im;
wire [FLOAT_PRECISION-1:0] b_re, b_im;

wire [FLOAT_PRECISION-1:0] d;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("POLY_INVNORM2_FFT.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("POLY_INVNORM2_FFT_SYN.sdf",u_POLY_INVNORM2_FFT);
    // $fsdbDumpfile("POLY_INVNORM2_FFT_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    POLY_INVNORM2_FFT #(.FLOAT_PRECISION(FLOAT_PRECISION)) u_POLY_INVNORM2_FFT (
    .clk(clk),
    .rst_n(rst_n),
    .a_re(a_re),
    .a_im(a_im),
    .b_re(b_re),
    .b_im(b_im),
    .d(d)
    );
`elsif GATE
    POLY_INVNORM2_FFT #(.FLOAT_PRECISION(FLOAT_PRECISION)) u_POLY_INVNORM2_FFT (
    .clk(clk),
    .rst_n(rst_n),
    .a_re(a_re),
    .a_im(a_im),
    .b_re(b_re),
    .b_im(b_im),
    .d(d)
    );
`endif
	
PATTERN #(.FLOAT_PRECISION(FLOAT_PRECISION)) u_PATTERN (
    .clk(clk),
    .rst_n(rst_n),
    .a_re(a_re),
    .a_im(a_im),
    .b_re(b_re),
    .b_im(b_im),
    .d(d)
    );
 
 
endmodule
