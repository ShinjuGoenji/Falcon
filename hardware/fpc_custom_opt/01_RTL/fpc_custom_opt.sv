// Custom IEEE-754 Floating-Point Complex Arithmetic (No NaN/Inf/Subnormal)
// Optimized for area by removing special case handling

//================================================================
// FPC_ADD: Complex addition (combinational)
//================================================================
module FPC_ADD #(
    parameter FLOAT_PRECISION = 64
)(
    input  [FLOAT_PRECISION-1:0] a_re, a_im,
    input  [FLOAT_PRECISION-1:0] b_re, b_im,
    output [FLOAT_PRECISION-1:0] d_re, d_im
);

    // Real and imaginary parts use separate adders
    fpr_add u_add_re(.a(a_re), .b(b_re), .z(d_re));
    fpr_add u_add_im(.a(a_im), .b(b_im), .z(d_im));

endmodule

//================================================================
// FPC_SUB: Complex subtraction (combinational)
//================================================================
module FPC_SUB #(
    parameter FLOAT_PRECISION = 64
)(
    input  [FLOAT_PRECISION-1:0] a_re, a_im,
    input  [FLOAT_PRECISION-1:0] b_re, b_im,
    output [FLOAT_PRECISION-1:0] d_re, d_im
);

    // Flip sign bit of b operands for subtraction
    wire [FLOAT_PRECISION-1:0] b_re_neg = {~b_re[63], b_re[62:0]};
    wire [FLOAT_PRECISION-1:0] b_im_neg = {~b_im[63], b_im[62:0]};

    fpr_add u_sub_re(.a(a_re), .b(b_re_neg), .z(d_re));
    fpr_add u_sub_im(.a(a_im), .b(b_im_neg), .z(d_im));

endmodule

//================================================================
// FPC_MUL: Complex multiplication (2-stage pipeline)
//================================================================
module FPC_MUL #(
    parameter FLOAT_PRECISION = 64
)(
    input                        clk,
    input                        rst_n,
    input                        in_valid,
    input  [FLOAT_PRECISION-1:0] a_re, a_im,
    input  [FLOAT_PRECISION-1:0] b_re, b_im,
    output reg                   mult_valid,
    output [FLOAT_PRECISION-1:0] d_re, d_im
);

    localparam NBITS = FLOAT_PRECISION;

    wire [NBITS-1:0] prod_re_re, prod_im_im, prod_re_im, prod_im_re;

    fpr_mul u_mul_0(.a(a_re), .b(b_re), .z(prod_re_re));
    fpr_mul u_mul_1(.a(a_im), .b(b_im), .z(prod_im_im));
    fpr_mul u_mul_2(.a(a_re), .b(b_im), .z(prod_re_im));
    fpr_mul u_mul_3(.a(a_im), .b(b_re), .z(prod_im_re));

    reg [NBITS-1:0] prod_re_re_r, prod_im_im_r, prod_re_im_r, prod_im_re_r;
    reg in_valid_r;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            in_valid_r <= 1'b0;
            prod_re_re_r <= 0;
            prod_im_im_r <= 0;
            prod_re_im_r <= 0;
            prod_im_re_r <= 0;
        end else begin
            in_valid_r <= in_valid;
            prod_re_re_r <= prod_re_re;
            prod_im_im_r <= prod_im_im;
            prod_re_im_r <= prod_re_im;
            prod_im_re_r <= prod_im_re;
        end
    end

    wire [NBITS-1:0] d_re_temp, d_im_temp;
    wire [NBITS-1:0] prod_im_im_neg = {~prod_im_im_r[63], prod_im_im_r[62:0]};

    fpr_add u_add_re(.a(prod_re_re_r), .b(prod_im_im_neg), .z(d_re_temp));
    fpr_add u_add_im(.a(prod_re_im_r), .b(prod_im_re_r), .z(d_im_temp));

    assign d_re = d_re_temp;
    assign d_im = d_im_temp;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            mult_valid <= 1'b0;
        else
            mult_valid <= in_valid_r;
    end

endmodule

