`include "MODP_R.v"
`include "MODP_MONTYMUL_TOP.sv"
`include "MODP_R2_TOP.v"
`include "MODP_MKGM2.v"
`include "MEMORY_CTRL.v"

            
module MAKE_FG (
    // Input signals
    clk,
    rst_n,
    in_valid,
    f
    p,
    p0i,
    R2,,
    logn,
    depth,
    // Output signals
    out_valid,
    out_data
);

//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------
localparam P_WIDTH = 31;
localparam LOGN_WIDTH = 4;

// localparam MODP_MKGM2_MODP_MONTYMUL_NUM = 2;
// localparam MODP_R2_NUM_MODP_MONTYMUL_NUM = 1;
// localparam MODP_MKGM2_MODP_R2_NUM = 1;

// localparam MODP_MONTYMUL_MASTER_NUM = MODP_MKGM2_MODP_MONTYMUL_NUM + MODP_R2_NUM_MODP_MONTYMUL_NUM;
// localparam MODP_R2_MASTER_NUM = MODP_MKGM2_MODP_R2_NUM;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                   clk;
input                   rst_n;
input                   in_valid;
input  [P_WIDTH-1:0]    f;
input  [P_WIDTH-1:0]    p;
input  [P_WIDTH-1:0]    p0i;
input  [P_WIDTH-1:0]    R2;
input  [LOGN_WIDTH-1:0] logn;
input  [LOGN_WIDTH-1:0] depth;

output                  out_valid;
output [P_WIDTH-1:0]    out_data;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
/*
 * MODP_MKGM2
 */
reg  [MODP_MKGM2_MODP_MONTYMUL_NUM-1:0]         out_valid_modp_montymul;
reg  [P_WIDTH*MODP_MKGM2_MODP_MONTYMUL_NUM-1:0] d_modp_montymul;
reg  [MODP_MKGM2_MODP_MONTYMUL_NUM-1:0]         ready_modp_montymul; 

wire [MODP_MKGM2_MODP_MONTYMUL_NUM-1:0]         in_valid_modp_montymul;
wire [P_WIDTH*MODP_MKGM2_MODP_MONTYMUL_NUM-1:0] a_modp_montymul;
wire [P_WIDTH*MODP_MKGM2_MODP_MONTYMUL_NUM-1:0] b_modp_montymul;
wire [P_WIDTH*MODP_MKGM2_MODP_MONTYMUL_NUM-1:0] p_modp_montymul;
wire [P_WIDTH*MODP_MKGM2_MODP_MONTYMUL_NUM-1:0] p0i_modp_montymul;
wire [MODP_MKGM2_MODP_MONTYMUL_NUM-1:0]         isMQ_modp_montymul;

/*
 * MODP_R2
 */
wire               in_valid_modp_R2;
wire [P_WIDTH-1:0] p_modp_R2;  
wire [P_WIDTH-1:0] p0i_modp_R;

wire               out_valid_modp_R2;
wire [P_WIDTH-1:0] R2_modp_R2;  
wire               ready_modp_R2;

reg                out_valid_modp_montymul_modp_R2;
reg  [P_WIDTH-1:0] d_modp_montymul_modp_R2;
reg                ready_modp_montymul_modp_R2;

wire               in_valid_modp_montymul_modp_R2;
wire [P_WIDTH-1:0] a_modp_montymul_modp_R2;
wire [P_WIDTH-1:0] b_modp_montymul_modp_R2;
wire [P_WIDTH-1:0] p_modp_montymul_modp_R2;
wire [P_WIDTH-1:0] p0i_modp_montymul_modp_R2;
wire               isMQ_modp_montymul_modp_R2;

/*
 * MODP_MONTYMUL_TOP
 */
reg  [MODP_MONTYMUL_MASTER_NUM-1:0]         in_valid_modp_montymul_bus;
reg  [P_WIDTH*MODP_MONTYMUL_MASTER_NUM-1:0] a_modp_montymul_bus;
reg  [P_WIDTH*MODP_MONTYMUL_MASTER_NUM-1:0] b_modp_montymul_bus;
reg  [P_WIDTH*MODP_MONTYMUL_MASTER_NUM-1:0] p_modp_montymul_bus;
reg  [P_WIDTH*MODP_MONTYMUL_MASTER_NUM-1:0] p0i_modp_montymul_bus;
reg  [MODP_MONTYMUL_MASTER_NUM-1:0]         isMQ_modp_montymul_bus;

wire [MODP_MONTYMUL_MASTER_NUM-1:0]         out_valid_modp_montymul_bus;
wire [P_WIDTH*MODP_MONTYMUL_MASTER_NUM-1:0] d_modp_montymul_bus;
wire [MODP_MONTYMUL_MASTER_NUM-1:0]         ready_modp_montymul_bus;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * MODP_R2 -- MODP_MONTYMUL_TOP
 */
always_comb begin
    in_valid_modp_montymul_bus = {in_valid_modp_montymul_modp_R2, in_valid_modp_montymul};
    a_modp_montymul_bus        = {a_modp_montymul_modp_R2, a_modp_montymul};
    b_modp_montymul_bus        = {b_modp_montymul_modp_R2, b_modp_montymul};
    p_modp_montymul_bus        = {p_modp_montymul_modp_R2, p_modp_montymul};
    p0i_modp_montymul_bus      = {p0i_modp_montymul_modp_R2, p0i_modp_montymul};
    isMQ_modp_montymul_bus     = {isMQ_modp_montymul_modp_R2, isMQ_modp_montymul};
end

always_comb begin
    out_valid_modp_montymul = out_valid_modp_montymul_bus[MODP_MKGM2_MODP_MONTYMUL_NUM-1:0];
    d_modp_montymul         = d_modp_montymul_bus[P_WIDTH*MODP_MKGM2_MODP_MONTYMUL_NUM-1:0];
    ready_modp_montymul     = ready_modp_montymul_bus[MODP_MKGM2_MODP_MONTYMUL_NUM-1:0];
end

always_comb begin
    out_valid_modp_montymul_modp_R2 = out_valid_modp_montymul_bus[MODP_MONTYMUL_MASTER_NUM-1];
    d_modp_montymul_modp_R2         = d_modp_montymul_bus[P_WIDTH*MODP_MONTYMUL_MASTER_NUM-1 -: P_WIDTH];
    ready_modp_montymul_modp_R2     = ready_modp_montymul_bus[MODP_MONTYMUL_MASTER_NUM-1];
end

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
ZINT_REBUILD_CRT u_ZINT_REBUILD_CRT (
    // Main channel
    // Input signals
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .logn(logn),
    .g(g),
    .p(p),
    .p0i(p0i),
    .mode(mode),
    // Output signals
    .out_valid_gm(out_valid_gm),
    .v_gm(v_gm),
    .gm(gm),
    .out_valid_igm(out_valid_igm),
    .v_igm(v_igm),
    .igm(igm),
    // MODP_MONTYMUL_TOP
    // Input signals
    .out_valid_modp_montymul_bus(out_valid_modp_montymul),
    .d_modp_montymul_bus(d_modp_montymul),
    .ready_modp_montymul_bus(ready_modp_montymul),
    // Output signals
    .in_valid_modp_montymul_bus(in_valid_modp_montymul),
    .a_modp_montymul_bus(a_modp_montymul),
    .b_modp_montymul_bus(b_modp_montymul),
    .p_modp_montymul_bus(p_modp_montymul),
    .p0i_modp_montymul_bus(p0i_modp_montymul),
    .isMQ_modp_montymul_bus(isMQ_modp_montymul),
    // MODP_R2_TOP
    // Input signals
    .out_valid_modp_R2(out_valid_modp_R2),
    .R2_modp_R2(R2_modp_R2),
    .ready_modp_R2(ready_modp_R2),
    // Output signals
    .in_valid_modp_R2(in_valid_modp_R2),
    .p_modp_R2(p_modp_R2),
    .p0i_modp_R2(p0i_modp_R)
);

MODP_MKGM2 u_MODP_MKGM2(
    // Main channel
    // Input signals
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .logn(logn),
    .g(g),
    .p(p),
    .p0i(p0i),
    .mode(mode),
    // Output signals
    .out_valid_gm(out_valid_gm),
    .v_gm(v_gm),
    .gm(gm),
    .out_valid_igm(out_valid_igm),
    .v_igm(v_igm),
    .igm(igm),
    // MODP_MONTYMUL_TOP
    // Input signals
    .out_valid_modp_montymul_bus(out_valid_modp_montymul),
    .d_modp_montymul_bus(d_modp_montymul),
    .ready_modp_montymul_bus(ready_modp_montymul),
    // Output signals
    .in_valid_modp_montymul_bus(in_valid_modp_montymul),
    .a_modp_montymul_bus(a_modp_montymul),
    .b_modp_montymul_bus(b_modp_montymul),
    .p_modp_montymul_bus(p_modp_montymul),
    .p0i_modp_montymul_bus(p0i_modp_montymul),
    .isMQ_modp_montymul_bus(isMQ_modp_montymul),
    // MODP_R2_TOP
    // Input signals
    .out_valid_modp_R2(out_valid_modp_R2),
    .R2_modp_R2(R2_modp_R2),
    .ready_modp_R2(ready_modp_R2),
    // Output signals
    .in_valid_modp_R2(in_valid_modp_R2),
    .p_modp_R2(p_modp_R2),
    .p0i_modp_R2(p0i_modp_R)
);

MODP_MONTYMUL_TOP #(.MASTER_NUM(MODP_MONTYMUL_MASTER_NUM), .MUL_NUM(1)) u_MODP_MONTYMUL_TOP(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid_bus(in_valid_modp_montymul_bus),
    .a_bus(a_modp_montymul_bus),
    .b_bus(b_modp_montymul_bus),
    .p_bus(p_modp_montymul_bus),
    .p0i_bus(p0i_modp_montymul_bus),
    .isMQ_bus(isMQ_modp_montymul_bus),
    .out_valid_bus(out_valid_modp_montymul_bus),
    .d_bus(d_modp_montymul_bus),
    .ready_bus(ready_modp_montymul_bus)
);

MODP_R2_TOP #(.MASTER_NUM(MODP_R2_MASTER_NUM), .R2_NUM(1)) u_MODP_R2_TOP(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid_bus(in_valid_modp_R2),
    .p_bus(p_modp_R2),
    .p0i_bus(p0i_modp_R),
    .out_valid_bus(out_valid_modp_R2),
    .R2_bus(R2_modp_R2),
    .ready_bus(ready_modp_R2),
    .out_valid_modp_montymul_bus(out_valid_modp_montymul_modp_R2),
    .d_modp_montymul_bus(d_modp_montymul_modp_R2),
    .ready_modp_montymul_bus(ready_modp_montymul_modp_R2),
    .in_valid_modp_montymul_bus(in_valid_modp_montymul_modp_R2),
    .a_modp_montymul_bus(a_modp_montymul_modp_R2),
    .b_modp_montymul_bus(b_modp_montymul_modp_R2),
    .p_modp_montymul_bus(p_modp_montymul_modp_R2),
    .p0i_modp_montymul_bus(p0i_modp_montymul_modp_R2),
    .isMQ_modp_montymul_bus(isMQ_modp_montymul_modp_R2)
);

endmodule
