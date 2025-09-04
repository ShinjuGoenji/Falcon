
`include "DELAY_BUFFER.v"
`include "BUTTERFLY.v"
`include "FPC.v"

/*
 * Implements one stage (stage 'U') of a Radix-2, Decimation-In-Time (DIT)
 * FFT. The implementation uses a Single-path Delay Feedback (SDF)
 * architecture, which is area-efficient for hardware FFTs.
 *
 * The core computation is the DIT butterfly operation:
 * X' = X + S * Y
 * Y' = X - S * Y
 * where S is the complex twiddle factor.
 *
 * In the SDF architecture, a single butterfly unit is reused. For a processing
 * block of size T = 2^U, the first HT = T/2 data points (the 'X' terms) are
 * stored in a DELAY_BUFFER. As the next HT data points (the 'Y' terms)
 * arrive, they are multiplied by the twiddle factor S. Simultaneously, the
 * 'X' terms are read from the buffer, and both are fed into the butterfly unit.
 */
module RADIX2 #(
    parameter FLOAT_PRECISION = 64,
    parameter logn = 8,
    parameter U = 1
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    di_re,
    di_im,
    s_re,
    s_im,
    // Output signals
    out_valid,
    tw_idx,
    do_re,
    do_im
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter N = 1 << logn;

parameter M = 1 << U;
parameter HT = N / M;
parameter T = HT << 1;
parameter HN = N / 2;
parameter CNT_MAX = N + HT + 1;

parameter S_IDLE = 0;
parameter S_EXE = 1;

parameter i1_bit = (U-1 == 0) ? 1 : U;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                        clk;
input                        rst_n;
input                        in_valid;
input  [FLOAT_PRECISION-1:0] di_re;
input  [FLOAT_PRECISION-1:0] di_im;
input  [FLOAT_PRECISION-1:0] s_re;
input  [FLOAT_PRECISION-1:0] s_im;

output reg                   out_valid;
output reg [logn:0]          tw_idx;
output reg [FLOAT_PRECISION-1:0] do_re;
output reg [FLOAT_PRECISION-1:0] do_im;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg mult_valid;
reg [FLOAT_PRECISION-1:0] di_re_reg, di_im_reg;

reg [FLOAT_PRECISION-1:0] butterfly_X_re, butterfly_X_im; 
reg [FLOAT_PRECISION-1:0] butterfly_Y_re, butterfly_Y_im;

reg [FLOAT_PRECISION-1:0] delay_di_re, delay_di_im;
reg [FLOAT_PRECISION-1:0] delay_do_re, delay_do_im;
reg delay_ena, i_valid, o_valid, mult_in_valid;

reg delay_mux, output_mux;
reg [FLOAT_PRECISION-1:0] mult_di_re, mult_di_im;
reg [FLOAT_PRECISION-1:0] mult_di_re_reg, mult_di_im_reg;

reg state, state_reg;
reg [logn:0] cnt, cnt_reg;
reg in_valid_reg;
reg stall;

reg tw_mask;
reg [i1_bit-1:0] i1;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
BUTTERFLY #(.FLOAT_PRECISION(FLOAT_PRECISION))
u_BUTTERFLY (
    // Input signals
    .x_re(delay_do_re), .x_im(delay_do_im), 
    .y_re(di_re_reg), .y_im(di_im_reg), 
    // Output signals
    .X_re(butterfly_X_re), .X_im(butterfly_X_im), 
    .Y_re(butterfly_Y_re), .Y_im(butterfly_Y_im)
    );

DELAY_BUFFER #(.FLOAT_PRECISION(FLOAT_PRECISION), .DEPTH(HT))
u_DELAY_BUFFER (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .ena(delay_ena), 
    .i_valid(i_valid),
    .di_re(delay_di_re), .di_im(delay_di_im), 
    // Output signals
    .o_valid(o_valid),
    .do_re(delay_do_re), .do_im(delay_do_im)
    );

FPC_MUL #(FLOAT_PRECISION) 
u_FPC_MUL (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .in_valid(mult_in_valid),
    .a_re(mult_di_re_reg), .a_im(mult_di_im_reg), 
    .b_re(s_re), .b_im(s_im), 
    // Output signals
    .mult_valid(out_valid),
    .d_re(do_re), .d_im(do_im)
    );

//---------------------------------------------------------------------
//   FSM & Datapath Logic
//---------------------------------------------------------------------
/*
 * FSM
 */
always @(*) begin
    case (state_reg)
        S_IDLE: begin
            if (in_valid)
                state = S_EXE;
            else
                state = state_reg;
        end
        S_EXE: begin
            if (cnt_reg == CNT_MAX)
                state = S_IDLE;
            else
                state = state_reg;
        end
    endcase
end

always @(*) begin
    case (state_reg)
        S_IDLE: cnt = 0;
        S_EXE: begin
            if (cnt_reg >= N-1)
                cnt = cnt_reg + 1;
            else if (in_valid)
                cnt = cnt_reg + 1;
            else
                cnt = cnt_reg;
        end
    endcase
end

/*
 * Stall control if non continuous input.
 */
assign stall = (cnt_reg < N-1) && !in_valid;
assign delay_ena = stall ? 0 : 1;

/*
 * Control twiddle factor index.
 */
assign i1 = cnt_reg / T - 1;
assign tw_idx = tw_mask ? M + i1 : 0;
always @(*) begin
    if (state == S_EXE) begin
        if (cnt_reg < T)
            tw_mask = 0;
        else if (cnt_reg % T < HT)
            tw_mask = 1;
        else
            tw_mask = 0;
    end
    else
        tw_mask = 0;
end

/*
 * Multiplexer that choose the input source to delay buffer.
 */
assign delay_mux = (cnt_reg == 0) ? 0 : ((cnt_reg) / HT) % 2;
assign delay_di_re = delay_mux ? butterfly_Y_re : di_re_reg;
assign delay_di_im = delay_mux ? butterfly_Y_im : di_im_reg;

/*
 * Multiplexer that choose the output source.
 */
assign output_mux = (cnt_reg < HT - 1) ? 0 : (cnt_reg / HT) % 2 == 0;
assign mult_di_re = output_mux ? delay_do_re : butterfly_X_re;
assign mult_di_im = output_mux ? delay_do_im : butterfly_X_im;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        i_valid <= 1'b0;
        di_re_reg <= {FLOAT_PRECISION{1'b0}};
        di_im_reg <= {FLOAT_PRECISION{1'b0}};
        state_reg <= 1'b0;
        cnt_reg <= 0;
        mult_di_re_reg <= {FLOAT_PRECISION{1'b0}};
        mult_di_im_reg <= {FLOAT_PRECISION{1'b0}};
        in_valid_reg <= 1'b0;
        mult_in_valid <= 1'b0;
    end
    else begin
        state_reg <= state;
        cnt_reg <= cnt;
        mult_di_re_reg <= mult_di_re;
        mult_di_im_reg <= mult_di_im;
        in_valid_reg <= in_valid;
        if (stall) begin
            i_valid <= i_valid;
            di_re_reg <= di_re_reg;
            di_im_reg <= di_im_reg;
        end
        else begin
            i_valid <= in_valid;
            di_re_reg <= di_re;
            di_im_reg <= di_im;
        end
        mult_in_valid <= o_valid;
    end
end

endmodule
