`include "RADIX2.v"

module FFT #(
    parameter   FLOAT_PRECISION = 64,
    parameter   logn = 8
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    fi_re, fi_im,
    s_re_1, s_im_1,
    s_re_2, s_im_2,
    s_re_3, s_im_3,
    // Output signals
    out_valid,
    tw_idx_1, 
    tw_idx_2, 
    tw_idx_3,
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

output reg                   out_valid;
output reg [logn:0]          tw_idx_1;
output reg [logn:0]          tw_idx_2;
output reg [logn:0]          tw_idx_3;
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

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
// RADIX2 #(FLOAT_PRECISION, logn, 1)
// u_stage_1 (
//     // Input signals
//     .clk(clk), .rst_n(rst_n),
//     .in_valid(in_valid_reg),
//     .di_re(fi_re_reg), .di_im(fi_im_reg),
//     .s_re(s_re_1_reg), .s_im(s_im_1_reg),
//     // Output signals
//     .tw_idx(tw_idx_1),
//     .out_valid(out_valid),
//     .do_re(fo_re), .do_im(fo_im)
// );

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
    end
end

endmodule
