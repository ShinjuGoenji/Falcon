/*
 * The implementation of KECCAK-f permutation function.
 * Generate a random value with a Gaussian distribution centered on 0.
 * The RNG must be ready for extraction (already flipped).
 *
 * Distribution has standard deviation 1.17*sqrt(q/(2*N)). The
 * precomputed table is for N = 1024. Since the sum of two independent
 * values of standard deviation sigma has standard deviation
 * sigma*sqrt(2), then we can just generate more values and add them
 * together for lower dimensions.
 * @param 
 */
module MKGAUSS #(
    parameter [3:0] logn = 9
)( 
    // Input signals
    clk,
    rst_n,
    r_valid,
    r1,
    r2,
    // Output signals
    val_valid,
    val
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                    clk;
input                    rst_n;
input                    r_valid;
input             [63:0] r1;
input             [63:0] r2;

output reg               val_valid;
output reg signed [31:0] val;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam g = 1 << (10 - logn);

/*
 * Table below incarnates a discrete Gaussian distribution:
 * D(x) = exp(-(x^2)/(2*sigma^2))
 * where sigma = 1.17*sqrt(q/(2*N)), q = 12289, and N = 1024.
 * Element 0 of the table is P(x = 0).
 * For k > 0, element k is P(x >= k+1 | x > 0).
 * Probabilities are scaled up by 2^63.
 */
localparam GAUSS_TABLE_SIZE = 27;
localparam [63:0] GAUSS_1024_12289 [0:GAUSS_TABLE_SIZE-1] = {
  64'd1283868770400643928, 64'd6416574995475331444, 64'd4078260278032692663,
  64'd2353523259288686585, 64'd1227179971273316331, 64'd575931623374121527,
  64'd242543240509105209,  64'd91437049221049666,   64'd30799446349977173,
  64'd9255276791179340,    64'd2478152334826140,    64'd590642893610164,
  64'd125206034929641,     64'd23590435911403,      64'd3948334035941,
  64'd586753615614,        64'd77391054539,         64'd9056793210,
  64'd940121950,           64'd86539696,            64'd7062824,
  64'd510971,              64'd32764,               64'd1862,
  64'd94,                  64'd4,                   64'd0
};

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg [1:0] cnt, cnt_reg;

reg [62:0] r1_lo, r2_lo;
reg neg, f;

reg [GAUSS_TABLE_SIZE-2:0] t;
reg signed [31:0] _v, v;

//---------------------------------------------------------------------
//   FSM
//---------------------------------------------------------------------
always @(*) begin
    if (r_valid)
        cnt = cnt_reg + 1;
    else if (val_valid)
        cnt = 0;
    else
        cnt = cnt_reg;
end

//---------------------------------------------------------------------
//   Datapath Logic
//---------------------------------------------------------------------

/*
 * Each iteration generates one value with the
 * Gaussian distribution for N = 1024.
 *
 * We use two random 64-bit values. First value
 * decides on whether the generated value is 0, and,
 * if not, the sign of the value. Second random 64-bit
 * word is used to generate the non-zero value.
 *
 * For constant-time code we have to read the complete
 * table. This has negligible cost, compared with the
 * remainder of the keygen process (solving the NTRU
 * equation).
 */

/*
 * First value:
 *  - flag 'neg' is randomly selected to be 0 or 1.
 *  - flag 'f' is set to 1 if the generated value is zero,
 *    or set to 0 otherwise.
 */
assign neg = r1[63];
assign r1_lo = r1[62:0];
assign f = r1_lo < GAUSS_1024_12289[0]; 

/*
 * We produce a new random 63-bit integer r2, and go over
 * the array, starting at index 1. We store in v the
 * index of the first array element which is not greater
 * than r, unless the flag f was already 1.
 */
assign r2_lo = r2[62:0];
genvar k;
generate
    for (k = 1; k < GAUSS_TABLE_SIZE; k = k + 1) begin
        always @(*) begin
            t[k-1] = r2_lo >= GAUSS_1024_12289[k]; 
        end
    end
endgenerate

always @(*) begin
    case (t)
        'h2000000: _v = 'd26;
        'h3000000: _v = 'd25;
        'h3800000: _v = 'd24;
        'h3c00000: _v = 'd23;
        'h3e00000: _v = 'd22; 
        'h3f00000: _v = 'd21; 
        'h3f80000: _v = 'd20; 
        'h3fc0000: _v = 'd19;
        'h3fe0000: _v = 'd18; 
        'h3ff0000: _v = 'd17; 
        'h3ff8000: _v = 'd16; 
        'h3ffc000: _v = 'd15; 
        'h3ffe000: _v = 'd14; 
        'h3fff000: _v = 'd13; 
        'h3fff800: _v = 'd12; 
        'h3fffc00: _v = 'd11; 
        'h3fffe00: _v = 'd10; 
        'h3ffff00: _v = 'd9; 
        'h3ffff80: _v = 'd8; 
        'h3ffffc0: _v = 'd7; 
        'h3ffffe0: _v = 'd6; 
        'h3fffff0: _v = 'd5; 
        'h3fffff8: _v = 'd4; 
        'h3fffffc: _v = 'd3; 
        'h3fffffe: _v = 'd2; 
        'h3ffffff: _v = 'd1; 
        default:   _v = 'd0; 
    endcase
end

/*
 * Generated value is added to v.
 */
always @(*) begin
    if (f)
        v = val;
    else begin
        if (neg)
            v = val - _v;
        else 
            v = val + _v;
    end
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt_reg <= 0;
    end
    else begin
        cnt_reg <= cnt;
    end
end

//---------------------------------------------------------------------
//   Output Assignments
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
        val_valid <= 0;
    else begin
        if (cnt_reg == (g - 1) && r_valid)
            val_valid <= 1;
        else
            val_valid <= 0;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
        val <= 0;
    else begin
        if (r_valid)
            val <= v;
        else if (val_valid)
            val <= 0;
        else
            val <= val;
    end
end

endmodule