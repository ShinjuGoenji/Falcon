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
wire        clk;
wire        rst_n;
wire        in_valid;
wire [2:0]  bfu_mode;
wire [63:0] x_re, x_im;
wire [63:0] y_re, y_im;
wire [63:0] w_re, w_im;
wire        out_valid;
wire [63:0] X_re, X_im;
wire [63:0] Y_re, Y_im;

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
    .clk     (clk),
    .rst_n   (rst_n),
    .in_valid(in_valid),
    .bfu_mode(bfu_mode),
    .x_re(x_re), .x_im(x_im),
    .y_re(y_re), .y_im(y_im),
    .w_re(w_re), .w_im(w_im),
    .out_valid(out_valid),
    .X_re(X_re), .X_im(X_im),
    .Y_re(Y_re), .Y_im(Y_im)
);

`ifdef RTL
    BFU dut_p (
        .clk     (clk),
        .rst_n   (rst_n),
        .in_valid(in_valid),
        .bfu_mode(bfu_mode),
        .x_re(x_re), .x_im(x_im),
        .y_re(y_re), .y_im(y_im),
        .w_re(w_re), .w_im(w_im),
        .out_valid(out_valid),
        .X_re(X_re), .X_im(X_im),
        .Y_re(Y_re), .Y_im(Y_im)
    );
`elsif GATE
    BFU dut_p (
        .clk     (clk),
        .rst_n   (rst_n),
        .in_valid(in_valid),
        .bfu_mode(bfu_mode),
        .x_re(x_re), .x_im(x_im),
        .y_re(y_re), .y_im(y_im),
        .w_re(w_re), .w_im(w_im),
        .out_valid(out_valid),
        .X_re0(X_re), .X_im0(X_im),
        .Y_re0(Y_re), .Y_im0(Y_im)
    );
`endif

endmodule
