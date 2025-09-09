`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "MQ_DIV_12289.v"
`elsif GATE
    `include "MQ_DIV_12289_SYN.v"
`endif
	  		  	
module TESTBED;

localparam Q_WIDTH = 14;

//================================================================
// Wire Declarations
//================================================================
wire               clk;
wire               rst_n;
wire               in_valid;
wire [Q_WIDTH-1:0] x_i, y_i;

wire               out_valid;
wire [Q_WIDTH-1:0] z_o;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("MQ_DIV_12289.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("MQ_DIV_12289_SYN.sdf",u_MQ_DIV_12289);
    // $fsdbDumpfile("MQ_DIV_12289_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    MQ_DIV_12289 u_MQ_DIV_12289 (
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .x_i(x_i),
    .y_i(y_i),
    .out_valid(out_valid),
    .z_o(z_o)
    );
`elsif GATE
    MQ_DIV_12289 u_MQ_DIV_12289 (
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .x_i(x_i),
    .y_i(y_i),
    .out_valid(out_valid),
    .z_o(z_o)
    );
`endif
	
PATTERN u_PATTERN (
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .x_i(x_i),
    .y_i(y_i),
    .out_valid(out_valid),
    .z_o(z_o)
    );
 
 
endmodule