//================================================================
// fpr_add: IEEE-754 64-bit adder (Truncate, no special values)
//
// Handles three normalization cases:
//   1. Addition w/ carry  (sum[53]=1)  : shift right 1, exp+1
//   2. Addition w/o carry (sum[53]=0)  : leading 1 already at bit 52
//   3. Subtraction        (diff[53]=0) : leading 1 at bit k<=52, left-shift
//      (52-k) bits, exp-(52-k). Uses LZD on bits [52:0].
//================================================================
module fpr_add(
    input  [63:0] a,
    input  [63:0] b,
    output [63:0] z
);

    wire a_sign = a[63], b_sign = b[63];
    wire [10:0] a_exp = a[62:52], b_exp = b[62:52];
    wire [51:0] a_frac = a[51:0], b_frac = b[51:0];
    wire [52:0] a_mant = {(a_exp != 0), a_frac};
    wire [52:0] b_mant = {(b_exp != 0), b_frac};

    // Determine which operand has larger magnitude
    // (a_exp,a_mant) vs (b_exp,b_mant) as concatenated value
    wire a_ge_b_mag = (a_exp > b_exp) ||
                     ((a_exp == b_exp) && (a_mant >= b_mant));

    // Sort: 'big' = larger magnitude (no shift), 'small' = smaller (shifted)
    wire [52:0] big_mant_raw   = a_ge_b_mag ? a_mant : b_mant;
    wire [52:0] small_mant_raw = a_ge_b_mag ? b_mant : a_mant;
    wire [10:0] big_exp        = a_ge_b_mag ? a_exp  : b_exp;
    wire [10:0] small_exp      = a_ge_b_mag ? b_exp  : a_exp;
    wire        big_sign       = a_ge_b_mag ? a_sign : b_sign;

    wire [10:0] exp_diff_raw = big_exp - small_exp;
    wire [5:0]  exp_diff     = (exp_diff_raw > 11'd52) ? 6'd53 : exp_diff_raw[5:0];
    wire [52:0] small_mant   = small_mant_raw >> exp_diff;

    wire same_sign = (a_sign == b_sign);

    // Compute sum and difference (big >= small guaranteed by sorting)
    wire [53:0] mant_sum  = {1'b0, big_mant_raw} + {1'b0, small_mant};
    wire [53:0] mant_diff = {1'b0, big_mant_raw} - {1'b0, small_mant};
    wire [53:0] mant_result = same_sign ? mant_sum : mant_diff;

    // Carry: only happens for addition (subtraction yields bit 53 = 0)
    wire add_carry = same_sign & mant_result[53];

    // Leading-zero detector on bits [52:0] (for subtraction normalization)
    // Returns position of leading 1 measured from bit 52 (0 = at bit 52)
    // Returns 53 if all bits [52:0] are zero
    reg  [5:0] lzd;
    integer    i;
    reg        found;
    always @* begin
        lzd   = 6'd53;
        found = 1'b0;
        for (i = 52; i >= 0; i = i - 1) begin
            if (mant_result[i] && !found) begin
                lzd   = 6'd52 - i[5:0];
                found = 1'b1;
            end
        end
    end

    // Normalize: align leading 1 to bit 52
    wire [53:0] mant_normalized =
        add_carry             ? (mant_result >> 1) :   // case 1
        same_sign             ? mant_result        :   // case 2
                                (mant_result << lzd);  // case 3

    wire [10:0] final_exp =
        add_carry             ? (big_exp + 11'd1)        :
        same_sign             ?  big_exp                 :
                                 (big_exp - {5'b0, lzd});

    wire [51:0] final_frac = mant_normalized[51:0];

    // Sign of result: big_sign in both add and sub cases
    // (for add, both signs are same; for sub, magnitude winner)
    wire res_sign = big_sign;

    // Detect exact zero result (subtraction with identical magnitudes)
    wire is_zero = (mant_result == 54'd0);

    assign z = is_zero ? 64'd0 : {res_sign, final_exp, final_frac};

endmodule

//================================================================
// fpr_mul: IEEE-754 64-bit multiplier (Truncate mode)
//
// a_mant * b_mant ∈ [2^104, 2^106-1]
//   - prod[105]=1 : mantissa in [2,4), leading 1 at bit 105
//                   → fraction = prod[104:53], exp = a+b-1022
//   - prod[105]=0 : mantissa in [1,2), leading 1 at bit 104
//                   → fraction = prod[103:52], exp = a+b-1023
//================================================================
module fpr_mul(
    input  [63:0] a,
    input  [63:0] b,
    output [63:0] z
);

    wire a_sign = a[63], b_sign = b[63];
    wire [10:0] a_exp = a[62:52], b_exp = b[62:52];
    wire [51:0] a_frac = a[51:0], b_frac = b[51:0];
    wire [52:0] a_mant = {(a_exp != 0), a_frac};
    wire [52:0] b_mant = {(b_exp != 0), b_frac};

    wire [105:0] prod = a_mant * b_mant;
    wire [11:0]  exp_sum = {1'b0, a_exp} + {1'b0, b_exp};

    wire [11:0]  final_exp_raw = prod[105] ? (exp_sum - 12'd1022)
                                           : (exp_sum - 12'd1023);
    wire [10:0]  final_exp     = final_exp_raw[10:0];

    // Fraction depends on where the leading 1 lands
    wire [51:0]  final_frac    = prod[105] ? prod[104:53]
                                           : prod[103:52];

    wire         res_sign      = a_sign ^ b_sign;

    // Zero input → zero result
    wire         a_is_zero     = (a_exp == 11'd0) && (a_frac == 52'd0);
    wire         b_is_zero     = (b_exp == 11'd0) && (b_frac == 52'd0);
    wire         is_zero       = a_is_zero | b_is_zero;

    assign z = is_zero ? 64'd0 : {res_sign, final_exp, final_frac};

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
