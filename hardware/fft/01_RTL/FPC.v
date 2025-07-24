/*
 * Addition of two complex numbers (d = a + b).
 */
module FPC_ADD #(
    parameter FLOAT_PRECISION = 64
)(
    // Input signals
    a_re, a_im,
    b_re, b_im,
    // Output signals
    d_re, d_im
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
input  [FLOAT_PRECISION-1:0] a_re;
input  [FLOAT_PRECISION-1:0] a_im;
input  [FLOAT_PRECISION-1:0] b_re;
input  [FLOAT_PRECISION-1:0] b_im;

output [FLOAT_PRECISION-1:0] d_re;
output [FLOAT_PRECISION-1:0] d_im;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [2:0] rnd = 3'b000;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPC_ADD_0 ( .a(a_re), .b(b_re), .rnd(rnd), .z(d_re));

DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPC_ADD_1 ( .a(a_im), .b(b_im), .rnd(rnd), .z(d_im));

endmodule

/*
 * Subtraction of two complex numbers (d = a - b).
 */
module FPC_SUB #(
    parameter FLOAT_PRECISION = 64
)(
    // Input signals
    a_re, a_im,
    b_re, b_im,
    // Output signals
    d_re, d_im
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
input  [FLOAT_PRECISION-1:0] a_re;
input  [FLOAT_PRECISION-1:0] a_im;
input  [FLOAT_PRECISION-1:0] b_re;
input  [FLOAT_PRECISION-1:0] b_im;

output [FLOAT_PRECISION-1:0] d_re;
output [FLOAT_PRECISION-1:0] d_im;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [2:0] rnd = 3'b000;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
DW_fp_sub #(sig_width, exp_width, ieee_compliance)
u_FPC_SUB_0 ( .a(a_re), .b(b_re), .rnd(rnd), .z(d_re));

DW_fp_sub #(sig_width, exp_width, ieee_compliance)
u_FPC_SUB_1 ( .a(a_im), .b(b_im), .rnd(rnd), .z(d_im));

endmodule

/*
 * Multplication of two complex numbers (d = a * b).
 */
module FPC_MUL #(
    parameter FLOAT_PRECISION = 64
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    a_re, a_im,
    b_re, b_im,
    // Output signals
    mult_valid,
    d_re, d_im
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
input                        clk;
input                        rst_n;
input                        in_valid;
input  [FLOAT_PRECISION-1:0] a_re;
input  [FLOAT_PRECISION-1:0] a_im;
input  [FLOAT_PRECISION-1:0] b_re;
input  [FLOAT_PRECISION-1:0] b_im;

output reg                   mult_valid;
output [FLOAT_PRECISION-1:0] d_re;
output [FLOAT_PRECISION-1:0] d_im;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [2:0] rnd = 3'b000;

reg [FLOAT_PRECISION-1:0] a_re_x_b_re, a_re_x_b_re_reg;
reg [FLOAT_PRECISION-1:0] a_im_x_b_im, a_im_x_b_im_reg;
reg [FLOAT_PRECISION-1:0] a_re_x_b_im, a_re_x_b_im_reg;
reg [FLOAT_PRECISION-1:0] a_im_x_b_re, a_im_x_b_re_reg;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
DW_fp_mult #(sig_width, exp_width, ieee_compliance)
u_FPC_MUL_0 ( .a(a_re), .b(b_re), .rnd(rnd), .z(a_re_x_b_re));

DW_fp_mult #(sig_width, exp_width, ieee_compliance)
u_FPC_MUL_1 ( .a(a_im), .b(b_im), .rnd(rnd), .z(a_im_x_b_im));

DW_fp_mult #(sig_width, exp_width, ieee_compliance)
u_FPC_MUL_2 ( .a(a_re), .b(b_im), .rnd(rnd), .z(a_re_x_b_im));

DW_fp_mult #(sig_width, exp_width, ieee_compliance)
u_FPC_MUL_3 ( .a(a_im), .b(b_re), .rnd(rnd), .z(a_im_x_b_re));

DW_fp_sub #(sig_width, exp_width, ieee_compliance)
u_FPC_SUB ( .a(a_re_x_b_re_reg), .b(a_im_x_b_im_reg), .rnd(rnd), .z(d_re));

DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPC_ADD ( .a(a_re_x_b_im_reg), .b(a_im_x_b_re_reg), .rnd(rnd), .z(d_im));

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        mult_valid <= 0;
        a_re_x_b_re_reg <= 0;
        a_im_x_b_im_reg <= 0;
        a_re_x_b_im_reg <= 0;
        a_im_x_b_re_reg <= 0;
    end
    else begin
        mult_valid <= in_valid;
        a_re_x_b_re_reg <= a_re_x_b_re;
        a_im_x_b_im_reg <= a_im_x_b_im;
        a_re_x_b_im_reg <= a_re_x_b_im;
        a_im_x_b_re_reg <= a_im_x_b_re;
    end
end

endmodule
