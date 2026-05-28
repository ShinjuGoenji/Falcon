`timescale 1ns/10ps

`include "Usertype.sv"
`include "PATTERN.sv"
`ifdef RTL
    `include "MODP_MONTYMUL.sv"
`elsif GATE
    `include "MODP_MONTYMUL_SYN.v"
`endif
	  		  	
module TESTBED;

//================================================================
// Parameter
//================================================================
import FALCON_Config::*;
localparam MASTER_NUM = 1;

//================================================================
// Wire Declarations
//================================================================
logic                          clk;
logic                          rst_n;
logic                          in_valid;
logic [P_WIDTH-1:0]            a;
logic [P_WIDTH-1:0]            b;
logic [P_WIDTH-1:0]            p;
logic [P_WIDTH-1:0]            p0i;
logic                          isMQ;

logic                          out_valid;
logic [P_WIDTH-1:0]            d;
logic [$clog2(MASTER_NUM)-1:0] o_bus;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("MODP_MONTYMUL.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("MODP_MONTYMUL_SYN.sdf", u_MODP_MONTYMUL);
    // $fsdbDumpfile("MODP_MONTYMUL_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    MODP_MONTYMUL #(.MASTER_NUM(MASTER_NUM)) u_MODP_MONTYMUL(
      .clk(clk),
      .rst_n(rst_n),
      .in_valid(in_valid),
      .a(a),
      .b(b),
      .p(p),
      .p0i(p0i),
      .isMQ(isMQ),
      .i_bus(i_bus),
      .out_valid(out_valid),
      .d(d),
      .o_bus(o_bus)
    );
`elsif GATE
    MODP_MONTYMUL u_MODP_MONTYMUL(
      .clk(clk),
      .rst_n(rst_n),
      .in_valid(in_valid),
      .a(a),
      .b(b),
      .p(p),
      .p0i(p0i),
      .isMQ(isMQ),
      .i_bus(i_bus),
      .out_valid(out_valid),
      .d(d),
      .o_bus(o_bus)
    );
`endif
	
PATTERN #(.MASTER_NUM(MASTER_NUM)) u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .a(a),
    .b(b),
    .p(p),
    .p0i(p0i),
    .isMQ(isMQ),
    .i_bus(i_bus),
    .out_valid(out_valid),
    .d(d),
    .o_bus(o_bus)
  );
 
endmodule
