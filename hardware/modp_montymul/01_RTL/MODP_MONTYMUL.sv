/*
 * Montgomery multiplication modulo p. The 'p0i' value is -1/p mod 2^31.
 * It is required that p is an odd integer.
 */
 module MODP_MONTYMUL #(
    parameter MASTER_NUM = 1
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
import FALCON_Config::*;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                                 clk;
input                                 rst_n;
input                                 in_valid;
input  [P_WIDTH-1:0]                  a;
input  [P_WIDTH-1:0]                  b;
input  [P_WIDTH-1:0]                  p;
input  [P_WIDTH-1:0]                  p0i;
input                                 isMQ;
input  [$clog2(MASTER_NUM)-1:0]       i_bus;
    
output logic                          out_valid;
output logic [P_WIDTH-1:0]            d;
output logic [$clog2(MASTER_NUM)-1:0] o_bus;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
logic [P_WIDTH*2-1:0]          a_b;
logic [P_WIDTH-1:0]            a_b_p0i;
logic [P_WIDTH*2-1:0]          w;  
logic [P_WIDTH*2:0]            z_w;
logic [P_WIDTH:0]              z_w_q_shift;
logic [P_WIDTH:0]              z_w_p_shift;
logic [Q_WIDTH:0]              d_q;
logic [P_WIDTH:0]              d_p;
logic [P_WIDTH-1:0]            d_comb;
logic [P_WIDTH-1:0]            d_pipe         [0:MODP_MONTYMUL_STAGE-1];
logic                          out_valid_pipe [0:MODP_MONTYMUL_STAGE-1];
logic [$clog2(MASTER_NUM)-1:0] o_bus_pipe     [0:MODP_MONTYMUL_STAGE-1];

assign a_b = a * b;
assign a_b_p0i = a_b[P_WIDTH-1:0] * p0i;
assign w = a_b_p0i * p;
assign z_w = a_b + w;
assign z_w_q_shift = z_w[P_WIDTH*2:Q_WIDTH];
assign z_w_p_shift = z_w[P_WIDTH*2:P_WIDTH];

assign d_q = z_w_q_shift - p;
assign d_p = z_w_p_shift - p;

always_comb begin
    if (isMQ) begin
        if (d_q[Q_WIDTH])
            d_pipe[0] = z_w_q_shift;
        else
            d_pipe[0] = d_q;
    end
    else begin
        if (d_p[P_WIDTH])
            d_pipe[0] = z_w_p_shift;
        else
            d_pipe[0] = d_p;
    end
end

assign out_valid_pipe[0] = in_valid;
assign o_bus_pipe[0] = i_bus;
//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------

genvar stage;
generate
    for (stage = 1; stage < MODP_MONTYMUL_STAGE; stage++) begin
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                d_pipe[stage]         <= 0;
                out_valid_pipe[stage] <= 0;
                o_bus_pipe[stage]     <= 0;
            end
            else begin
                d_pipe[stage]         <= d_pipe[stage-1];
                out_valid_pipe[stage] <= out_valid_pipe[stage-1];
                o_bus_pipe[stage]     <= o_bus_pipe[stage-1];
            end
        end
    end
endgenerate

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        d         <= 0;
        out_valid <= 0;
        o_bus     <= 0;
    end
    else begin
        d         <= d_pipe[MODP_MONTYMUL_STAGE-1];
        out_valid <= out_valid_pipe[MODP_MONTYMUL_STAGE-1];
        o_bus     <= o_bus_pipe[MODP_MONTYMUL_STAGE-1];
    end
end

endmodule