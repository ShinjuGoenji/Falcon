`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "POLY_SMALL_SQNORM.v"
`elsif GATE
    `include "POLY_SMALL_SQNORM_SYN.v"
`endif
	  		  	
module TESTBED;

`ifdef FALCON512
    parameter logn = 9;
`elsif FALCON1024
    parameter logn = 10;
`else
    parameter logn = 9;
`endif

parameter f_bit = (logn == 9) ? 7 : 6;
parameter s_bit = (logn == 9) ? 21 : 20;

//================================================================
// Wire Declarations
//================================================================
wire                    clk;
wire                    rst_n;
wire                    ena;
wire                    f_valid;
wire signed [f_bit-1:0] f;

wire                    s_valid;
wire [s_bit-1:0]        s;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("POLY_SMALL_SQNORM.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("POLY_SMALL_SQNORM_SYN.sdf",u_POLY_SMALL_SQNORM);
    // $fsdbDumpfile("POLY_SMALL_SQNORM_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    POLY_SMALL_SQNORM #(.logn(logn)) u_POLY_SMALL_SQNORM(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .f_valid(f_valid),
    .f(f),
    .s_valid(s_valid),
    .s(s)
    );
`elsif GATE
    POLY_SMALL_SQNORM #(.logn(logn)) u_POLY_SMALL_SQNORM(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .f_valid(f_valid),
    .f(f),
    .s_valid(s_valid),
    .s(s)
    );
`endif
	
PATTERN #(.logn(logn)) u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .f_valid(f_valid),
    .f(f),
    .s_valid(s_valid),
    .s(s)
    );
 
 
endmodule
