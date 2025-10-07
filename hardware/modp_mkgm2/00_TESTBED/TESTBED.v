`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "KEYGEN.v"
`elsif GATE
    `include "KEYGEN_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Parameter
//================================================================
localparam P_WIDTH = 31;
localparam LOGN_WIDTH = 4;
`ifdef FALCON1024
    localparam LUT_SIZE = 1024;
    localparam LUT_WIDTH = $clog2(LUT_SIZE);
`else
    localparam LUT_SIZE = 512;
    localparam LUT_WIDTH = $clog2(LUT_SIZE);
`endif

//================================================================
// Wire Declarations
//================================================================
wire                  clk;
wire                  rst_n;
wire                  in_valid;
wire [LOGN_WIDTH-1:0] logn;
wire [P_WIDTH-1:0]    g;
wire [P_WIDTH-1:0]    p;
wire [P_WIDTH-1:0]    p0i;
wire [1:0]            mode;

wire                  out_valid_gm;
wire [LUT_WIDTH-1:0]  v_gm;
wire [P_WIDTH-1:0]    gm;
wire                  out_valid_igm;
wire [LUT_WIDTH-1:0]  v_igm;
wire [P_WIDTH-1:0]    igm;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("KEYGEN.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("KEYGEN_SYN.sdf",u_KEYGEN);
    // $fsdbDumpfile("KEYGEN_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    KEYGEN u_KEYGEN(
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid),
        .logn(logn),
        .g(g),
        .p(p),
        .p0i(p0i),
        .mode(mode),
        .out_valid_gm(out_valid_gm),
        .v_gm(v_gm),
        .gm(gm),
        .out_valid_igm(out_valid_igm),
        .v_igm(v_igm),
        .igm(igm)
    );
`elsif GATE
    KEYGEN u_KEYGEN(
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid),
        .logn(logn),
        .g(g),
        .p(p),
        .p0i(p0i),
        .mode(mode),
        .out_valid_gm(out_valid_gm),
        .v_gm(v_gm),
        .gm(gm),
        .out_valid_igm(out_valid_igm),
        .v_igm(v_igm),
        .igm(igm)
    );
`endif
	
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .logn(logn),
    .g(g),
    .p(p),
    .p0i(p0i),
    .mode(mode),
    .out_valid_gm(out_valid_gm),
    .v_gm(v_gm),
    .gm(gm),
    .out_valid_igm(out_valid_igm),
    .v_igm(v_igm),
    .igm(igm)
);
 
endmodule
