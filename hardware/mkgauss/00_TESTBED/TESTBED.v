`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "MKGAUSS.v"
`elsif GATE
    `include "MKGAUSS_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Wire Declarations
//================================================================
wire                clk;
wire                rst_n;
wire                ena;
wire                rng_valid;
wire        [127:0] rng;

wire                extract;
wire                val_valid;
wire signed [31:0]  val;

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
    MKGAUSS u_MKGAUSS(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .rng_valid(rng_valid),
    .rng(rng),
    .extract(extract),
    .val_valid(val_valid),
    .val(val)
    );
`elsif GATE
    MKGAUSS u_MKGAUSS(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .rng_valid(rng_valid),
    .rng(rng),
    .extract(extract),
    .val_valid(val_valid),
    .val(val)
    );
`endif
	
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .rng_valid(rng_valid),
    .rng(rng),
    .extract(extract),
    .val_valid(val_valid),
    .val(val)
    );
 
 
endmodule
