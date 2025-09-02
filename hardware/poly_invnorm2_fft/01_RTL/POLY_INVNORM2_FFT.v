/*
 * Given f and g (in FFT representation), compute 1/(f*adj(f)+g*adj(g))
 * (also in FFT representation). Since the result is auto-adjoint, all its
 * coordinates in FFT representation are real; as such, only the first N/2
 * values of d[] are filled (the imaginary parts are skipped).
 *
 * Array d MUST NOT overlap with either a or b.
 */
module POLY_INVNORM2_FFT #(
    parameter FLOAT_PRECISION = 64
)( 
    // Input signals
    clk, 
    rst_n,
    a_re, a_im,
    b_re, b_im,
    // Output signals
    d
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam sig_width = 52;
localparam exp_width = 11;
localparam ieee_compliance = 0;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                             clk;
input                             rst_n;
input       [FLOAT_PRECISION-1:0] a_re, a_im;
input       [FLOAT_PRECISION-1:0] b_re, b_im;

output reg  [FLOAT_PRECISION-1:0] d;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [2:0] rnd = 3'b000;
wire [FLOAT_PRECISION-1:0] one_fp = 64'h3FF0_0000_0000_0000;

reg [FLOAT_PRECISION-1:0] a_re_2;
reg [FLOAT_PRECISION-1:0] a_im_2;
reg [FLOAT_PRECISION-1:0] b_re_2;
reg [FLOAT_PRECISION-1:0] b_im_2;

reg [FLOAT_PRECISION-1:0] a_norm_2;
reg [FLOAT_PRECISION-1:0] b_norm_2;

reg [FLOAT_PRECISION-1:0] a_norm_2_b_norm_2, next_a_norm_2_b_norm_2;
reg [FLOAT_PRECISION-1:0] next_d;

//---------------------------------------------------------------------
//   Submodule
//--------------------------------------------------------------------
DW_fp_square #(sig_width, exp_width, ieee_compliance)
u_FPR_SQR_0 ( .a(a_re), .rnd(rnd), .z(a_re_2));

DW_fp_square #(sig_width, exp_width, ieee_compliance)
u_FPR_SQR_1 ( .a(a_im), .rnd(rnd), .z(a_im_2));

DW_fp_square #(sig_width, exp_width, ieee_compliance)
u_FPR_SQR_2 ( .a(b_re), .rnd(rnd), .z(b_re_2));

DW_fp_square #(sig_width, exp_width, ieee_compliance)
u_FPR_SQR_3 ( .a(b_im), .rnd(rnd), .z(b_im_2));

DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPR_ADD_0 ( .a(a_re_2), .b(a_im_2), .rnd(rnd), .z(a_norm_2));

DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPR_ADD_1 ( .a(b_re_2), .b(b_im_2), .rnd(rnd), .z(b_norm_2));

DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPR_ADD_2 ( .a(a_norm_2), .b(b_norm_2), .rnd(rnd), .z(next_a_norm_2_b_norm_2));

DW_fp_div #(sig_width, exp_width, ieee_compliance)
u_FPR_DIV ( .a(one_fp), .b(a_norm_2_b_norm_2), .rnd(rnd), .z(next_d));

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        a_norm_2_b_norm_2 <= 0;
        d <= 0;
    end
    else begin
        a_norm_2_b_norm_2 <= next_a_norm_2_b_norm_2;
        d <= next_d;
    end
end

endmodule