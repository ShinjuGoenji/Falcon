`timescale 1ns/10ps
`include "PATTERN.v"

`include "MODP_MONTYMUL_TOP.v"
`ifdef RTL
    `include "MODP_R2.v"
`elsif GATE
    `include "MODP_R2_SYN.v"
`endif
	  		  	
module KEYGEN (
    // Input signals
    clk,
    rst_n,
    in_valid,
    p,
    p0i,
    // Output signals
    out_valid,
    R2
);

//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------
localparam P_WIDTH = 31;

localparam MODP_MONTYMUL_BUS_WIDTH = 1;
localparam MODP_MONTYMUL_NUM = 2;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                clk;
input                rst_n;
input                in_valid;
input  [P_WIDTH-1:0] p;
input  [P_WIDTH-1:0] p0i;

output               out_valid;
output [P_WIDTH-1:0] R2;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire               out_valid_modp_montymul;
wire [P_WIDTH-1:0] d_modp_montymul;
wire               ready_modp_montymul;

wire               in_valid_modp_montymul;
wire [P_WIDTH-1:0] a_modp_montymul;
wire [P_WIDTH-1:0] b_modp_montymul;
wire [P_WIDTH-1:0] p_modp_montymul;
wire [P_WIDTH-1:0] p0i_modp_montymul;
wire               isMQ_modp_montymul;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
MODP_R2 u_MODP_R2(
  .clk(clk),
  .rst_n(rst_n),
  .in_valid(in_valid),
  .p(p),
  .p0i(p0i),
  .out_valid(out_valid),
  .R2(R2),
  .out_valid_modp_montymul(out_valid_modp_montymul),
  .d_modp_montymul(d_modp_montymul),
  .ready_modp_montymul(ready_modp_montymul),
  .in_valid_modp_montymul(in_valid_modp_montymul),
  .a_modp_montymul(a_modp_montymul),
  .b_modp_montymul(b_modp_montymul),
  .p_modp_montymul(p_modp_montymul),
  .p0i_modp_montymul(p0i_modp_montymul),
  .isMQ_modp_montymul(isMQ_modp_montymul)
);


MODP_MONTYMUL_TOP #(.BUS_WIDTH(MODP_MONTYMUL_BUS_WIDTH), .MUL_NUM(MODP_MONTYMUL_NUM)) u_MODP_MONTYMUL_TOP(
  .clk(clk),
  .rst_n(rst_n),
  .in_valid_bus(in_valid_modp_montymul),
  .a_bus(a_modp_montymul),
  .b_bus(b_modp_montymul),
  .p_bus(p_modp_montymul),
  .p0i_bus(p0i_modp_montymul),
  .isMQ_bus(isMQ_modp_montymul),
  .out_valid_bus(out_valid_modp_montymul),
  .d_bus(d_modp_montymul),
  .ready_bus(ready_modp_montymul)
);
 
endmodule
