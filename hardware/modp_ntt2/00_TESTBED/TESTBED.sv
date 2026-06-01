`timescale 1ns/10ps

`include "Usertype.sv"
`include "PATTERN.sv"
`ifdef RTL
    `include "MAKE_FG.sv"
`elsif GATE
    `include "MAKE_FG_SYN.v"
`endif
	  		  	
module TESTBED;

import FALCON_Config::*;

//================================================================
// Wire Declarations
//================================================================
logic                  clk;
logic                  rst_n;
logic                  inf_in_valid;
logic                  inf_len_valid;
uint31_t               inf_in_data;
logic [LOGN_WIDTH-1:0] inf_logn;
logic                  inf_out_valid;
uint31_t               inf_out_data;

//================================================================
// Dump Waveform
//================================================================
initial begin
  `ifdef RTL
    $fsdbDumpfile("MAKE_FG.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("MAKE_FG_SYN.sdf",u_MAKE_FG);
    // $fsdbDumpfile("MAKE_FG_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
  `endif
end

//================================================================
// Port Connection
//================================================================
`ifdef RTL
    MAKE_FG u_MAKE_FG(
        .clk(clk),
        .rst_n(rst_n),
        .inf_in_valid(inf_in_valid),
        .inf_len_valid(inf_len_valid),
        .inf_in_data(inf_in_data),
        .inf_logn(inf_logn),
        .inf_out_valid(inf_out_valid),
        .inf_out_data(inf_out_data)
    );
`elsif GATE
    MODP_NTT2 u_MODP_NTT2(
        .clk(clk),
        .rst_n(rst_n),
        .inf_in_valid(inf_in_valid),
        .inf_len_valid(inf_len_valid),
        .inf_in_data(inf_in_data),
        .inf_logn(inf_logn),
        .inf_out_valid(inf_out_valid),
        .inf_out_data(inf_out_data)
    );
`endif
	
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .inf_in_valid(inf_in_valid),
    .inf_len_valid(inf_len_valid),
    .inf_in_data(inf_in_data),
    .inf_logn(inf_logn),
    .inf_out_valid(inf_out_valid),
    .inf_out_data(inf_out_data)
);
 
endmodule
