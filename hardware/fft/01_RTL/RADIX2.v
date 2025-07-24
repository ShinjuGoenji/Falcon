
`include "DELAY_BUFFER.v"
`include "BUTTERFLY.v"
`include "FPC.v"

/*
 * Radix-2 Single-Path Delay Feedback (SDF) Unit for N-Point FFT
 */
module RADIX2 #(
    parameter   FLOAT_PRECISION = 64,
    parameter   logn = 8,
    parameter   U = 1   // stage
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
parameter CNT_MAX = N + HN;

parameter S_IDLE = 0;
parameter S_EXE = 1;

parameter i1_bit = (U-1 == 0) ? 1 : U-1;

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
reg [FLOAT_PRECISION-1:0] mult_d_re, mult_d_im, mult_d_re_reg, mult_d_im_reg;

reg [FLOAT_PRECISION-1:0] butterfly_X_re, butterfly_X_im; 
reg [FLOAT_PRECISION-1:0] butterfly_Y_re, butterfly_Y_im;

reg [FLOAT_PRECISION-1:0] delay_di_re, delay_di_im;
reg [FLOAT_PRECISION-1:0] delay_do_re, delay_do_im;
reg delay_ena, i_valid, o_valid;

reg delay_mux, output_mux;
reg [FLOAT_PRECISION-1:0] _do_re, _do_im;

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
    .y_re(mult_d_re_reg), .y_im(mult_d_im_reg), 
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
    .in_valid(in_valid),
    .a_re(di_re), .a_im(di_im), 
    .b_re(s_re), .b_im(s_im), 
    // Output signals
    .mult_valid(mult_valid),
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
            if (mult_valid)
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
            else if (mult_valid)
                cnt = cnt_reg + 1;
            else
                cnt = cnt_reg;
        end
    endcase
end

/*
 * Stall control if non continuous input.
 */
assign stall = (cnt_reg < N-1) && !mult_valid;
assign delay_ena = stall ? 0 : 1;

/*
 * Control twiddle factor index.
 */
assign i1 = (cnt + 1) / T;
assign tw_idx = tw_mask ? M + i1 : 0;
always @(*) begin
    if (in_valid && cnt == 0 && T == 2)
        if (state == S_EXE)
            tw_mask = 0;   
        else 
            tw_mask = 1;   
    else if (state == S_EXE) begin
        if (((cnt + 2) % T) == 0)
            if (!in_valid)
                tw_mask = 1;
            else 
                tw_mask = 0;
        else if (((cnt + 2) % T) < HT)
            tw_mask = 0;
        else if (((cnt + 2) % T) == HT)
            if (in_valid)
                tw_mask = 1;
            else 
                tw_mask = 0;
        else 
            tw_mask = 1;
        end
    else 
        tw_mask = 0;
end

/*
 * Multiplexer that choose the input source to delay buffer.
 */

/*
 * Multiplexer that choose the input source to delay buffer.
 */
assign delay_mux = (cnt_reg == 0) ? 0 : ((cnt_reg) / HT) % 2;
assign delay_di_re = delay_mux ? butterfly_Y_re : mult_d_re_reg;
assign delay_di_im = delay_mux ? butterfly_Y_im : mult_d_im_reg;

/*
 * Multiplexer that choose the output source.
 */
assign output_mux = (cnt_reg < HT) ? 0 : (cnt_reg / HT) % 2 == 0;
assign _do_re = output_mux ? delay_do_re : butterfly_X_re;
assign _do_im = output_mux ? delay_do_im : butterfly_X_im;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        i_valid <= 0;
        mult_d_re_reg <= 0;
        mult_d_im_reg <= 0;
        state_reg <= 0;
        cnt_reg <= 0;
        out_valid <= 0;
        do_re <= 0;
        do_im <= 0;
        in_valid_reg <= 0;
    end
    else begin
        state_reg <= state;
        cnt_reg <= cnt;
        do_re <= _do_re;
        do_im <= _do_im;
        in_valid_reg <= mult_valid;
        if (stall) begin
            i_valid <= i_valid;
            mult_d_re_reg <= mult_d_re_reg;
            mult_d_im_reg <= mult_d_im_reg;
        end
        else begin
            i_valid <= mult_valid;
            mult_d_re_reg <= mult_d_re;
            mult_d_im_reg <= mult_d_im;
        end
        if (cnt_reg >= N)
            out_valid <= o_valid;
        else if (in_valid_reg)
            out_valid <= o_valid;
        else
            out_valid <= 0;
    end
end

endmodule
