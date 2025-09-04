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
    in_valid,
    a_re, a_im,
    b_re, b_im,
    // Output signals
    out_valid,
    d
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam sig_width = 52;
localparam exp_width = 11;
localparam ieee_compliance = 0;
localparam faithful_round = 0;
localparam op_iso_mode = 1;
localparam id_width = 1;
localparam in_reg = 0;
localparam stages = 6;
localparam out_reg = 0;
localparam no_pm = 1;
localparam rst_mode = 0;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                             clk;
input                             rst_n;
input                             in_valid;
input       [FLOAT_PRECISION-1:0] a_re, a_im;
input       [FLOAT_PRECISION-1:0] b_re, b_im;

output reg                        out_valid;
output reg  [FLOAT_PRECISION-1:0] d;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [2:0] rnd = 3'b000;
wire [FLOAT_PRECISION-1:0] one_fp = 64'h3FF0_0000_0000_0000;

reg [FLOAT_PRECISION-1:0] a_re_2, next_a_re_2;
reg [FLOAT_PRECISION-1:0] a_im_2, next_a_im_2;
reg [FLOAT_PRECISION-1:0] b_re_2, next_b_re_2;
reg [FLOAT_PRECISION-1:0] b_im_2, next_b_im_2;

reg [FLOAT_PRECISION-1:0] a_norm_2;
reg [FLOAT_PRECISION-1:0] b_norm_2;

reg [FLOAT_PRECISION-1:0] a_norm_2_b_norm_2, next_a_norm_2_b_norm_2;
reg [FLOAT_PRECISION-1:0] next_d;

reg valid_reg [0:stages];

//---------------------------------------------------------------------
//   Submodule
//--------------------------------------------------------------------
DW_fp_square #(sig_width, exp_width, ieee_compliance)
u_FPR_SQR_0 ( .a(a_re), .rnd(rnd), .z(next_a_re_2));

DW_fp_square #(sig_width, exp_width, ieee_compliance)
u_FPR_SQR_1 ( .a(a_im), .rnd(rnd), .z(next_a_im_2));

DW_fp_square #(sig_width, exp_width, ieee_compliance)
u_FPR_SQR_2 ( .a(b_re), .rnd(rnd), .z(next_b_re_2));

DW_fp_square #(sig_width, exp_width, ieee_compliance)
u_FPR_SQR_3 ( .a(b_im), .rnd(rnd), .z(next_b_im_2));

DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPR_ADD_0 ( .a(a_re_2), .b(a_im_2), .rnd(rnd), .z(a_norm_2));

DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPR_ADD_1 ( .a(b_re_2), .b(b_im_2), .rnd(rnd), .z(b_norm_2));

DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPR_ADD_2 ( .a(a_norm_2), .b(b_norm_2), .rnd(rnd), .z(next_a_norm_2_b_norm_2));

DW_lp_piped_fp_div #(sig_width, exp_width, ieee_compliance, faithful_round, op_iso_mode, id_width, in_reg, stages, out_reg, no_pm, rst_mode)
u_FPR_DIV ( 
    .clk(clk), .rst_n(rst_n),
    .a(one_fp), .b(a_norm_2_b_norm_2), .rnd(rnd), .z(next_d),
    .launch(1'b1), .launch_id(1'b0), .accept_n(1'b0)
    );

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        a_re_2 <= 0;
        a_im_2 <= 0;
        b_re_2 <= 0;
        b_im_2 <= 0;
        a_norm_2_b_norm_2 <= 0;
        valid_reg[0] <= 0;
        d <= 0;
        out_valid <= 0;
    end
    else begin
        a_re_2 <= next_a_re_2;
        a_im_2 <= next_a_im_2;
        b_re_2 <= next_b_re_2;
        b_im_2 <= next_b_im_2;
        a_norm_2_b_norm_2 <= next_a_norm_2_b_norm_2;
        valid_reg[0] <= in_valid;
        d <= next_d;
        out_valid <= valid_reg[stages];
    end
end

genvar valid_idx;
generate
    for (valid_idx = 1; valid_idx <= stages; valid_idx = valid_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                valid_reg[valid_idx] <= 0;
            end
            else begin
                valid_reg[valid_idx] <= valid_reg[valid_idx-1];
            end
        end
    end
endgenerate

endmodule
