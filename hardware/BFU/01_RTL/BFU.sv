`include "FPC.sv"

module BFU  #(
    parameter FLOAT_PRECISION = 64
) (
    // Input signals
    clk,
    rst_n,
    in_valid,
    is_ifft,
    x_re, x_im,
    y_re, y_im,
    // Output signals
    out_valid,
    X_re, X_im,
    Y_re, Y_im
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                              clk;
input                              rst_n;
input                              in_valid;
input                              is_ifft;

input  [FLOAT_PRECISION-1:0]       x_re;
input  [FLOAT_PRECISION-1:0]       x_im;
input  [FLOAT_PRECISION-1:0]       y_re;
input  [FLOAT_PRECISION-1:0]       y_im;

output reg                             out_valid;
output reg [FLOAT_PRECISION-1:0]       X_re;
output reg [FLOAT_PRECISION-1:0]       X_im;
output reg [FLOAT_PRECISION-1:0]       Y_re;
output reg [FLOAT_PRECISION-1:0]       Y_im;

//---------------------------------------------------------------------
//   Wire & Reg
//---------------------------------------------------------------------
// reg [FLOAT_PRECISION-1:0] X_re_comb, X_im_comb;
// reg [FLOAT_PRECISION-1:0] Y_re_comb, Y_im_comb;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------

FPC_ADD u_FPC_ADD (
    .clk(clk),
    .rst_n(rst_n),
    // .in_valid(in_valid),
    .a_re(x_re),
    .a_im(x_im),
    .b_re(y_re),
    .b_im(y_im),
    .d_re(X_re),
    .d_im(X_im)
);

FPC_SUB u_FPC_SUB (
    .clk(clk),
    .rst_n(rst_n),
    // .in_valid(in_valid),
    .a_re(x_re),
    .a_im(x_im),
    .b_re(y_re),
    .b_im(y_im),
    .d_re(Y_re),
    .d_im(Y_im)
);


//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------

// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         out_valid <= 0;
//         X_re      <= 0;
//         X_im      <= 0;
//         Y_re      <= 0;
//         Y_im      <= 0;
//     end
//     else begin
//         out_valid <= in_valid;
//         X_re      <= X_re_comb;
//         X_im      <= X_im_comb;
//         Y_re      <= Y_re_comb;
//         Y_im      <= Y_im_comb;
//     end
// end


endmodule
