
`include "DELAY_BUFFER.v"
`include "BUTTERFLY.v"
`include "FPC.v"


/*
 * Radix-2 Single-Path Delay Feedback (SDF) Unit for N-Point FFT
 */
module RADIX2 #(
    parameter   FLOAT_PRECISION = 64,
    parameter   logn = 8,
    parameter M = 0
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
parameter BUFFER_DEPTH = M / 2;
parameter N = 1 << logn;
parameter HN = N / 2;
parameter CNT_MAX = N + HN;

parameter S_IDLE = 0;
parameter S_EXE = 1;

parameter TW_IDX_0 = 2;
parameter TWIDDLE_0 = 126;

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
output reg [8:0]             tw_idx;
output [FLOAT_PRECISION-1:0] do_re;
output [FLOAT_PRECISION-1:0] do_im;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg [FLOAT_PRECISION-1:0] mult_d_re, mult_d_im, mult_d_re_reg, mult_d_im_reg;

reg [FLOAT_PRECISION-1:0] butterfly_X_re, butterfly_X_im, butterfly_X_re_reg, butterfly_X_im_reg, 
                          butterfly_Y_re, butterfly_Y_im, butterfly_Y_re_reg, butterfly_Y_im_reg;
reg butterfly_X_valid, butterfly_Y_valid;

reg [FLOAT_PRECISION-1:0] delay_di_re, delay_di_im;
reg [FLOAT_PRECISION-1:0] delay_do_re, delay_do_im;
reg delay_ena, i_valid, o_valid;

reg delay_mux, output_mux;

reg state, state_reg;
reg [logn:0] cnt, cnt_reg;
reg in_valid_reg, _out_valid;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
BUTTERFLY #(.FLOAT_PRECISION(FLOAT_PRECISION))
u_BUTTERFLY (
    // Input signals
    .x_re(delay_do_re), .x_im(delay_do_im), 
    .y_re(mult_d_re_reg), .y_im(mult_d_im_reg), 
    // Output signals
    .X_re(butterfly_X_re), .X_im(butterfly_X_im), 
    .Y_re(butterfly_Y_re), .Y_im(butterfly_Y_im)
    );

DELAY_BUFFER #(.FLOAT_PRECISION(FLOAT_PRECISION), .DEPTH(BUFFER_DEPTH))
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
    .a_re(di_re), .a_im(di_im), 
    .b_re(s_re), .b_im(s_im), 
    // Output signals
    .d_re(mult_d_re), .d_im(mult_d_im)
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
            if (cnt_reg == CNT_MAX - 1)
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

assign delay_ena = (cnt_reg < N-1 && !in_valid) ? 0 : 1;

always @(*) begin
    if (cnt_reg < TWIDDLE_0) begin
        if 
    end
end
assign tw_idx = (in_valid && cnt_reg < TWIDDLE_0) ? 0 : TW_IDX_0;

/*
 * Multiplexer that choose the input source to delay buffer.
 */
assign delay_mux = (cnt_reg < HN) ? 0 : 1;
assign i_valid = delay_mux ? butterfly_Y_valid : in_valid_reg;
assign delay_di_re = delay_mux ? butterfly_Y_re_reg : mult_d_re_reg;
assign delay_di_im = delay_mux ? butterfly_Y_im_reg : mult_d_im_reg;

/*
 * Multiplexer that choose the output source.
 */
assign output_mux = (state_reg == S_EXE && cnt_reg <= N) ? 0 : 1;
assign out_valid = output_mux ? o_valid : butterfly_X_valid;
assign do_re = output_mux ? delay_do_re : butterfly_X_re_reg;
assign do_im = output_mux ? delay_do_im : butterfly_X_im_reg;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        in_valid_reg <= 0;
        mult_d_re_reg <= 0;
        mult_d_im_reg <= 0;
        butterfly_X_re_reg <= 0;
        butterfly_X_im_reg <= 0;
        butterfly_Y_re_reg <= 0;
        butterfly_Y_im_reg <= 0;
        butterfly_X_valid <= 0;
        butterfly_Y_valid <= 0;
        state_reg <= 0;
        cnt_reg <= 0;
        // out_valid <= 0;
    end
    else begin
        state_reg <= state;
        cnt_reg <= cnt;
        // out_valid <= _out_valid;
        if (cnt_reg < N-1 && !in_valid) begin
            in_valid_reg <= in_valid_reg;
            mult_d_re_reg <= mult_d_re_reg;
            mult_d_im_reg <= mult_d_im_reg;
            butterfly_X_re_reg <= butterfly_X_re_reg;
            butterfly_X_im_reg <= butterfly_X_im_reg;
            butterfly_Y_re_reg <= butterfly_Y_re_reg;
            butterfly_Y_im_reg <= butterfly_Y_im_reg;
            butterfly_X_valid <= butterfly_X_valid;
            butterfly_Y_valid <= butterfly_Y_valid;
        end
        else begin
            in_valid_reg <= in_valid;
            mult_d_re_reg <= mult_d_re;
            mult_d_im_reg <= mult_d_im;
            butterfly_X_re_reg <= butterfly_X_re;
            butterfly_X_im_reg <= butterfly_X_im;
            butterfly_Y_re_reg <= butterfly_Y_re;
            butterfly_Y_im_reg <= butterfly_Y_im;
            butterfly_X_valid <= o_valid;
            butterfly_Y_valid <= in_valid_reg;
        end
    end
end

endmodule
