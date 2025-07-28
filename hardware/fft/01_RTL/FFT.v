`include "RADIX2.v"

/*
 * Hardware implementation of a pipelined, N-point Fast Fourier Transform (FFT)
 * processor, where N = 2^logn. This module connects several FFT stages
 * to form a complete FFT pipeline.
 *
 * The architecture is a fully unrolled pipeline, where each of the 'logn'
 * stages of the FFT is implemented by a dedicated 'RADIX2' hardware submodule.
 * This provides high throughput, as a new FFT computation can begin before
 * the previous one has finished.
 *
 * The module implements a Decimation-In-Time (DIT) FFT algorithm. Input data
 * 'fi_re'/'fi_im' flows sequentially through the 'logn' stages. Each stage
 * performs its butterfly computations and passes the result to the next.
 */
module FFT #(
    parameter FLOAT_PRECISION = 64,
    parameter logn = 8
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    fi_re, fi_im,
    s_re_1, s_im_1,
    s_re_2, s_im_2,
    s_re_3, s_im_3,
    s_re_4, s_im_4,
    s_re_5, s_im_5,
    s_re_6, s_im_6,
    s_re_7, s_im_7,
    s_re_8, s_im_8,
    // Output signals
    out_valid,
    tw_idx_1, 
    tw_idx_2, 
    tw_idx_3,
    tw_idx_4,
    tw_idx_5,
    tw_idx_6,
    tw_idx_7,
    tw_idx_8,
    fo_re, fo_im
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                        clk;
input                        rst_n;
input                        in_valid;
input  [FLOAT_PRECISION-1:0] fi_re, fi_im;
input  [FLOAT_PRECISION-1:0] s_re_1, s_im_1;
input  [FLOAT_PRECISION-1:0] s_re_2, s_im_2;
input  [FLOAT_PRECISION-1:0] s_re_3, s_im_3;
input  [FLOAT_PRECISION-1:0] s_re_4, s_im_4;
input  [FLOAT_PRECISION-1:0] s_re_5, s_im_5;
input  [FLOAT_PRECISION-1:0] s_re_6, s_im_6;
input  [FLOAT_PRECISION-1:0] s_re_7, s_im_7;
input  [FLOAT_PRECISION-1:0] s_re_8, s_im_8;

output reg                   out_valid;
output reg [logn:0]          tw_idx_1;
output reg [logn:0]          tw_idx_2;
output reg [logn:0]          tw_idx_3;
output reg [logn:0]          tw_idx_4;
output reg [logn:0]          tw_idx_5;
output reg [logn:0]          tw_idx_6;
output reg [logn:0]          tw_idx_7;
output reg [logn:0]          tw_idx_8;
output [FLOAT_PRECISION-1:0] fo_re, fo_im;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg in_valid_reg;
reg [FLOAT_PRECISION-1:0] fi_re_reg, fi_im_reg;
reg [FLOAT_PRECISION-1:0] s_re_1_reg, s_im_1_reg;

reg valid_12;
reg [FLOAT_PRECISION-1:0] f_re_12, f_im_12;
reg [FLOAT_PRECISION-1:0] s_re_2_reg, s_im_2_reg;

reg valid_23;
reg [FLOAT_PRECISION-1:0] f_re_23, f_im_23;
reg [FLOAT_PRECISION-1:0] s_re_3_reg, s_im_3_reg;

reg valid_34;
reg [FLOAT_PRECISION-1:0] f_re_34, f_im_34;
reg [FLOAT_PRECISION-1:0] s_re_4_reg, s_im_4_reg;

reg valid_45;
reg [FLOAT_PRECISION-1:0] f_re_45, f_im_45;
reg [FLOAT_PRECISION-1:0] s_re_5_reg, s_im_5_reg;

reg valid_56;
reg [FLOAT_PRECISION-1:0] f_re_56, f_im_56;
reg [FLOAT_PRECISION-1:0] s_re_6_reg, s_im_6_reg;

reg valid_67;
reg [FLOAT_PRECISION-1:0] f_re_67, f_im_67;
reg [FLOAT_PRECISION-1:0] s_re_7_reg, s_im_7_reg;

reg valid_78;
reg [FLOAT_PRECISION-1:0] f_re_78, f_im_78;
reg [FLOAT_PRECISION-1:0] s_re_8_reg, s_im_8_reg;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
/*
 * The FFT pipeline is constructed by chaining `logn` (8) RADIX2 stages.
 * The output of one stage becomes the input for the next. Each stage `U`
 * receives its own twiddle factor stream.
 */
RADIX2 #(FLOAT_PRECISION, logn, 1)
u_stage_1 (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .in_valid(in_valid_reg),
    .di_re(fi_re_reg), .di_im(fi_im_reg),
    .s_re(s_re_1_reg), .s_im(s_im_1_reg),
    // Output signals
    .tw_idx(tw_idx_1),
    .out_valid(valid_12),
    .do_re(f_re_12), .do_im(f_im_12)
);

RADIX2 #(FLOAT_PRECISION, logn, 2)
u_stage_2 (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .in_valid(valid_12),
    .di_re(f_re_12), .di_im(f_im_12),
    .s_re(s_re_2_reg), .s_im(s_im_2_reg),
    // Output signals
    .tw_idx(tw_idx_2),
    .out_valid(valid_23),
    .do_re(f_re_23), .do_im(f_im_23)
);

RADIX2 #(FLOAT_PRECISION, logn, 3)
u_stage_3 (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .in_valid(valid_23),
    .di_re(f_re_23), .di_im(f_im_23),
    .s_re(s_re_3_reg), .s_im(s_im_3_reg),
    // Output signals
    .tw_idx(tw_idx_3),
    .out_valid(valid_34),
    .do_re(f_re_34), .do_im(f_im_34)
);

RADIX2 #(FLOAT_PRECISION, logn, 4)
u_stage_4 (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .in_valid(valid_34),
    .di_re(f_re_34), .di_im(f_im_34),
    .s_re(s_re_4_reg), .s_im(s_im_4_reg),
    // Output signals
    .tw_idx(tw_idx_4),
    .out_valid(valid_45),
    .do_re(f_re_45), .do_im(f_im_45)
);

RADIX2 #(FLOAT_PRECISION, logn, 5)
u_stage_5 (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .in_valid(valid_45),
    .di_re(f_re_45), .di_im(f_im_45),
    .s_re(s_re_5_reg), .s_im(s_im_5_reg),
    // Output signals
    .tw_idx(tw_idx_5),
    .out_valid(valid_56),
    .do_re(f_re_56), .do_im(f_im_56)
);

RADIX2 #(FLOAT_PRECISION, logn, 6)
u_stage_6 (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .in_valid(valid_56),
    .di_re(f_re_56), .di_im(f_im_56),
    .s_re(s_re_6_reg), .s_im(s_im_6_reg),
    // Output signals
    .tw_idx(tw_idx_6),
    .out_valid(valid_67),
    .do_re(f_re_67), .do_im(f_im_67)
);

RADIX2 #(FLOAT_PRECISION, logn, 7)
u_stage_7 (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .in_valid(valid_67),
    .di_re(f_re_67), .di_im(f_im_67),
    .s_re(s_re_7_reg), .s_im(s_im_7_reg),
    // Output signals
    .tw_idx(tw_idx_7),
    .out_valid(valid_78),
    .do_re(f_re_78), .do_im(f_im_78)
);

RADIX2 #(FLOAT_PRECISION, logn, 8)
u_stage_8 (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .in_valid(valid_78),
    .di_re(f_re_78), .di_im(f_im_78),
    .s_re(s_re_8_reg), .s_im(s_im_8_reg),
    // Output signals
    .tw_idx(tw_idx_8),
    .out_valid(out_valid),
    .do_re(fo_re), .do_im(fo_im)
);

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        in_valid_reg <= 0;
        fi_re_reg <= 0;
        fi_im_reg <= 0;
        s_re_1_reg <= 0;
        s_im_1_reg <= 0;
        s_re_2_reg <= 0;
        s_im_2_reg <= 0;
        s_re_3_reg <= 0;
        s_im_3_reg <= 0;
        s_re_4_reg <= 0;
        s_im_4_reg <= 0;
        s_re_5_reg <= 0;
        s_im_5_reg <= 0;
        s_re_6_reg <= 0;
        s_im_6_reg <= 0;
        s_re_7_reg <= 0;
        s_im_7_reg <= 0;
        s_re_8_reg <= 0;
        s_im_8_reg <= 0;
    end
    else begin
        in_valid_reg <= in_valid;
        fi_re_reg <= fi_re;
        fi_im_reg <= fi_im;
        s_re_1_reg <= s_re_1;
        s_im_1_reg <= s_im_1;
        s_re_2_reg <= s_re_2;
        s_im_2_reg <= s_im_2;
        s_re_3_reg <= s_re_3;
        s_im_3_reg <= s_im_3;
        s_re_4_reg <= s_re_4;
        s_im_4_reg <= s_im_4;
        s_re_5_reg <= s_re_5;
        s_im_5_reg <= s_im_5;
        s_re_6_reg <= s_re_6;
        s_im_6_reg <= s_im_6;
        s_re_7_reg <= s_re_7;
        s_im_7_reg <= s_im_7;
        s_re_8_reg <= s_re_8;
        s_im_8_reg <= s_im_8;
    end
end

endmodule
