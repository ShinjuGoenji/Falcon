`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "MODP_NTT2.v"
`elsif GATE
    `include "MODP_NTT2_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Parameter
//================================================================
`ifdef FALCON512
    parameter MAX_LOGN = 9;
`elsif FALCON1024
    parameter MAX_LOGN = 10;
`else
    parameter MAX_LOGN = 9;
`endif

localparam P_WIDTH = 31;
localparam LOGN_WIDTH = 4;
localparam LUT_SIZE = 1024;

//================================================================
// Wire Declarations
//================================================================
wire                                  clk;
wire                                  rst_n;
wire                                  in_valid;
wire [P_WIDTH-1:0]                    a_i;
wire [LOGN_WIDTH-1:0]                 logn;
wire [P_WIDTH-1:0]                    p;
wire [P_WIDTH-1:0]                    p0i;
wire                                  isMQ;
wire [MAX_LOGN*P_WIDTH-1:0]           s_bus;

wire                                  out_valid;
wire [P_WIDTH-1:0]                    a_o;
wire [$clog2(LUT_SIZE)*MAX_LOGN-1:0]  tw_idx_bus;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("MODP_NTT2.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("MODP_NTT2_SYN.sdf",u_MODP_NTT2);
    // $fsdbDumpfile("MODP_NTT2_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    MODP_NTT2 #(.MAX_LOGN(MAX_LOGN)) u_MODP_NTT2(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .a_i(a_i),
    .logn(logn),
    .p(p),
    .p0i(p0i),
    .isMQ(isMQ),
    .s_bus(s_bus),
    .out_valid(out_valid),
    .a_o(a_o),
    .tw_idx_bus(tw_idx_bus)
    );
`elsif GATE
    MODP_NTT2 u_MODP_NTT2(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .a_i(a_i),
    .logn(logn),
    .p(p),
    .p0i(p0i),
    .isMQ(isMQ),
    .s_bus(s_bus),
    .out_valid(out_valid),
    .a_o(a_o),
    .tw_idx_bus(tw_idx_bus)
    );
`endif
	
PATTERN #(.MAX_LOGN(MAX_LOGN)) u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .a_i(a_i),
    .logn(logn),
    .p(p),
    .p0i(p0i),
    .isMQ(isMQ),
    .s_bus(s_bus),
    .out_valid(out_valid),
    .a_o(a_o),
    .tw_idx_bus(tw_idx_bus)
    );
 
endmodule
