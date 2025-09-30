`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "MODP_MONTYMUL_TOP.v"
`elsif GATE
    `include "MODP_MONTYMUL_TOP_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Parameter
//================================================================
localparam P_WIDTH = 31;

localparam BUS_WIDTH = 10;
localparam MUL_NUM = 2;

//================================================================
// Wire Declarations
//================================================================
reg                         clk;
reg                         rst_n;
reg [BUS_WIDTH-1:0]         in_valid_bus;
reg [P_WIDTH*BUS_WIDTH-1:0] a_bus;
reg [P_WIDTH*BUS_WIDTH-1:0] b_bus;
reg [P_WIDTH*BUS_WIDTH-1:0] p_bus;
reg [P_WIDTH*BUS_WIDTH-1:0] p0i_bus;
reg [BUS_WIDTH-1:0]         isMQ_bus;

reg [BUS_WIDTH-1:0]         out_valid_bus;
reg [P_WIDTH*BUS_WIDTH-1:0] d_bus;
reg [BUS_WIDTH-1:0]         ready_bus;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("MODP_MONTYMUL_TOP.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("MODP_MONTYMUL_TOP_SYN.sdf", u_MODP_MONTYMUL_TOP);
    // $fsdbDumpfile("MODP_MONTYMUL_TOP_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    MODP_MONTYMUL_TOP #(.BUS_WIDTH(BUS_WIDTH), .MUL_NUM(MUL_NUM)) u_MODP_MONTYMUL_TOP(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid_bus(in_valid_bus),
    .a_bus(a_bus),
    .b_bus(b_bus),
    .p_bus(p_bus),
    .p0i_bus(p0i_bus),
    .isMQ_bus(isMQ_bus),
    .out_valid_bus(out_valid_bus),
    .d_bus(d_bus),
    .ready_bus(ready_bus)
    );
`elsif GATE
    MODP_MONTYMUL_TOP u_MODP_MONTYMUL_TOP(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid_bus(in_valid_bus),
    .a_bus(a_bus),
    .b_bus(b_bus),
    .p_bus(p_bus),
    .p0i_bus(p0i_bus),
    .isMQ_bus(isMQ_bus),
    .out_valid_bus(out_valid_bus),
    .d_bus(d_bus),
    .ready_bus(ready_bus)
    );
`endif
	
PATTERN #(.BUS_WIDTH(BUS_WIDTH), .MUL_NUM(MUL_NUM)) u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid_bus(in_valid_bus),
    .a_bus(a_bus),
    .b_bus(b_bus),
    .p_bus(p_bus),
    .p0i_bus(p0i_bus),
    .isMQ_bus(isMQ_bus),
    .out_valid_bus(out_valid_bus),
    .d_bus(d_bus),
    .ready_bus(ready_bus)
    );
 
endmodule
