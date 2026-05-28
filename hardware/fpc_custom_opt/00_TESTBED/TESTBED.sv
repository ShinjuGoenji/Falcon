`timescale 1ns/10ps

`include "PATTERN.sv"
`include "fpc_custom_opt.sv"

module TESTBED;

//================================================================
// Clock & Reset
//================================================================
logic clk;
logic rst_n;

initial begin
    clk = 0;
    forever #(`CYCLE_TIME/2) clk = ~clk;
end

initial begin
    rst_n = 1'b0;
    #(10*`CYCLE_TIME) rst_n = 1'b1;
end

//================================================================
// Waveform Dump
//================================================================
initial begin
    $fsdbDumpfile("fpc_custom_opt.fsdb");
    $fsdbDumpvars(0, TESTBED);
end

//================================================================
// Signals
//================================================================
logic [63:0] a_re, a_im, b_re, b_im;
logic [1:0] op;
logic in_valid;
logic [63:0] c_re, c_im;
logic out_valid;

//================================================================
// FPC Instance
//================================================================
FPC_TOP u_fpc (
    .clk(clk),
    .rst_n(rst_n),
    .a_re(a_re),
    .a_im(a_im),
    .b_re(b_re),
    .b_im(b_im),
    .op(op),
    .in_valid(in_valid),
    .c_re(c_re),
    .c_im(c_im),
    .out_valid(out_valid)
);

//================================================================
// PATTERN Instantiation
//================================================================
PATTERN test_p (
    .clk(clk),
    .rst_n(rst_n),
    .a_re(a_re),
    .a_im(a_im),
    .b_re(b_re),
    .b_im(b_im),
    .op(op),
    .in_valid(in_valid),
    .c_re(c_re),
    .c_im(c_im),
    .out_valid(out_valid)
);

endmodule
