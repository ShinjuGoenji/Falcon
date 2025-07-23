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
wire [FLOAT_PRECISION-1:0] s_re_1;
wire [FLOAT_PRECISION-1:0] s_im_1;
wire [FLOAT_PRECISION-1:0] s_re_2;
wire [FLOAT_PRECISION-1:0] s_im_2;
wire [FLOAT_PRECISION-1:0] s_re_3;
wire [FLOAT_PRECISION-1:0] s_im_3;
wire [FLOAT_PRECISION-1:0] s_re_4;
wire [FLOAT_PRECISION-1:0] s_im_4;
wire [FLOAT_PRECISION-1:0] s_re_5;
wire [FLOAT_PRECISION-1:0] s_im_5;
wire [FLOAT_PRECISION-1:0] s_re_6;
wire [FLOAT_PRECISION-1:0] s_im_6;
wire [FLOAT_PRECISION-1:0] s_re_7;
wire [FLOAT_PRECISION-1:0] s_im_7;
wire [FLOAT_PRECISION-1:0] s_re_8;
wire [FLOAT_PRECISION-1:0] s_im_8;

wire                       out_valid;
wire [logn:0]              tw_idx_1;
wire [logn:0]              tw_idx_2;
wire [logn:0]              tw_idx_3;
wire [logn:0]              tw_idx_4;
wire [logn:0]              tw_idx_5;
wire [logn:0]              tw_idx_6;
wire [logn:0]              tw_idx_7;
wire [logn:0]              tw_idx_8;
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
    .s_re_1(s_re_1), .s_im_1(s_im_1),
    .s_re_2(s_re_2), .s_im_2(s_im_2),
    .s_re_3(s_re_3), .s_im_3(s_im_3),
    .s_re_4(s_re_4), .s_im_4(s_im_4),
    .s_re_5(s_re_5), .s_im_5(s_im_5),
    .s_re_6(s_re_6), .s_im_6(s_im_6),
    .s_re_7(s_re_7), .s_im_7(s_im_7),
    .s_re_8(s_re_8), .s_im_8(s_im_8),
    .out_valid(out_valid),
    .tw_idx_1(tw_idx_1),
    .tw_idx_2(tw_idx_2),
    .tw_idx_3(tw_idx_3),
    .tw_idx_4(tw_idx_4),
    .tw_idx_5(tw_idx_5),
    .tw_idx_6(tw_idx_6),
    .tw_idx_7(tw_idx_7),
    .tw_idx_8(tw_idx_8),
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
    .s_re_1(s_re_1), .s_im_1(s_im_1),
    .s_re_2(s_re_2), .s_im_2(s_im_2),
    .s_re_3(s_re_3), .s_im_3(s_im_3),
    .s_re_4(s_re_4), .s_im_4(s_im_4),
    .s_re_5(s_re_5), .s_im_5(s_im_5),
    .s_re_6(s_re_6), .s_im_6(s_im_6),
    .s_re_7(s_re_7), .s_im_7(s_im_7),
    .s_re_8(s_re_8), .s_im_8(s_im_8),
    .out_valid(out_valid),
    .tw_idx_1(tw_idx_1),
    .tw_idx_2(tw_idx_2),
    .tw_idx_3(tw_idx_3),
    .tw_idx_4(tw_idx_4),
    .tw_idx_5(tw_idx_5),
    .tw_idx_6(tw_idx_6),
    .tw_idx_7(tw_idx_7),
    .tw_idx_8(tw_idx_8),
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
    .s_re_1(s_re_1), .s_im_1(s_im_1),
    .s_re_2(s_re_2), .s_im_2(s_im_2),
    .s_re_3(s_re_3), .s_im_3(s_im_3),
    .s_re_4(s_re_4), .s_im_4(s_im_4),
    .s_re_5(s_re_5), .s_im_5(s_im_5),
    .s_re_6(s_re_6), .s_im_6(s_im_6),
    .s_re_7(s_re_7), .s_im_7(s_im_7),
    .s_re_8(s_re_8), .s_im_8(s_im_8),
    .out_valid(out_valid),
    .tw_idx_1(tw_idx_1),
    .tw_idx_2(tw_idx_2),
    .tw_idx_3(tw_idx_3),
    .tw_idx_4(tw_idx_4),
    .tw_idx_5(tw_idx_5),
    .tw_idx_6(tw_idx_6),
    .tw_idx_7(tw_idx_7),
    .tw_idx_8(tw_idx_8),
    .fo_re(fo_re),
    .fo_im(fo_im)
    );
 
endmodule
