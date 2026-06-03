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
    is_ifft,
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

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                       clk;
input                       rst_n;
input                       in_valid;
input                       is_ifft;
input [FLOAT_PRECISION-1:0] x_re, x_im;
input [FLOAT_PRECISION-1:0] y_re, y_im;
input [FLOAT_PRECISION-1:0] w_re, w_im;

output reg                       out_valid;
output reg [FLOAT_PRECISION-1:0] X_re, X_im;
output reg [FLOAT_PRECISION-1:0] Y_re, Y_im;

//---------------------------------------------------------------------
//   Wire & Reg
//---------------------------------------------------------------------
// 1. MUX Outputs (Inputs to FPC submodules)
wire [FLOAT_PRECISION-1:0] mul_in_a_re, mul_in_a_im;
wire [FLOAT_PRECISION-1:0] mul_in_b_re, mul_in_b_im;
wire [FLOAT_PRECISION-1:0] addsub_in_a_re, addsub_in_a_im;
wire [FLOAT_PRECISION-1:0] addsub_in_b_re, addsub_in_b_im;

// 2. FPC Submodule Outputs
wire [FLOAT_PRECISION-1:0] mul_out_re, mul_out_im;
wire [FLOAT_PRECISION-1:0] add_out_re, add_out_im;
wire [FLOAT_PRECISION-1:0] sub_out_re, sub_out_im;
wire                       mul_valid_out;

// 3. Shared Delay Line (Depth = 2)
reg  [FLOAT_PRECISION-1:0] delay_line_re [0:MUL_LATENCY-1];
reg  [FLOAT_PRECISION-1:0] delay_line_im [0:MUL_LATENCY-1];
wire [FLOAT_PRECISION-1:0] delay_in_re, delay_in_im;
wire [FLOAT_PRECISION-1:0] delay_out_re, delay_out_im;

// 3b. Twiddle Delay Line (Depth = 2) — aligns W with (x-y) in iFFT mode
reg  [FLOAT_PRECISION-1:0] w_delay_re [0:ADDSUB_LATENCY-1];
reg  [FLOAT_PRECISION-1:0] w_delay_im [0:ADDSUB_LATENCY-1];
wire [FLOAT_PRECISION-1:0] w_dly_re, w_dly_im;

wire [FLOAT_PRECISION-1:0] X_re_comb, X_im_comb;
wire [FLOAT_PRECISION-1:0] Y_re_comb, Y_im_comb;

// 4. Control Path (Valid Signal)
reg valid_pipeline [0:TOTAL_LATENCY-1]; 
reg is_ifft_reg [0:TOTAL_LATENCY-1]; 

//---------------------------------------------------------------------
//   Combination Logic
//---------------------------------------------------------------------
// [Multiplier Input A] FFT: y, iFFT: (x-y)
assign mul_in_a_re = is_ifft ? sub_out_re : y_re;
assign mul_in_a_im = is_ifft ? sub_out_im : y_im;

// [Multiplier Input B] FFT: W (aligned with y), iFFT: delayed W (aligned with x-y)
assign mul_in_b_re = is_ifft ? w_dly_re : w_re;
assign mul_in_b_im = is_ifft ? w_dly_im : w_im;

// [Delay Line Input] FFT: x, iFFT: (x+y)
assign delay_in_re = is_ifft ? add_out_re : x_re;
assign delay_in_im = is_ifft ? add_out_im : x_im;

// [ADD/SUB Input A] FFT: Delayed x, iFFT: x
assign addsub_in_a_re = is_ifft ? x_re : delay_out_re;
assign addsub_in_a_im = is_ifft ? x_im : delay_out_im;

// [ADD/SUB Input B] FFT: (y*W), iFFT: y
assign addsub_in_b_re = is_ifft ? y_re : mul_out_re;
assign addsub_in_b_im = is_ifft ? y_im : mul_out_im;

// [Final Output X] FFT: (x + y*W), iFFT: Delayed (x+y)
assign X_re_comb = is_ifft ? delay_out_re : add_out_re;
assign X_im_comb = is_ifft ? delay_out_im : add_out_im;

// [Final Output Y] FFT: (x - y*W), iFFT: (x-y)*W
assign Y_re_comb = is_ifft ? mul_out_re   : sub_out_re;
assign Y_im_comb = is_ifft ? mul_out_im   : sub_out_im;

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
        w_delay_re[ADDSUB_LATENCY-1] <= w_re;
        w_delay_im[ADDSUB_LATENCY-1] <= w_im;
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
		is_ifft_reg[TOTAL_LATENCY-1] <= 0;
	end else begin
		valid_pipeline[TOTAL_LATENCY-1] <= in_valid;
		is_ifft_reg[TOTAL_LATENCY-1] <= is_ifft;
	end
end

genvar k;
generate
	for (k = 0; k < TOTAL_LATENCY-1; k = k + 1) begin
		always @(posedge clk or negedge rst_n) begin
			if (!rst_n) begin
				valid_pipeline[k] <= 0;
				is_ifft_reg[k] <= 0;
			end else begin
				valid_pipeline[k] <= valid_pipeline[k+1];
				is_ifft_reg[k] <= is_ifft_reg[k+1];
			end
		end
	end
endgenerate

// assign out_valid = valid_pipeline[0];
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		out_valid <= 0;
	end else begin
		out_valid <= valid_pipeline[0];
	end
end

endmodule