
`include "DELAY_BUFFER.v"
`include "BUTTERFLY.v"
`include "MQ.v"

module RADIX2 #(
    parameter logn = 9,
    parameter U = 0
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    a_i,
    s,
    // Output signals
    out_valid,
    tw_idx,
    a_o
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam  Q_WIDTH = 14;
localparam        Q = 14'd12289;
localparam LUT_SIZE = 1024;

localparam     N = 1 << logn;
localparam     M = 1 << U;
localparam     T = N / M;
localparam    HT = T >> 1;
parameter i1_bit = (U-1 == 0) ? 1 : U;

parameter CNT_MAX = N + HT + 1;

parameter S_IDLE = 0;
parameter S_EXE = 1;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                             clk;
input                             rst_n;
input                             in_valid;
input      [Q_WIDTH-1:0]          a_i;
input      [Q_WIDTH-1:0]          s;

output reg                        out_valid;
output reg [$clog2(LUT_SIZE)-1:0] tw_idx;
output reg [Q_WIDTH-1:0]          a_o;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg mult_valid;
reg [Q_WIDTH-1:0] a_i_reg;

reg [Q_WIDTH-1:0] butterfly_X, butterfly_Y;

reg [Q_WIDTH-1:0] delay_d_i;
reg [Q_WIDTH-1:0] delay_d_o;
reg delay_ena, i_valid, o_valid, mult_in_valid;

reg delay_mux, output_mux;
reg [Q_WIDTH-1:0] mult_d_i, mult_d_i_reg;

reg state, state_reg;
reg [logn:0] cnt, cnt_reg;
reg in_valid_reg;
reg stall;

reg tw_mask, mult_en;
reg [i1_bit-1:0] i1;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
BUTTERFLY u_BUTTERFLY (
    // Input signals
    .x(delay_d_o), 
    .y(a_i_reg),
    // Output signals
    .X(butterfly_X), 
    .Y(butterfly_Y)
    );

DELAY_BUFFER #(.DEPTH(HT))
u_DELAY_BUFFER (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .ena(delay_ena), 
    .i_valid(i_valid),
    .d_i(delay_d_i), 
    // Output signals
    .o_valid(o_valid),
    .d_o(delay_d_o)
    );

MQ_MONTYMUL u_MQ_MONTYMUL (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .ena(mult_en), 
    .in_valid(mult_in_valid),
    .x(mult_d_i_reg), 
    .y(s),
    // Output signals
    .out_valid(out_valid),
    .z(a_o)
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
assign delay_d_i = delay_mux ? butterfly_Y : a_i_reg;

/*
 * Multiplexer that choose the output source.
 */
assign output_mux = (cnt_reg < HT - 1) ? 0 : (cnt_reg / HT) % 2 == 0;
assign mult_d_i = output_mux ? delay_d_o : butterfly_X;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        i_valid <= 0;
        a_i_reg <= 0;
        state_reg <= 0;
        cnt_reg <= 0;
        mult_d_i_reg <= 0;
        in_valid_reg <= 0;
        mult_in_valid <= 0;
        mult_en <= 0;
    end
    else begin
        state_reg <= state;
        cnt_reg <= cnt;
        mult_d_i_reg <= mult_d_i;
        in_valid_reg <= in_valid;
        if (stall) begin
            i_valid <= i_valid;
            a_i_reg <= a_i_reg;
        end
        else begin
            i_valid <= in_valid;
            a_i_reg <= a_i;
        end
        mult_in_valid <= o_valid;
        mult_en <= tw_mask;
    end
end

endmodule
