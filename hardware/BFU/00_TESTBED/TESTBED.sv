`timescale 1ns/10ps

`include "PATTERN.sv"

`ifdef RTL
    `include "BFU.sv"
`elsif GATE
    `include "BFU_SYN.v"
`endif

module TESTBED;

//================================================================
// Wire Declarations
//================================================================
wire clk;
wire rst_n;
wire in_valid;
wire out_valid;
// TODO: declare wires matching BFU ports

//================================================================
// Dump Waveform
//================================================================
initial begin
    `ifdef RTL
        $fsdbDumpfile("BFU.fsdb");
        $fsdbDumpvars(0,"+all");
    `elsif GATE
        $sdf_annotate("BFU_SYN.sdf", dut_p);
        // $fsdbDumpfile("BFU_SYN.fsdb");
        // $fsdbDumpvars(0,"+all");
    `endif
end

//================================================================
// Port Connection
//================================================================
PATTERN test_p (
    .clk      (clk),
    .rst_n    (rst_n),
    .in_valid (in_valid),
    .out_valid(out_valid)
    // TODO: add module-specific ports
);

`ifdef RTL
    BFU dut_p (
        .clk      (clk),
        .rst_n    (rst_n),
        .in_valid (in_valid),
        .out_valid(out_valid)
        // TODO: add module-specific ports
    );
`elsif GATE
    BFU dut_p (
        .clk      (clk),
        .rst_n    (rst_n),
        .in_valid (in_valid),
        .out_valid(out_valid)
        // TODO: add module-specific ports
    );
`endif

endmodule
