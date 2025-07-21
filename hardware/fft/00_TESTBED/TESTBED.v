`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "FFT.v"
`elsif GATE
    `include "FFT_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Parameter
//================================================================
`ifdef FALCON512
    parameter logn = 8;
`elsif FALCON1024
    parameter logn = 9;
`else
    parameter logn = 8;
`endif

parameter FLOAT_PRECISION = 64;

//================================================================
// Wire Declarations
//================================================================
wire                       clk;
wire                       rst_n;
wire                       in_valid;
wire [FLOAT_PRECISION-1:0] fi_re;
wire [FLOAT_PRECISION-1:0] fi_im;
wire [FLOAT_PRECISION-1:0] s_re_0;
wire [FLOAT_PRECISION-1:0] s_im_0;

wire                       out_valid;
wire [FLOAT_PRECISION-1:0] fo_re;
wire [FLOAT_PRECISION-1:0] fo_im;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("FFT.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("FFT_SYN.sdf",u_FFT);
    // $fsdbDumpfile("FFT_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    FFT #(.FLOAT_PRECISION(FLOAT_PRECISION), .logn(logn)) u_FFT(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .fi_re(fi_re),
    .fi_im(fi_im),
    .s_re_0(s_re_0),
    .s_im_0(s_im_0),
    .out_valid(out_valid),
    .fo_re(fo_re),
    .fo_im(fo_im)
    );
`elsif GATE
    FFT #(.FLOAT_PRECISION(FLOAT_PRECISION), .logn(logn)) u_FFT(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .fi_re(fi_re),
    .fi_im(fi_im),
    .s_re_0(s_re_0),
    .s_im_0(s_im_0),
    .out_valid(out_valid),
    .fo_re(fo_re),
    .fo_im(fo_im)
    );
`endif
	
PATTERN #(.logn(logn)) u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .fi_re(fi_re),
    .fi_im(fi_im),
    .s_re_0(s_re_0),
    .s_im_0(s_im_0),
    .out_valid(out_valid),
    .fo_re(fo_re),
    .fo_im(fo_im)
    );
 
endmodule
