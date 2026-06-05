/*
 * fpr_inv — IEEE-754 Float64 reciprocal: z = 1.0 / b
 *
 * Thin wrapper around DW_lp_piped_fp_recip (purpose-built reciprocal; smaller
 * and friendlier to synthesis than the bit-serial DW_lp_piped_fp_div).
 *   - The value to invert feeds the single data input .a; z = 1/a.
 *   - launch tied HIGH (1'b1): with no_pm=1 the launch pulse would gate the
 *     per-stage register enables and stall the data, so it is held high; data
 *     flows continuously. Validity is tracked by a separate shift register.
 *   - optional pipe-management outputs left unconnected (harmless width warning).
 *   - divisor registered at input, quotient registered at output.
 * Latency (in_valid -> out_valid) = LATENCY cycles (verified by timing probe).
 * C reference: software/fpr.h  fpr_inv(x) = 1.0 / x
 */
module fpr_inv #(
    parameter FLOAT_PRECISION = 64
) (
    clk,
    rst_n,
    in_valid,
    b,
    out_valid,
    z
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam sig_width       = 52;
localparam exp_width       = 11;
localparam ieee_compliance = 0;
localparam faithful_round  = 0;
localparam op_iso_mode     = 1;
localparam id_width        = 1;
localparam in_reg          = 0;
localparam stages          = 6;
localparam out_reg         = 0;
localparam no_pm           = 1;
localparam rst_mode        = 0;

// in_valid -> out_valid latency: input reg (1) + recip data latency (stages-1)
// + output reg (1) = stages + 1.  VALID_DEPTH sizes the valid shift register.
localparam VALID_DEPTH     = stages;   // valid_reg[0..VALID_DEPTH-1]

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                             clk;
input                             rst_n;
input                             in_valid;
input       [FLOAT_PRECISION-1:0] b;

output reg                        out_valid;
output reg  [FLOAT_PRECISION-1:0] z;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [2:0]                 rnd = 3'b000;
wire [FLOAT_PRECISION-1:0] next_z;

reg  [FLOAT_PRECISION-1:0] b_reg;
reg  valid_reg [0:VALID_DEPTH-1];

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
DW_lp_piped_fp_recip #(sig_width, exp_width, ieee_compliance, faithful_round, op_iso_mode, id_width, in_reg, stages, out_reg, no_pm, rst_mode)
u_FPR_RECIP (
    .clk(clk), .rst_n(rst_n),
    .a(b_reg), .rnd(rnd), .z(next_z),
    .launch(1'b1), .launch_id(1'b0), .accept_n(1'b0)
    );

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        b_reg        <= 0;
        valid_reg[0] <= 0;
        z            <= 0;
        out_valid    <= 0;
    end
    else begin
        b_reg        <= b;
        valid_reg[0] <= in_valid;
        z            <= next_z;
        out_valid    <= valid_reg[VALID_DEPTH-1];
    end
end

genvar valid_idx;
generate
    for (valid_idx = 1; valid_idx <= VALID_DEPTH-1; valid_idx = valid_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                valid_reg[valid_idx] <= 0;
            end
            else begin
                valid_reg[valid_idx] <= valid_reg[valid_idx-1];
            end
        end
    end
endgenerate

endmodule
