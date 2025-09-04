module BUTTERFLY #(
    parameter   FLOAT_PRECISION = 64
)(
    // Input signals
    x_re, x_im,
    y_re, y_im,
    // Output signals
    X_re, X_im,
    Y_re, Y_im
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  [FLOAT_PRECISION-1:0] x_re;
input  [FLOAT_PRECISION-1:0] x_im;
input  [FLOAT_PRECISION-1:0] y_re;
input  [FLOAT_PRECISION-1:0] y_im;

output [FLOAT_PRECISION-1:0] X_re;
output [FLOAT_PRECISION-1:0] X_im;
output [FLOAT_PRECISION-1:0] Y_re;
output [FLOAT_PRECISION-1:0] Y_im;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
FPC_ADD #(.FLOAT_PRECISION(FLOAT_PRECISION))
u_FPC_ADD (
    // Input signals
    .a_re(x_re), .a_im(x_im),
    .b_re(y_re), .b_im(y_im),
    // Output signals
    .d_re(X_re), .d_im(X_im)
    );

FPC_SUB #(.FLOAT_PRECISION(FLOAT_PRECISION))
u_FPC_SUB (
    // Input signals
    .a_re(x_re), .a_im(x_im),
    .b_re(y_re), .b_im(y_im),
    // Output signals
    .d_re(Y_re), .d_im(Y_im)
    );

endmodule
