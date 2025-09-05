
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
localparam i_bit = (U == 0) ? 1 : U;

localparam CNT_MAX = N + N / 2;

localparam S_IDLE = 0;
localparam  S_EXE = 1;

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
reg [Q_WIDTH-1:0] mult_d, mult_d_reg;

reg [Q_WIDTH-1:0] butterfly_X, butterfly_Y;

reg [Q_WIDTH-1:0] delay_d_i;
reg [Q_WIDTH-1:0] delay_d_o;
reg delay_ena, i_valid, o_valid;

reg delay_mux, output_mux;
reg [Q_WIDTH-1:0] _a_o;

reg state, state_reg;
reg [logn:0] cnt, cnt_reg;
reg in_valid_reg;
reg stall;

reg tw_mask, mult_en;
reg [i_bit-1:0] i;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
BUTTERFLY u_BUTTERFLY (
    // Input signals
    .x(delay_d_o), 
    .y(mult_d_reg),
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

MQ_MONTYMUL u_mq_montymul (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .ena(mult_en), 
    .in_valid(in_valid),
    .x(a_i), 
    .y(s), 
    // Output signals
    .out_valid(mult_valid),
    .z(mult_d)
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
assign i = (cnt + 1) / T;
assign tw_idx = tw_mask ? M + i : 0;
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
assign delay_mux = (cnt_reg == 0) ? 0 : ((cnt_reg) / HT) % 2;
assign delay_d_i = delay_mux ? butterfly_Y : mult_d_reg;

/*
 * Multiplexer that choose the output source.
 */
assign output_mux = (cnt_reg < HT) ? 0 : (cnt_reg / HT) % 2 == 0;
assign _a_o = output_mux ? delay_d_o : butterfly_X;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        i_valid <= 0;
        mult_d_reg <= 0;
        state_reg <= 0;
        cnt_reg <= 0;
        out_valid <= 0;
        a_o <= 0;
        in_valid_reg <= 0;
        mult_en <= 0;
    end
    else begin
        state_reg <= state;
        cnt_reg <= cnt;
        a_o <= _a_o;
        in_valid_reg <= mult_valid;
        if (stall) begin
            i_valid <= i_valid;
            mult_d_reg <= mult_d_reg;
        end
        else begin
            i_valid <= mult_valid;
            mult_d_reg <= mult_d;
        end
        if (cnt_reg >= N)
            out_valid <= o_valid;
        else if (in_valid_reg)
            out_valid <= o_valid;
        else
            out_valid <= 0;
        mult_en <= tw_mask;
    end
end

endmodule
