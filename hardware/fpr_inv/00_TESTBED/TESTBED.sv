`timescale 1ns/10ps

`include "PATTERN.sv"

`ifdef RTL
    `include "fpr_inv.sv"
`elsif GATE
    `include "fpr_inv_SYN.v"
`endif

module TESTBED;

//================================================================
// Wire Declarations
//================================================================
wire        clk;
wire        rst_n;
wire        in_valid;
wire [63:0] b;
wire        out_valid;
wire [63:0] z;

//================================================================
// Dump Waveform
//================================================================
initial begin
    `ifdef RTL
        $fsdbDumpfile("fpr_inv.fsdb");
        $fsdbDumpvars(0,"+all");
    `elsif GATE
        $sdf_annotate("fpr_inv_SYN.sdf", dut_p);
        // $fsdbDumpfile("fpr_inv_SYN.fsdb");
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
    .b        (b),
    .out_valid(out_valid),
    .z        (z)
);

`ifdef RTL
    fpr_inv dut_p (
        .clk      (clk),
        .rst_n    (rst_n),
        .in_valid (in_valid),
        .b        (b),
        .out_valid(out_valid),
        .z        (z)
    );
`elsif GATE
    fpr_inv dut_p (
        .clk      (clk),
        .rst_n    (rst_n),
        .in_valid (in_valid),
        .b        (b),
        .out_valid(out_valid),
        .z        (z)
    );
`endif

endmodule
