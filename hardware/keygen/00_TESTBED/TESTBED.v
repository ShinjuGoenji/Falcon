`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "keygen.v"
`elsif GATE
    `include "keygen_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Wire Declarations
//================================================================
wire          clk;
wire          rst_n;
wire          in_valid;
wire [63:0]   rng;

wire          out_valid;
wire [31:0]   val;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("keygen.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("keygen_SYN.sdf",u_KEYGEN);
    $fsdbDumpfile("KEYGEN_SYN.fsdb");
    $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    MKGAUSS u_KEYGEN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .rng(rng),
    .out_valid(out_valid),
    .val(val)
    );
`elsif GATE
    MKGAUSS u_KEYGEN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .rng(rng),
    .out_valid(out_valid),
    .val(val)
    );
`endif
	
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .rng(rng),
    .out_valid(out_valid),
    .val(val)
    );
 
 
endmodule
