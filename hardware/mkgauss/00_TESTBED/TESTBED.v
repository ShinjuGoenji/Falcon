`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "MKGAUSS.v"
`elsif GATE
    `include "MKGAUSS_SYN.v"
`endif
	  		  	
module TESTBED;

`ifdef FALCON512
    parameter logn = 9;
    parameter val_bit = 7;
`elsif FALCON1024
    parameter logn = 10;
    parameter val_bit = 6;
`else
    parameter logn = 9;
    parameter val_bit = 7;
`endif

//================================================================
// Wire Declarations
//================================================================
wire                      clk;
wire                      rst_n;
wire                      ena;
wire                      rng_valid;
wire        [127:0]       rng;
  
wire                      rng_extract;
wire                      val_valid;
wire signed [val_bit-1:0] val;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("MKGAUSS.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("MKGAUSS_SYN.sdf",u_MKGAUSS);
    // $fsdbDumpfile("MKGAUSS_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    MKGAUSS #(.logn(logn)) u_MKGAUSS(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .rng_valid(rng_valid),
    .rng(rng),
    .rng_extract(rng_extract),
    .val_valid(val_valid),
    .val(val)
    );
`elsif GATE
    MKGAUSS #(.logn(logn)) u_MKGAUSS(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .rng_valid(rng_valid),
    .rng(rng),
    .rng_extract(rng_extract),
    .val_valid(val_valid),
    .val(val)
    );
`endif
	
PATTERN #(.logn(logn)) u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .rng_valid(rng_valid),
    .rng(rng),
    .rng_extract(rng_extract),
    .val_valid(val_valid),
    .val(val)
    );
 
 
endmodule
