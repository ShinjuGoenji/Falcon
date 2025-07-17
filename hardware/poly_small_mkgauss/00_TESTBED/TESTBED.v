`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "POLY_SMALL_MKGAUSS.v"
`elsif GATE
    `include "POLY_SMALL_MKGAUSS_SYN.v"
`endif
	  		  	
module TESTBED;

`ifdef FALCON512
    parameter logn = 9;
`elsif FALCON1024
    parameter logn = 10;
`else
    parameter logn = 9;
`endif

parameter n = 1 << logn;

//================================================================
// Wire Declarations
//================================================================
wire                clk;
wire                rst_n;
wire                ena;
wire                rng_valid;
wire        [127:0] rng;

wire                rng_extract;
wire                f_valid;
wire signed [7:0]   f [0:n-1];

wire signed [(n*8-1):0] f_SYN;
genvar i;
generate
    for (i = 0; i < n; i = i + 1) begin
        assign f[n-1-i] = f_SYN[(i+1)*8-1 : i*8];
    end
endgenerate

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("POLY_SMALL_MKGAUSS.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("POLY_SMALL_MKGAUSS_SYN.sdf",u_POLY_SMALL_MKGAUSS);
    // $fsdbDumpfile("POLY_SMALL_MKGAUSS_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    POLY_SMALL_MKGAUSS #(.logn(logn)) u_POLY_SMALL_MKGAUSS (
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .rng_valid(rng_valid),
    .rng(rng),
    .rng_extract(rng_extract),
    .f_valid(f_valid),
    .f(f)
    );
`elsif GATE
    POLY_SMALL_MKGAUSS #(.logn(logn)) u_POLY_SMALL_MKGAUSS (
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .rng_valid(rng_valid),
    .rng(rng),
    .rng_extract(rng_extract),
    .f_valid(f_valid),
    .f(f_SYN)
    );
`endif
	
PATTERN #(.logn(logn)) u_PATTERN (
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .rng_valid(rng_valid),
    .rng(rng),
    .rng_extract(rng_extract),
    .f_valid(f_valid),
    .f(f)
    );
 
 
endmodule
