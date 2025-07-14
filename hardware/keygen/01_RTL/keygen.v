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
    in_valid,
    rng,
    // Output signals
    out_valid,
    val
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input               clk;
input               rst_n;
input               in_valid;
input        [63:0] rng;

output reg          out_valid;
output reg [31:0]   val;

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
localparam S_RUN  = 2'b01;
localparam S_DONE = 2'b10;

reg [1:0] state_reg, state_next;
reg [CYCLE_COUNT_WIDTH-1:0] cycle_count_reg, cycle_count_next;
reg signed [31:0] val_acc_reg, val_acc_next;
reg [63:0] r1_reg, r1_next;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
reg signed [31:0] current_sample;
wire [63:0] r2_input = rng; 

always @(*) begin
    // FIX: 'i' must be an 'integer' for a behavioral loop inside an always block.
    integer i;
    reg neg;
    reg f;
    reg [63:0] r1_63bit;
    reg [63:0] r2_63bit;
    reg [4:0] v; // Magnitude, max index is 26, so 5 bits are enough
    reg found;

    // Step 1: Use the first RNG value (r1_reg) to determine sign and zero-flag
    neg = r1_reg[63];
    r1_63bit = r1_reg & 64'h7FFFFFFFFFFFFFFF;
    // f = 1 if the value should be zero
    f = (r1_63bit < GAUSS_1024_12289[0]);

    // Step 2: Use the second RNG value (r2_input) to find magnitude `v`
    // This implements the priority search from the C code's inner loop
    r2_63bit = r2_input & 64'h7FFFFFFFFFFFFFFF;
    v = 0;
    found = 0;
    // The loop is unrolled by the synthesizer into a priority mux structure
    for (i = 1; i < GAUSS_TABLE_SIZE; i = i + 1) begin
        if (!found && (r2_63bit < GAUSS_1024_12289[i])) begin
            v = i;
            found = 1;
        end
    end

    // The final magnitude is 0 if f=1, otherwise it's v.
    // Then, apply the sign.
    if (f) begin
        current_sample = 32'sd0;
    end else begin
        current_sample = neg ? -v : v;
    end
end

//---------------------------------------------------------------------
//   FSM & Datapath Logic
//---------------------------------------------------------------------
always @(*) begin
    state_next = state_reg;
    val_acc_next = val_acc_reg;
    cycle_count_next = cycle_count_reg;
    r1_next = r1_reg;

    case (state_reg)
        S_IDLE: begin
            if (in_valid) begin
                // Start of operation
                val_acc_next = 32'sd0;
                cycle_count_next = 0;
                r1_next = rng;
                state_next = S_RUN;
            end
        end
        S_RUN: begin
            // We need 2*G cycles to get G samples
            if (cycle_count_reg == (2*G - 1)) begin
                state_next = S_DONE;
            end else begin
                cycle_count_next = cycle_count_reg + 1;
                // On odd cycles (1, 3, 5...), we have a pair of RNGs
                if (cycle_count_reg[0]) begin
                    val_acc_next = val_acc_reg + current_sample;
                end else begin
                    // On even cycles (2, 4, 6...), latch the next r1
                    r1_next = rng;
                end
            end
        end
        S_DONE: begin
            // Output is valid for one cycle, then return to idle
            state_next = S_IDLE;
        end
        default: begin
            state_next = S_IDLE;
        end
    endcase
end


//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state_reg     <= S_IDLE;
        val_acc_reg   <= 32'sd0;
        cycle_count_reg <= 0;
        r1_reg        <= 64'd0;
    end else begin
        state_reg     <= state_next;
        val_acc_reg   <= val_acc_next;
        cycle_count_reg <= cycle_count_next;
        r1_reg        <= r1_next;
    end
end

//---------------------------------------------------------------------
//   Output Assignments
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        out_valid <= 1'b0;
        val <= 32'sd0;
    end else begin
        // val is the final accumulated value
        val <= val_acc_reg;
        // out_valid is a single-cycle pulse
        if (state_next == S_DONE) begin
            out_valid <= 1'b1;
        end else begin
            out_valid <= 1'b0;
        end
    end
end

endmodule