/*
 * Montgomery multiplication modulo p. The 'p0i' value is -1/p mod 2^31.
 * It is required that p is an odd integer.
 */
module MODP_MONTYMUL #(
    parameter BUS_WIDTH = 1
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    a,
    b,
    p,
    p0i,
    isMQ,
    i_bus,
    // Output signals
    out_valid,
    d,
    o_bus
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam P_WIDTH = 31;
localparam Q_WIDTH = 16;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                clk;
input                rst_n;
input                in_valid;
input  [P_WIDTH-1:0] a;
input  [P_WIDTH-1:0] b;
input  [P_WIDTH-1:0] p;
input  [P_WIDTH-1:0] p0i;
input                isMQ;
input  [$clog2(BUS_WIDTH):0] i_bus;
    
output reg               out_valid;
output reg [P_WIDTH-1:0] d;
output reg [$clog2(BUS_WIDTH):0] o_bus;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg  [P_WIDTH-1:0]          p_reg;
reg                         isMQ_reg;
wire [P_WIDTH*2-1:0]        a_b;
reg  [P_WIDTH*2-1:0]        a_b_reg;
wire [P_WIDTH-1:0]          a_b_p0i;
reg  [P_WIDTH-1:0]          a_b_p0i_reg;
wire [P_WIDTH+Q_WIDTH-1:0]  w_q;
wire [P_WIDTH*2-1:0]        w_p;
wire [P_WIDTH*2:0]          z_w_q;
wire [P_WIDTH*2:0]          z_w_p;
wire [P_WIDTH:0]            z_w_q_shift;
wire [P_WIDTH:0]            z_w_p_shift;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
assign a_b = a * b;
assign a_b_p0i = a_b * p0i;
assign w_q = a_b_p0i_reg[Q_WIDTH-1:0] * p_reg;
assign w_p = a_b_p0i_reg[P_WIDTH-1:0] * p_reg;

assign z_w_q = a_b_reg + w_q;
assign z_w_p = a_b_reg + w_p;
assign z_w_q_shift = z_w_q[P_WIDTH*2:Q_WIDTH];
assign z_w_p_shift = z_w_p[P_WIDTH*2:P_WIDTH];

always @(*) begin
    if (isMQ_reg) begin
        if (z_w_q_shift >= p_reg)
            d = z_w_q_shift - p_reg;
        else
            d = z_w_q_shift;
    end
    else begin
        if (z_w_p_shift >= p_reg)
            d = z_w_p_shift - p_reg;
        else
            d = z_w_p_shift;
    end
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        p_reg <= 0;
        isMQ_reg <= 0;
        out_valid <= 0;
        a_b_reg <= 0;
        a_b_p0i_reg <= 0;
        o_bus <= 0;
    end
    else begin
        p_reg <= p;
        isMQ_reg <= isMQ;
        out_valid <= in_valid;
        a_b_reg <= a_b;
        a_b_p0i_reg <= a_b_p0i;
        o_bus <= i_bus;
    end
end

endmodule
