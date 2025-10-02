`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "MODP_R2.v"
`elsif GATE
    `include "MODP_R2_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Parameter
//================================================================
localparam P_WIDTH = 31;

localparam MODP_MONTYMUL_BUS_WIDTH = 1;
localparam MODP_MONTYMUL_NUM = 2;

//================================================================
// Wire Declarations
//================================================================
wire               clk;
wire               rst_n;
wire               in_valid;
wire [P_WIDTH-1:0] p;
wire [P_WIDTH-1:0] p0i;

wire               out_valid;
wire [P_WIDTH-1:0] R2;

wire               out_valid_modp_montymul;
wire [P_WIDTH-1:0] d_modp_montymul;
wire               ready_modp_montymul;

wire               in_valid_modp_montymul;
wire [P_WIDTH-1:0] a_modp_montymul;
wire [P_WIDTH-1:0] b_modp_montymul;
wire [P_WIDTH-1:0] p_modp_montymul;
wire [P_WIDTH-1:0] p0i_modp_montymul;
wire               isMQ_modp_montymul;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("MODP_R2.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("MODP_R2_SYN.sdf",u_MODP_R2);
    // $fsdbDumpfile("MODP_R2_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
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
`elsif GATE
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
`endif


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
	
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .p(p),
    .p0i(p0i),
    .out_valid(out_valid),
    .R2(R2)
    );
 
endmodule
