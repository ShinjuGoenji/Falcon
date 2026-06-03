`timescale 1ns/10ps

// `include "Usertype.sv"
`include "PATTERN.sv"

`ifdef RTL
    `include "FPC_TOP.sv"
`elsif GATE
    `include "FPC_TOP_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Wire Declarations
//================================================================
wire clk;
wire rst_n;
wire [63:0] a_re, a_im, b_re, b_im;
wire in_valid;
wire [63:0] d_re, d_im;
wire out_valid;

//================================================================
// Dump Waveform
//================================================================
initial begin
    `ifdef RTL
        $fsdbDumpfile("FPC_TOP.fsdb");
        $fsdbDumpvars(0,"+all");
    `elsif GATE
        $sdf_annotate("FPC_TOP_SYN.sdf", dut_p);
        // $fsdbDumpfile("FPC_TOP_SYN.fsdb");
        // $fsdbDumpvars(0,"+all");
    `endif
end

//================================================================
// Port Connection
//================================================================
PATTERN test_p (
    .clk(clk), 
    .rst_n(rst_n),
    .in_valid(in_valid),
    .a_re(a_re),
    .a_im(a_im),
    .b_re(b_re),
    .b_im(b_im),
    .out_valid(out_valid),
    .d_re(d_re),
    .d_im(d_im)
);

`ifdef RTL
    FPC_TOP dut_p (
        .clk(clk), 
        .rst_n(rst_n), 
        .in_valid(in_valid),
        .a_re(a_re),
        .a_im(a_im),
        .b_re(b_re),
        .b_im(b_im),
        .out_valid(out_valid),
        .d_re(d_re),
        .d_im(d_im)
    );
`elsif GATE
    FPC_TOP dut_p (
        .clk(clk), 
        .rst_n(rst_n), 
        .in_valid(in_valid),
        .a_re(a_re),
        .a_im(a_im),
        .b_re(b_re),
        .b_im(b_im),
        .out_valid(out_valid),
        .d_re(d_re),
        .d_im(d_im)
    );
`endif  

endmodule
