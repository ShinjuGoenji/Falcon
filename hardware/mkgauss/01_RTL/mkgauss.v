/*
 * Generate a random value with a Gaussian distribution centered on 0.
 * The RNG must be ready for extraction (already flipped).
 *
 * Distribution has standard deviation 1.17*sqrt(q/(2*N)). The
 * precomputed table is for N = 1024. Since the sum of two independent
 * values of standard deviation sigma has standard deviation
 * sigma*sqrt(2), then we can just generate more values and add them
 * together for lower dimensions.
 */
module MKGAUSS #(
    parameter [3:0] logn = 9
)( 
    // Input signals
    clk,
    rst_n,
    r1_valid,
    r2_valid,
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
input                    r1_valid;
input                    r2_valid;
input             [63:0] r1;
input             [63:0] r2;

output reg               val_valid;
output reg signed [31:0] val;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam G = 1 << (10 - logn);

// Each sample requires 2 RNG values, so we need 2*G cycles.
localparam CYCLE_COUNT_WIDTH = $clog2(2 * G) + 1;
localparam GAUSS_TABLE_SIZE = 27;

/*
 * Table below incarnates a discrete Gaussian distribution:
 * D(x) = exp(-(x^2)/(2*sigma^2))
 * where sigma = 1.17*sqrt(q/(2*N)), q = 12289, and N = 1024.
 * Element 0 of the table is P(x = 0).
 * For k > 0, element k is P(x >= k+1 | x > 0).
 * Probabilities are scaled up by 2^63.
 */
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
//   State Machine Declarations
//---------------------------------------------------------------------
localparam S_IDLE = 2'b00;
localparam S_DECIDE  = 2'b01;
localparam S_SAMPLE = 2'b10;
localparam S_DONE = 2'b11;

reg [1:0] state_reg, state_next;
reg [CYCLE_COUNT_WIDTH-1:0] cycle_count_reg, cycle_count_next;
reg signed [31:0] val_acc_reg, val_acc_next;
reg [63:0] r1_reg, r1_next;

//---------------------------------------------------------------------
//   FSM & Datapath Logic
//---------------------------------------------------------------------

/*
 * First value:
 *  - flag 'neg' is randomly selected to be 0 or 1.
 *  - flag 'f' is set to 1 if the generated value is zero,
 *    or set to 0 otherwise.
 */
reg [62:0] r1_lo, r2_lo;
assign neg = r1[63];
assign r1_lo = r1[62:0];
assign f = r1_lo < GAUSS_1024_12289[0]; 

/*
 * We produce a new random 63-bit integer r, and go over
 * the array, starting at index 1. We store in v the
 * index of the first array element which is not greater
 * than r, unless the flag f was already 1.
 */
assign r2_lo = r2[62:0];
reg [GAUSS_TABLE_SIZE-2:0] t;
genvar k;
generate
    for (k = 1; k < GAUSS_TABLE_SIZE; k = k + 1) begin
        always @(*) begin
            t[k-1] = r2_lo >= GAUSS_1024_12289[k]; 
        end
    end
endgenerate

reg signed [31:0] _v, v;
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

reg [1:0] cnt, cnt_reg;
always @(*) begin
    if (r1_valid)
        cnt = cnt_reg + 1;
    else if (val_valid)
        cnt = 0;
    else
        cnt = cnt_reg;
end
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        cnt_reg <= 0;
    else 
        cnt_reg <= cnt;
end

// reg [1:0] cnt, cnt_reg;
// always @(*) begin
//     cnt = cnt_reg;

//     if (en) begin
//         // We need G cycles to get G samples
//         if (cnt == G - 1)

//         cnt = cnt + 1;
//     end

//     case (state_reg)
//         S_IDLE: begin
//             if (rng_1_valid) begin
//                 val_acc_next = 32'sd0;
//                 cycle_count_next = 0;
//                 r1_next = rng;
//                 state_next = S_RUN;
//             end
//         end
//         S_RUN: begin
//             // We need 2*G cycles to get G samples
//             if (cycle_count_reg == (2*G - 1)) begin
//                 state_next = S_DONE;
//             end else begin
//                 cycle_count_next = cycle_count_reg + 1;
//                 // On odd cycles (1, 3, 5...), we have a pair of RNGs
//                 if (cycle_count_reg[0]) begin
//                     val_acc_next = val_acc_reg + current_sample;
//                 end else begin
//                     // On even cycles (2, 4, 6...), latch the next r1
//                     r1_next = rng;
//                 end
//             end
//         end
//         S_DONE: begin
//             // Output is valid for one cycle, then return to idle
//             state_next = S_IDLE;
//         end
//         default: begin
//             state_next = S_IDLE;
//         end
//     endcase
// end
// // always @(*) begin
// //     state_next = state_reg;
// //     val_acc_next = val_acc_reg;
// //     cycle_count_next = cycle_count_reg;
// //     r1_next = r1_reg;

// //     case (state_reg)
// //         S_IDLE: begin
// //             if (rng_1_valid) begin
// //                 val_acc_next = 32'sd0;
// //                 cycle_count_next = 0;
// //                 r1_next = rng;
// //                 state_next = S_RUN;
// //             end
// //         end
// //         S_RUN: begin
// //             // We need 2*G cycles to get G samples
// //             if (cycle_count_reg == (2*G - 1)) begin
// //                 state_next = S_DONE;
// //             end else begin
// //                 cycle_count_next = cycle_count_reg + 1;
// //                 // On odd cycles (1, 3, 5...), we have a pair of RNGs
// //                 if (cycle_count_reg[0]) begin
// //                     val_acc_next = val_acc_reg + current_sample;
// //                 end else begin
// //                     // On even cycles (2, 4, 6...), latch the next r1
// //                     r1_next = rng;
// //                 end
// //             end
// //         end
// //         S_DONE: begin
// //             // Output is valid for one cycle, then return to idle
// //             state_next = S_IDLE;
// //         end
// //         default: begin
// //             state_next = S_IDLE;
// //         end
// //     endcase
// // end

// //---------------------------------------------------------------------
// //   Combinational Logic
// //---------------------------------------------------------------------
// reg signed [31:0] current_sample;
// wire [63:0] r2_input = rng; 

// always @(*) begin
//     // FIX: 'i' must be an 'integer' for a behavioral loop inside an always block.
//     integer i;
//     reg neg;
//     reg f;
//     reg [63:0] r1_63bit;
//     reg [63:0] r2_63bit;
//     reg [4:0] v; // Magnitude, max index is 26, so 5 bits are enough
//     reg found;

//     // Step 1: Use the first RNG value (r1_reg) to determine sign and zero-flag
//     neg = r1_reg[63];
//     r1_63bit = r1_reg & 64'h7FFFFFFFFFFFFFFF;
//     // f = 1 if the value should be zero
//     f = (r1_63bit < GAUSS_1024_12289[0]);

//     // Step 2: Use the second RNG value (r2_input) to find magnitude `v`
//     // This implements the priority search from the C code's inner loop
//     r2_63bit = r2_input & 64'h7FFFFFFFFFFFFFFF;
//     _v = 'd0;
//     found = 0;
//     // The loop is unrolled by the synthesizer into a priority mux structure
//     for (i = 1; i < GAUSS_TABLE_SIZE; i = i + 1) begin
//         if (!found && (r2_63bit < GAUSS_1024_12289[i])) begin
//             _v = 'di;
//             found = 1;
//         end
//     end

//     // The final magnitude is 0 if f=1, otherwise it's v.
//     // Then, apply the sign.
//     if (f) begin
//         current_sample = 32'sd0;
//     end else begin
//         current_sample = neg ? -v : v;
//     end
// end


// //---------------------------------------------------------------------
// //   Sequential Logic
// //---------------------------------------------------------------------
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         state_reg     <= S_IDLE;
//         val_acc_reg   <= 32'sd0;
//         cycle_count_reg <= 0;
//         r1_reg        <= 64'd0;
//     end else begin
//         state_reg     <= state_next;
//         val_acc_reg   <= val_acc_next;
//         cycle_count_reg <= cycle_count_next;
//         r1_reg        <= r1_next;
//     end
// end

// //---------------------------------------------------------------------
// //   Output Assignments
// //---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        val_valid <= 0;
        val <= 0;
    end 
    else begin
        if (cnt_reg == 1 && r1_valid)
            val_valid <= 1;
        else
            val_valid <= 0;
        if (r1_valid)
            val <= v;
        else if (val_valid)
            val <= 0;
        else
            val <= val;
    end
end

endmodule