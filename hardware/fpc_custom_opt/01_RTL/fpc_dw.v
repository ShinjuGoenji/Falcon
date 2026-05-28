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
u_FPR_ADD_0 ( .a(a_re), .b(b_re), .rnd(rnd), .z(d_re));

DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPR_ADD_1 ( .a(a_im), .b(b_im), .rnd(rnd), .z(d_im));

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
u_FPR_SUB_0 ( .a(a_re), .b(b_re), .rnd(rnd), .z(d_re));

DW_fp_sub #(sig_width, exp_width, ieee_compliance)
u_FPR_SUB_1 ( .a(a_im), .b(b_im), .rnd(rnd), .z(d_im));

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
u_FPR_MUL_0 ( .a(a_re), .b(b_re), .rnd(rnd), .z(a_re_x_b_re));

DW_fp_mult #(sig_width, exp_width, ieee_compliance)
u_FPR_MUL_1 ( .a(a_im), .b(b_im), .rnd(rnd), .z(a_im_x_b_im));

DW_fp_mult #(sig_width, exp_width, ieee_compliance)
u_FPR_MUL_2 ( .a(a_re), .b(b_im), .rnd(rnd), .z(a_re_x_b_im));

DW_fp_mult #(sig_width, exp_width, ieee_compliance)
u_FPR_MUL_3 ( .a(a_im), .b(b_re), .rnd(rnd), .z(a_im_x_b_re));

DW_fp_sub #(sig_width, exp_width, ieee_compliance)
u_FPR_SUB ( .a(a_re_x_b_re_reg), .b(a_im_x_b_im_reg), .rnd(rnd), .z(d_re));

DW_fp_add #(sig_width, exp_width, ieee_compliance)
u_FPR_ADD ( .a(a_re_x_b_im_reg), .b(a_im_x_b_re_reg), .rnd(rnd), .z(d_im));

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

//================================================================
// FPC_TOP: Top-level multiplexer (selects ADD/SUB/MUL)
//================================================================
module FPC_TOP #(
    parameter FLOAT_PRECISION = 64
)(
    input  clk, rst_n,
    input  [FLOAT_PRECISION-1:0] a_re, a_im,
    input  [FLOAT_PRECISION-1:0] b_re, b_im,
    input  [1:0] op,  // 0=ADD, 1=SUB, 2=MUL
    input  in_valid,
    output [FLOAT_PRECISION-1:0] c_re, c_im,
    output out_valid
);

    wire [FLOAT_PRECISION-1:0] c_re_add, c_im_add;
    wire [FLOAT_PRECISION-1:0] c_re_sub, c_im_sub;
    wire [FLOAT_PRECISION-1:0] c_re_mul, c_im_mul;
    wire mul_valid;

    FPC_ADD u_add(.a_re(a_re), .a_im(a_im), .b_re(b_re), .b_im(b_im), .d_re(c_re_add), .d_im(c_im_add));
    FPC_SUB u_sub(.a_re(a_re), .a_im(a_im), .b_re(b_re), .b_im(b_im), .d_re(c_re_sub), .d_im(c_im_sub));
    FPC_MUL u_mul(.clk(clk), .rst_n(rst_n), .in_valid(in_valid), .a_re(a_re), .a_im(a_im), .b_re(b_re), .b_im(b_im), .mult_valid(mul_valid), .d_re(c_re_mul), .d_im(c_im_mul));

    // Delay valid signal for ADD/SUB
    reg in_valid_r;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            in_valid_r <= 1'b0;
        else
            in_valid_r <= in_valid;
    end

    // Select output and valid based on opcode
    assign c_re = (op == 2'b01) ? c_re_sub : (op == 2'b10) ? c_re_mul : c_re_add;
    assign c_im = (op == 2'b01) ? c_im_sub : (op == 2'b10) ? c_im_mul : c_im_add;
    assign out_valid = (op == 2'b10) ? mul_valid : in_valid_r;

endmodule
