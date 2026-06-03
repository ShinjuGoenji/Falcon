`include "FPC.sv"

module BFU #(
    parameter FLOAT_PRECISION = 64,
    parameter MUL_LATENCY = 3,
    parameter ADDSUB_LATENCY = 3
) (
    // Input signals
    clk,
    rst_n,
    in_valid,
    bfu_mode,
    x_re, x_im,
    y_re, y_im,
    w_re, w_im,
    // Output signals
    out_valid,
    X_re, X_im,
    Y_re, Y_im
);

//---------------------------------------------------------------------
//   Parameters
//---------------------------------------------------------------------
localparam TOTAL_LATENCY = MUL_LATENCY + ADDSUB_LATENCY;

/*
 * bfu_mode encoding
 *      3'b000: FFT / Merge FFT   — multiply-first  (x +/- y*W)
 *      3'b001: iFFT              — add/sub-first, twiddle conjugated
 *      3'b010: Split FFT         — add/sub-first, conjugated, *0.5
 *      3'b011: Vector FMS        — add/sub-first, X = (x - y)*W  (no conj, no *0.5)
 *      3'b100: Vector ADD        — X = x + y                     (aligned via delay line)
 */
localparam MODE_FFT    = 3'b000;
localparam MODE_IFFT   = 3'b001;
localparam MODE_SPLIT  = 3'b010;
localparam MODE_FMS    = 3'b011;
localparam MODE_VECADD = 3'b100;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                       clk;
input                       rst_n;
input                       in_valid;
input [2:0]                 bfu_mode;
input [FLOAT_PRECISION-1:0] x_re, x_im;
input [FLOAT_PRECISION-1:0] y_re, y_im;
input [FLOAT_PRECISION-1:0] w_re, w_im;

output reg                       out_valid;
output reg [FLOAT_PRECISION-1:0] X_re, X_im;
output reg [FLOAT_PRECISION-1:0] Y_re, Y_im;

//---------------------------------------------------------------------
//   Wire & Reg
//---------------------------------------------------------------------
wire addsub_first;
wire [FLOAT_PRECISION-1:0] mul_in_a_re, mul_in_a_im;
wire [FLOAT_PRECISION-1:0] mul_in_b_re, mul_in_b_im;
wire [FLOAT_PRECISION-1:0] addsub_in_a_re, addsub_in_a_im;
wire [FLOAT_PRECISION-1:0] addsub_in_b_re, addsub_in_b_im;

wire [FLOAT_PRECISION-1:0] mul_out_re, mul_out_im;
wire [FLOAT_PRECISION-1:0] add_out_re, add_out_im;
wire [FLOAT_PRECISION-1:0] sub_out_re, sub_out_im;

reg  [FLOAT_PRECISION-1:0] delay_line_re [0:MUL_LATENCY-1];
reg  [FLOAT_PRECISION-1:0] delay_line_im [0:MUL_LATENCY-1];
wire [FLOAT_PRECISION-1:0] delay_in_re, delay_in_im;
wire [FLOAT_PRECISION-1:0] delay_out_re, delay_out_im;

reg  [FLOAT_PRECISION-1:0] w_delay_re [0:ADDSUB_LATENCY-1];
reg  [FLOAT_PRECISION-1:0] w_delay_im [0:ADDSUB_LATENCY-1];
wire [FLOAT_PRECISION-1:0] w_dly_re, w_dly_im;
wire [FLOAT_PRECISION-1:0] X_re_comb, X_im_comb;
wire [FLOAT_PRECISION-1:0] Y_re_comb, Y_im_comb;

// 5. Control Path: valid + mode delay lines (depth = TOTAL_LATENCY).
//    bfu_mode_reg keeps the control word synchronized with the data pipeline
//    so the output-stage muxing / scaling uses the mode that ENTERED the
//    pipeline TOTAL_LATENCY cycles ago, not the current input mode.
reg       valid_pipeline [0:TOTAL_LATENCY-1];
reg [2:0] bfu_mode_reg   [0:TOTAL_LATENCY-1];

// Delayed mode, aligned with the combinational output stage. Drives the output
// SELECT mux so each result is routed by the mode that entered the pipeline
// TOTAL_LATENCY cycles ago (the Split *0.5 itself is handled at the inputs).
wire [2:0] mode_out;
wire       addsub_first_out;
wire       is_fms_out;
assign mode_out         = bfu_mode_reg[0];
assign addsub_first_out = (mode_out != MODE_FFT);   // iFFT/Split/FMS/VecADD use add/sub-first
assign is_fms_out       = (mode_out == MODE_FMS);   // Vector FMS routes the mul result to X

// Current-input control flags (used by the registered input-side scaling/conj)
wire is_split_in;        // *0.5 scaling (Split only)
wire do_conj_in;         // twiddle conjugation (iFFT / Split only — NOT FMS/VecADD)
assign is_split_in = (bfu_mode == MODE_SPLIT);
assign do_conj_in  = (bfu_mode == MODE_IFFT) || (bfu_mode == MODE_SPLIT);

//---------------------------------------------------------------------
//   Combinational Function : multiply an IEEE-754 Float64 by 0.5
//   (decrement the 11-bit exponent; leave a zero/exp==0 operand unchanged).
//   Sign and mantissa are untouched.
//
//   For Split FFT the *0.5 is applied at the REGISTERED delay-line inputs
//   (0.5*(x+y) into the data delay line, 0.5*conj(W) into the twiddle delay
//   line) — NOT in the output cloud. Those input paths are short/registered
//   with abundant slack, so the multiplier sees raw operands and the output
//   collapses to a pure select mux. This keeps the entire FPC_MUL combinational
//   cloud free for retiming (no scaling logic on any timing-critical datapath).
//---------------------------------------------------------------------
function [FLOAT_PRECISION-1:0] half;
    input [FLOAT_PRECISION-1:0] v;
    input                      do_half;
    reg   [10:0]               e;
    begin
        e    = v[62:52];
        half = (do_half && (e != 11'd0)) ? {v[63], (e - 11'd1), v[51:0]} : v;
    end
endfunction

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------

/*
 * Mux
 */

// Datapath select: 1 => add/sub first (iFFT, Split)
//                  0 => multiply first (FFT, Merge)
assign addsub_first = (bfu_mode != MODE_FFT);

// Delay Line Input
assign delay_in_re = addsub_first ? half(add_out_re, is_split_in) : x_re;
assign delay_in_im = addsub_first ? half(add_out_im, is_split_in) : x_im;

// Multiplier Input A
assign mul_in_a_re = addsub_first ? sub_out_re : y_re;
assign mul_in_a_im = addsub_first ? sub_out_im : y_im;

// Multiplier Input B
assign mul_in_b_re = addsub_first ? w_dly_re : w_re;
assign mul_in_b_im = addsub_first ? w_dly_im : w_im;

// Add/Sub Input A
assign addsub_in_a_re = addsub_first ? x_re : delay_out_re;
assign addsub_in_a_im = addsub_first ? x_im : delay_out_im;

// Add/Sub Input B
assign addsub_in_b_re = addsub_first ? y_re : mul_out_re;
assign addsub_in_b_im = addsub_first ? y_im : mul_out_im;

// Output X
//   FMS              : (x - y)*W              = mul_out
//   iFFT/Split/VecADD: (x+y) [/0.5(x+y)]      = delay_out (delay line aligns to TOTAL_LATENCY)
//   FFT/Merge        : (x + y*W)              = add_out
// Vector ADD reuses the existing data delay line as its alignment ("dummy
// delay") shift register — add_out is delayed by MUL_LATENCY = TOTAL_LATENCY -
// ADDSUB_LATENCY, so X = delay_out lands exactly at the fixed system latency.
assign X_re_comb = is_fms_out ? mul_out_re :
                   addsub_first_out ? delay_out_re : add_out_re;
assign X_im_comb = is_fms_out ? mul_out_im :
                   addsub_first_out ? delay_out_im : add_out_im;

// Output Y (butterfly second output; don't-care for the vector modes)
assign Y_re_comb = addsub_first_out ? mul_out_re : sub_out_re;
assign Y_im_comb = addsub_first_out ? mul_out_im : sub_out_im;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
FPC_MUL #( .FLOAT_PRECISION(FLOAT_PRECISION), .PIPELINE_STAGES(MUL_LATENCY) )
u_FPC_MUL (
    .clk(clk),
	.rst_n(rst_n),
	.a_re(mul_in_a_re), .a_im(mul_in_a_im),
	.b_re(mul_in_b_re), .b_im(mul_in_b_im),
    .d_re(mul_out_re),  .d_im(mul_out_im)
);

FPC_ADD #(.FLOAT_PRECISION(FLOAT_PRECISION), .PIPELINE_STAGES(ADDSUB_LATENCY))
u_FPC_ADD (
    .clk(clk), .rst_n(rst_n),
    .a_re(addsub_in_a_re), .a_im(addsub_in_a_im),
    .b_re(addsub_in_b_re), .b_im(addsub_in_b_im),
    .d_re(add_out_re),     .d_im(add_out_im)
);

FPC_SUB #(.FLOAT_PRECISION(FLOAT_PRECISION), .PIPELINE_STAGES(ADDSUB_LATENCY))
u_FPC_SUB (
    .clk(clk), .rst_n(rst_n),
    .a_re(addsub_in_a_re), .a_im(addsub_in_a_im),
    .b_re(addsub_in_b_re), .b_im(addsub_in_b_im),
    .d_re(sub_out_re),     .d_im(sub_out_im)
);

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        delay_line_re[MUL_LATENCY-1] <= 0;
        delay_line_im[MUL_LATENCY-1] <= 0;
    end else begin
        delay_line_re[MUL_LATENCY-1] <= delay_in_re;
        delay_line_im[MUL_LATENCY-1] <= delay_in_im;
    end
end

genvar i;
generate
    for (i = 0; i < MUL_LATENCY-1; i = i + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                delay_line_re[i] <= 0;
                delay_line_im[i] <= 0;
            end else begin
                delay_line_re[i] <= delay_line_re[i+1];
                delay_line_im[i] <= delay_line_im[i+1];
            end
        end
    end
endgenerate

assign delay_out_re = delay_line_re[0];
assign delay_out_im = delay_line_im[0];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        w_delay_re[ADDSUB_LATENCY-1] <= 0;
        w_delay_im[ADDSUB_LATENCY-1] <= 0;
    end else begin
        // conj(W) only for iFFT/Split (do_conj_in); FMS multiplies by raw W.
        // *0.5 (half) only for Split (is_split_in). Both folded in at this
        // registered input so the multiplier sees a clean operand.
        w_delay_re[ADDSUB_LATENCY-1] <= half(w_re, is_split_in);
        w_delay_im[ADDSUB_LATENCY-1] <= half(do_conj_in ? {~w_im[FLOAT_PRECISION-1], w_im[FLOAT_PRECISION-2:0]}
                                                        : w_im, is_split_in);
    end
end

genvar j;
generate
    for (j = 0; j < ADDSUB_LATENCY-1; j = j + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                w_delay_re[j] <= 0;
                w_delay_im[j] <= 0;
            end else begin
                w_delay_re[j] <= w_delay_re[j+1];
                w_delay_im[j] <= w_delay_im[j+1];
            end
        end
    end
endgenerate

assign w_dly_re = w_delay_re[0];
assign w_dly_im = w_delay_im[0];

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		valid_pipeline[TOTAL_LATENCY-1] <= 0;
	end else begin
		valid_pipeline[TOTAL_LATENCY-1] <= in_valid;
	end
end

genvar k;
generate
	for (k = 0; k < TOTAL_LATENCY-1; k = k + 1) begin
		always @(posedge clk or negedge rst_n) begin
			if (!rst_n) begin
				valid_pipeline[k] <= 0;
			end else begin
				valid_pipeline[k] <= valid_pipeline[k+1];
			end
		end
	end
endgenerate

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		out_valid <= 0;
	end else begin
		out_valid <= valid_pipeline[0];
	end
end

//---------------------------------------------------------------------
//   Sequential Logic — mode pipeline (synchronizes control with data)
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		bfu_mode_reg[TOTAL_LATENCY-1] <= MODE_FFT;
	end else begin
		bfu_mode_reg[TOTAL_LATENCY-1] <= bfu_mode;
	end
end

genvar m;
generate
	for (m = 0; m < TOTAL_LATENCY-1; m = m + 1) begin
		always @(posedge clk or negedge rst_n) begin
			if (!rst_n) begin
				bfu_mode_reg[m] <= MODE_FFT;
			end else begin
				bfu_mode_reg[m] <= bfu_mode_reg[m+1];
			end
		end
	end
endgenerate

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		X_re <= 0;
		X_im <= 0;
		Y_re <= 0;
		Y_im <= 0;
	end else begin
		X_re <= X_re_comb;
		X_im <= X_im_comb;
		Y_re <= Y_re_comb;
		Y_im <= Y_im_comb;
	end
end
endmodule
