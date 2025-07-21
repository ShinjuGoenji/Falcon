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
parameter sig_width = 52;
parameter exp_width = 11;
parameter ieee_compliance = 0;

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
wire rnd = 3'b000;

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
parameter sig_width = 52;
parameter exp_width = 11;
parameter ieee_compliance = 0;

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
wire rnd = 3'b000;

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
    a_re, a_im,
    b_re, b_im,
    // Output signals
    d_re, d_im
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter sig_width = 52;
parameter exp_width = 11;
parameter ieee_compliance = 0;

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
wire rnd = 3'b000;

wire [FLOAT_PRECISION-1:0] a_re_x_b_re;
wire [FLOAT_PRECISION-1:0] a_im_x_b_im;
wire [FLOAT_PRECISION-1:0] a_re_x_b_im;
wire [FLOAT_PRECISION-1:0] a_im_x_b_re;

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
u_FPC_SUB ( .a(a_re_x_b_re), .b(a_im_x_b_im), .rnd(rnd), .z(d_re));

DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPC_ADD ( .a(a_re_x_b_im), .b(a_im_x_b_re), .rnd(rnd), .z(d_im));
endmodule
