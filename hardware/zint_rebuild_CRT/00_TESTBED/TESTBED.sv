`timescale 1ns/10ps

`include "Usertype.sv"
`include "INF.sv"
`include "PATTERN.sv"

`ifdef RTL
    `include "MAKE_FG.sv"
    `define CYCLE_TIME 1.2
`elsif GATE
    `include "MAKE_FG_SYN.v"
    `define CYCLE_TIME 1.2
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
            $fsdbDumpfile("MAKE_FG.fsdb");
            $fsdbDumpvars(0,"+mda");
        `elsif GATE
            $sdf_annotate("MAKE_FG_SYN.sdf", dut_p.MAKE_FG);
            // $fsdbDumpfile("MAKE_FG_SYN.fsdb");
            // $fsdbDumpvars(0,"+mda");
        `endif
    end

    //================================================================
    // Port Connection
    //================================================================
    PATTERN test_p (
        .clk(SystemClock), 
        .rst_n(rst_n), 
        .inf(inf.PATTERN)
    );
    `ifdef RTL
        MAKE_FG dut_p (
            .clk(SystemClock), 
            .rst_n(rst_n), 
            .inf(inf.MAKE_FG)
        );
    `elsif GATE
        MAKE_FG_svsim dut_p (
            .clk(SystemClock), 
            .rst_n(rst_n), 
            .inf(inf.MAKE_FG)
        );
    `endif  

    //================================================================
    // Clock
    //================================================================
    parameter simulation_cycle = `CYCLE_TIME;
    reg  SystemClock;

    initial begin
        SystemClock = 0;
        #10
        forever begin
            #(simulation_cycle / 2.0)
            SystemClock = ~SystemClock;
        end
    end
endmodule
