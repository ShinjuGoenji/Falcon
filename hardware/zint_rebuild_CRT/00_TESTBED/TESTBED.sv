`timescale 1ns/10ps

`include "Usertype.sv"
`include "INF.sv"
`include "PATTERN.sv"

`ifdef RTL
    `include "MAKE_FG.sv"
`elsif GATE
    `include "MAKE_FG_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Wire Declarations
//================================================================
logic clk;
logic rst_n;
TOP_INF inf();

//================================================================
// Dump Waveform
//================================================================
initial begin
    `ifdef RTL
        // $fsdbDumpfile("MAKE_FG.fsdb");
        // $fsdbDumpvars(0,"+all");
    `elsif GATE
        $sdf_annotate("MAKE_FG_SYN.sdf", dut_p);
        // $fsdbDumpfile("MAKE_FG_SYN.fsdb");
        // $fsdbDumpvars(0,"+all");
    `endif
end

//================================================================
// Port Connection
//================================================================
PATTERN test_p (
    .clk(clk), 
    .rst_n(rst_n), 
    .inf(inf.PATTERN)
);
`ifdef RTL
    MAKE_FG dut_p (
        .clk(clk), 
        .rst_n(rst_n), 
        .inf(inf.MAKE_FG)
    );
`elsif GATE
    MAKE_FG dut_p (
        .clk(clk), 
        .rst_n(rst_n), 
        .inf_in_valid(inf.in_valid), 
        .inf_mode(inf.mode), 
        .inf_in_data(inf.in_data), 
        .inf_len_valid(inf.len_valid), 
        .inf_logn(inf.logn), 
        .inf_xlen(inf.xlen),
        .inf_out_valid(inf.out_valid), 
        .inf_out_data(inf.out_data)
    );
`endif  

endmodule
