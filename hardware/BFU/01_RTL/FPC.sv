/*
 * Addition of two complex numbers (d = a + b).
 */
module FPC_ADD #(
    parameter FLOAT_PRECISION = 64,
    parameter PIPELINE_STAGES = 2
)(
    // Input signals
    clk,
    rst_n,
    // in_valid,
    a_re, a_im,
    b_re, b_im,
    // Output signals
    d_re, d_im
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  clk;
input  rst_n;
// input  in_valid;
input  [FLOAT_PRECISION-1:0] a_re;
input  [FLOAT_PRECISION-1:0] a_im;
input  [FLOAT_PRECISION-1:0] b_re;
input  [FLOAT_PRECISION-1:0] b_im;

output [FLOAT_PRECISION-1:0] d_re;
output [FLOAT_PRECISION-1:0] d_im;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [FLOAT_PRECISION-1:0] comb_d_re, comb_d_im;
reg  [FLOAT_PRECISION-1:0] pipe_re [0:PIPELINE_STAGES-1];
reg  [FLOAT_PRECISION-1:0] pipe_im [0:PIPELINE_STAGES-1];

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
fpr_add u_FPR_ADD_0 (.x(a_re), .y(b_re), .z(comb_d_re));
fpr_add u_FPR_ADD_1 (.x(a_im), .y(b_im), .z(comb_d_im));

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pipe_re[0] <= 0;
        pipe_im[0] <= 0;
    end
    else begin
        pipe_re[0] <= comb_d_re;
        pipe_im[0] <= comb_d_im;
    end
end

genvar idx;
generate
    for (idx = 1; idx < PIPELINE_STAGES; idx = idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                pipe_re[idx] <= 0;
                pipe_im[idx] <= 0;
            end
            else begin
                pipe_re[idx] <= pipe_re[idx-1];
                pipe_im[idx] <= pipe_im[idx-1];
            end
        end
    end
endgenerate

assign d_re = pipe_re[PIPELINE_STAGES-1];
assign d_im = pipe_im[PIPELINE_STAGES-1];

endmodule

/*
 * Subtraction of two complex numbers (d = a - b).
 */
module FPC_SUB #(
    parameter FLOAT_PRECISION = 64,
    parameter PIPELINE_STAGES = 2
)(
    // Input signals
    clk,          
    rst_n,          
    // in_valid,       
    a_re, a_im,
    b_re, b_im,
    // Output signals
    d_re, d_im
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  clk;
input  rst_n;
input  [FLOAT_PRECISION-1:0] a_re;
input  [FLOAT_PRECISION-1:0] a_im;
input  [FLOAT_PRECISION-1:0] b_re;
input  [FLOAT_PRECISION-1:0] b_im;

output [FLOAT_PRECISION-1:0] d_re;
output [FLOAT_PRECISION-1:0] d_im;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
wire [FLOAT_PRECISION-1:0] b_re_neg;
wire [FLOAT_PRECISION-1:0] b_im_neg;
assign b_re_neg = {~b_re[63], b_re[62:0]};
assign b_im_neg = {~b_im[63], b_im[62:0]};

wire [FLOAT_PRECISION-1:0] comb_d_re, comb_d_im;
reg [FLOAT_PRECISION-1:0] pipe_re [0:PIPELINE_STAGES-1];
reg [FLOAT_PRECISION-1:0] pipe_im [0:PIPELINE_STAGES-1];

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
fpr_add u_FPR_SUB_0 (.x(a_re), .y(b_re_neg), .z(comb_d_re));
fpr_add u_FPR_SUB_1 (.x(a_im), .y(b_im_neg), .z(comb_d_im));

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pipe_re[0] <= 0;
        pipe_im[0] <= 0;
    end
    else begin
        pipe_re[0] <= comb_d_re;
        pipe_im[0] <= comb_d_im;
    end
end

genvar idx;
generate
    for (idx = 1; idx < PIPELINE_STAGES; idx = idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                pipe_re[idx] <= 0;
                pipe_im[idx] <= 0;
            end
            else begin
                pipe_re[idx] <= pipe_re[idx-1];
                pipe_im[idx] <= pipe_im[idx-1];
            end
        end
    end
endgenerate

assign d_re = pipe_re[PIPELINE_STAGES-1];
assign d_im = pipe_im[PIPELINE_STAGES-1];

endmodule

/*
 * Multiplication of two complex numbers (d = a * b).
 */
module FPC_MUL #(
    parameter FLOAT_PRECISION = 64,
    parameter PIPELINE_STAGES = 2
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    a_re, a_im,
    b_re, b_im,
    // Output signals
    out_valid,
    d_re, d_im
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                              clk;
input                              rst_n;
input                              in_valid;
input  [FLOAT_PRECISION-1:0]       a_re;
input  [FLOAT_PRECISION-1:0]       a_im;
input  [FLOAT_PRECISION-1:0]       b_re;
input  [FLOAT_PRECISION-1:0]       b_im;

output                             out_valid;
output [FLOAT_PRECISION-1:0]       d_re;
output [FLOAT_PRECISION-1:0]       d_im;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [FLOAT_PRECISION-1:0] prod_re_re, prod_im_im, prod_re_im, prod_im_re;
wire [FLOAT_PRECISION-1:0] add_re_comb, add_im_comb;
wire [FLOAT_PRECISION-1:0] prod_im_im_neg;
assign prod_im_im_neg = {~prod_im_im[63], prod_im_im[62:0]};

reg        valid   [0:PIPELINE_STAGES-1];
reg [63:0] pipe_re [0:PIPELINE_STAGES-1];
reg [63:0] pipe_im [0:PIPELINE_STAGES-1];

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
fpr_mul u_FPR_MUL_0 (.x(a_re), .y(b_re), .z(prod_re_re));
fpr_mul u_FPR_MUL_1 (.x(a_im), .y(b_im), .z(prod_im_im));
fpr_mul u_FPR_MUL_2 (.x(a_re), .y(b_im), .z(prod_re_im));
fpr_mul u_FPR_MUL_3 (.x(a_im), .y(b_re), .z(prod_im_re));

fpr_add u_FPR_ADD_0 (.x(prod_re_re), .y(prod_im_im_neg), .z(add_re_comb));
fpr_add u_FPR_ADD_1 (.x(prod_re_im), .y(prod_im_re),     .z(add_im_comb));

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        valid[0]   <= 0;
        pipe_re[0] <= 0;
        pipe_im[0] <= 0;
    end
    else begin
        valid[0]   <= in_valid;
        pipe_re[0] <= add_re_comb;
        pipe_im[0] <= add_im_comb;
    end
end

genvar idx;
generate
    for (idx = 1; idx < PIPELINE_STAGES; idx = idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                valid[idx]   <= 0;
                pipe_re[idx] <= 0;
                pipe_im[idx] <= 0;
            end
            else begin
                valid[idx]   <= valid[idx-1];
                pipe_re[idx] <= pipe_re[idx-1];
                pipe_im[idx] <= pipe_im[idx-1];
            end
        end
    end
endgenerate

assign out_valid = valid[PIPELINE_STAGES-1];
assign d_re      = pipe_re[PIPELINE_STAGES-1];
assign d_im      = pipe_im[PIPELINE_STAGES-1];

endmodule

module fpr_add (
    // Input Signals
    x,
    y,
    // Output Signals
    z
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  [63:0] x;
input  [63:0] y;
output [63:0] z;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
/*
 * Input Unpacking
 */
wire        x_sign;
wire [10:0] x_exp;
wire [51:0] x_frac;
wire [52:0] x_mant;

wire        y_sign;
wire [10:0] y_exp;
wire [51:0] y_frac;
wire [52:0] y_mant;

/*
 * Magnitude Comparison
 */
wire [62:0] x_abs;
wire [62:0] y_abs;
wire        x_ge_y_mag;

/*
 * Exponent Difference
 */
wire [11:0] sub_xy;
wire [11:0] sub_yx;
wire [10:0] exp_diff_raw;
wire [5:0]  exp_diff;

/*
 * Mantissa Alignment & Selection
 */
wire [52:0] x_mant_shifted;
wire [52:0] y_mant_shifted;
wire [52:0] big_mant_raw;
wire [52:0] small_mant;
wire [10:0] big_exp;
wire        big_sign;
wire        same_sign;

/*
 * Arithmetic Results
 */
wire [53:0] mant_sum;
wire [53:0] mant_diff;
wire [53:0] mant_result;
wire        add_carry;

/*
 * Leading Zero Detection
 */
wire [5:0]  tree_pos;
wire        tree_valid;
wire [5:0]  lzd;

/*
 * Normalization & Output
 */
wire [53:0] mant_normalized;
wire [10:0] final_exp;
wire [51:0] final_frac;
wire        res_sign;
wire        is_zero;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------

/*
 * Extract sign, exponent, and fraction from IEEE-754 inputs.
 * The hidden bit (1) is restored for the mantissa if the exponent is non-zero.
 */
assign x_sign = x[63];
assign x_exp  = x[62:52];
assign x_frac = x[51:0];
assign x_mant = {(x_exp != 0), x_frac};

assign y_sign = y[63];
assign y_exp  = y[62:52];
assign y_frac = y[51:0];
assign y_mant = {(y_exp != 0), y_frac};

/*
 * Compare magnitudes directly as unsigned integers.
 * This determines which operand is larger to guarantee a positive result during subtraction.
 */
assign x_abs      = x[62:0];
assign y_abs      = y[62:0];
assign x_ge_y_mag = (x_abs >= y_abs);

/*
 * Calculate exponent difference in both directions simultaneously to speed up logic.
 * The difference is capped at 53, as shifts larger than the mantissa width result in zero.
 */
assign sub_xy = {1'b0, x_exp} - {1'b0, y_exp};
assign sub_yx = {1'b0, y_exp} - {1'b0, x_exp};

assign exp_diff_raw = x_ge_y_mag ? sub_xy[10:0] : sub_yx[10:0];
assign exp_diff     = (exp_diff_raw > 11'd52) ? 6'd53 : exp_diff_raw[5:0];

/*
 * Shift both mantissas speculatively in parallel.
 * This removes the multiplexer delay from the critical path before shifting.
 */
assign x_mant_shifted = x_mant >> exp_diff;
assign y_mant_shifted = y_mant >> exp_diff;

/*
 * Select the unshifted mantissa for the larger operand, 
 * and the shifted mantissa for the smaller operand.
 */
assign big_mant_raw = x_ge_y_mag ? x_mant : y_mant;
assign small_mant   = x_ge_y_mag ? y_mant_shifted : x_mant_shifted;

assign big_exp  = x_ge_y_mag ? x_exp  : y_exp;
assign big_sign = x_ge_y_mag ? x_sign : y_sign;

assign same_sign = (x_sign == y_sign);

/*
 * Compute both sum and difference in parallel.
 * Output the sum if signs match, otherwise output the difference.
 */
assign mant_sum    = {1'b0, big_mant_raw} + {1'b0, small_mant};
assign mant_diff   = {1'b0, big_mant_raw} - {1'b0, small_mant};
assign mant_result = same_sign ? mant_sum : mant_diff;

/*
 * Add carry
 */
assign add_carry = same_sign & mant_result[53];

/*
 * Leading zero detection for post-subtraction normalization.
 */
lzd64 u_lzd_tree (
    .in({mant_result[52:0], 11'd0}),
    .pos(tree_pos),
    .valid(tree_valid)
);

assign lzd = tree_valid ? tree_pos : 6'd53;

/*
 * Normalize the mantissa.
 * If addition produced a carry, shift right. 
 * If subtraction cancelled bits, shift left by the leading zero count.
 */
assign mant_normalized =
    add_carry ? (mant_result >> 1) :
    same_sign ?  mant_result       :
                (mant_result << lzd);

/*
 * Adjust the final exponent to match the mantissa normalization.
 */
assign final_exp =
    add_carry ? (big_exp + 11'd1)        :
    same_sign ?  big_exp                 :
                    (big_exp - {5'b0, lzd});

/*
 * Final assignments
 */
assign final_frac = mant_normalized[51:0];
assign res_sign   = big_sign;
assign is_zero    = (mant_result == 54'd0);

assign z = is_zero ? 64'd0 : {res_sign, final_exp, final_frac};

endmodule

/*
 * Floating-Point Multiplier
 */
module fpr_mul (
    // Input Signals
    x,
    y,
    // Output Signals
    z
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  [63:0] x;
input  [63:0] y;
output [63:0] z;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
/*
 * Input Unpacking
 */
wire        x_sign;
wire        y_sign;
wire [10:0] x_exp;
wire [10:0] y_exp;
wire [51:0] x_frac;
wire [51:0] y_frac;
wire [52:0] x_mant;
wire [52:0] y_mant;

/*
 * Multiplication Result
 */
wire [105:0] prod;

/*
 * Exponent Calculation
 */
wire [11:0] exp_sum;
wire [10:0] exp_case1;
wire [10:0] exp_case0;

/*
 * Flags
 */
wire        is_zero;
wire        res_sign;

/*
 * Normalization & Output
 */
wire [10:0] final_exp;
wire [51:0] final_frac;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------

/*
 * Extract sign, exponent, and fraction from IEEE-754 inputs.
 * The hidden bit (1) is restored for the mantissa if the exponent is non-zero.
 */
assign x_sign = x[63];
assign y_sign = y[63];
assign x_exp  = x[62:52];
assign y_exp  = y[62:52];
assign x_frac = x[51:0];
assign y_frac = y[51:0];
assign x_mant = {(x_exp != 0), x_frac};
assign y_mant = {(y_exp != 0), y_frac};

/*
 * 53x53-bit mantissa multiplication.
 * This forms the critical path of the multiplier and runs entirely in 
 * parallel with the exponent calculation to save cycles.
 */
assign prod = x_mant * y_mant;

/*
 * Parallel exponent calculation.
 * Precompute both possible exponent outcomes before the multiplication finishes.
 * exp_case1 accounts for product overflow (prod[105] == 1) requiring a right shift.
 * exp_case0 assumes standard bounds (prod[105] == 0).
 */
assign exp_sum   = {1'b0, x_exp} + {1'b0, y_exp};
assign exp_case1 = exp_sum - 12'd1022; 
assign exp_case0 = exp_sum - 12'd1023; 

/*
 * Determine final sign via XOR and identify if either operand is strictly zero.
 */
assign is_zero  = ((x_exp == 11'd0) && (x_frac == 52'd0)) |
                  ((y_exp == 11'd0) && (y_frac == 52'd0));
assign res_sign = x_sign ^ y_sign;

/*
 * Normalize the result using a fast 2-to-1 multiplexer.
 * As soon as the Most Significant Bit of the product (prod[105]) arrives, 
 * immediately route the precomputed exponent and the correctly shifted fraction.
 */
assign final_exp  = prod[105] ? exp_case1    : exp_case0;
assign final_frac = prod[105] ? prod[104:53] : prod[103:52];

/*
 * Final assignments
 */
assign z = is_zero ? 64'd0 : {res_sign, final_exp, final_frac};

endmodule

/*
 * 8-bit Leading Zero Detector
 */
module lzd8 (
    // Input Signals
    in,
    // Output Signals
    pos,
    valid
);
//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  [7:0] in;
output [2:0] pos;
output       valid;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------

/*
 * Valid flag indicates if there is at least one non-zero bit
 */
assign valid = |in;

/*
 * Priority encoder to find the position of the first '1' from MSB
 */
assign pos = in[7] ? 3'd0 :
             in[6] ? 3'd1 :
             in[5] ? 3'd2 :
             in[4] ? 3'd3 :
             in[3] ? 3'd4 :
             in[2] ? 3'd5 :
             in[1] ? 3'd6 : 3'd7;

endmodule


/*
 * 64-bit Leading Zero Detector (Tree structure)
 */
module lzd64 (
    // Input Signals
    in,
    // Output Signals
    pos,
    valid
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  [63:0] in;
output [5:0]  pos;
output        valid;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
/*
 * Position outputs from 8-bit sub-modules.
 * Declared as separate scalars to prevent synthesis tools from 
 * inferring memory structures for these outputs.
 */
wire [2:0] p0;
wire [2:0] p1;
wire [2:0] p2;
wire [2:0] p3;
wire [2:0] p4;
wire [2:0] p5;
wire [2:0] p6;
wire [2:0] p7;

/*
 * Valid flags from 8-bit sub-modules
 */
wire [7:0] v;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------

/*
 * Instantiate 8-bit LZDs to evaluate each byte in parallel
 */
lzd8 u_lzd7 (.in(in[63:56]), .pos(p7), .valid(v[7]));
lzd8 u_lzd6 (.in(in[55:48]), .pos(p6), .valid(v[6]));
lzd8 u_lzd5 (.in(in[47:40]), .pos(p5), .valid(v[5]));
lzd8 u_lzd4 (.in(in[39:32]), .pos(p4), .valid(v[4]));
lzd8 u_lzd3 (.in(in[31:24]), .pos(p3), .valid(v[3]));
lzd8 u_lzd2 (.in(in[23:16]), .pos(p2), .valid(v[2]));
lzd8 u_lzd1 (.in(in[15:8]),  .pos(p1), .valid(v[1]));
lzd8 u_lzd0 (.in(in[7:0]),   .pos(p0), .valid(v[0]));

/*
 * Global valid flag
 */
assign valid = |v;

/*
 * Hierarchical position resolution.
 * Selects the highest active byte block, concatenating the macro-block 
 * index (top 3 bits) with the specific sub-block position (bottom 3 bits).
 */
assign pos = v[7] ? {3'd0, p7} :
             v[6] ? {3'd1, p6} :
             v[5] ? {3'd2, p5} :
             v[4] ? {3'd3, p4} :
             v[3] ? {3'd4, p3} :
             v[2] ? {3'd5, p2} :
             v[1] ? {3'd6, p1} :
                    {3'd7, p0};

endmodule