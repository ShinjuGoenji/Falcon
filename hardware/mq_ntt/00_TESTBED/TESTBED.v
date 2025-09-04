`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "MQ_NTT.v"
`elsif GATE
    `include "MQ_NTT_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Parameter
//================================================================
`ifdef FALCON512
    parameter logn = 9;
`elsif FALCON1024
    parameter logn = 10;
`else
    parameter logn = 9;
`endif

localparam Q_WIDTH = 14;

//================================================================
// Wire Declarations
//================================================================
wire               clk;
wire               rst_n;
wire               in_valid;
wire [Q_WIDTH-1:0] a_i;

wire               out_valid;
wire [Q_WIDTH-1:0] a_o;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("MQ_NTT.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("MQ_NTT_SYN.sdf",u_MQ_NTT);
    // $fsdbDumpfile("MQ_NTT_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    MQ_NTT #(.logn(logn)) u_MQ_NTT(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .a_i(a_i),
    .out_valid(out_valid),
    .a_o(a_o)
    );
`elsif GATE
    MQ_NTT #(.logn(logn)) u_MQ_NTT(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .a_i(a_i),
    .out_valid(out_valid),
    .a_o(a_o)
    );
`endif
	
PATTERN #(.logn(logn)) u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .a_i(a_i),
    .out_valid(out_valid),
    .a_o(a_o)
    );
 
endmodule
