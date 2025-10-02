`include "MODP_MONTYMUL_TOP.v"
`include "MODP_R2.v"
            
module KEYGEN #(
    parameter MODP_R2_NUM = 3,
    parameter MODP_MONTYMUL_NUM = 2
)(
    // Input signals
    clk,
    rst_n,
    in_valid_bus,
    p_bus,
    p0i_bus,
    // Output signals
    out_valid_bus,
    R2_bus
);

//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------
localparam P_WIDTH = 31;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                            clk;
input                            rst_n;
input  [MODP_R2_NUM-1:0]         in_valid_bus;
input  [P_WIDTH*MODP_R2_NUM-1:0] p_bus;
input  [P_WIDTH*MODP_R2_NUM-1:0] p0i_bus;

output [MODP_R2_NUM-1:0]         out_valid_bus;
output [P_WIDTH*MODP_R2_NUM-1:0] R2_bus;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
/*
 * MODP_R2
 */
wire               in_valid  [0:MODP_R2_NUM-1];
wire [P_WIDTH-1:0] p         [0:MODP_R2_NUM-1];  
wire [P_WIDTH-1:0] p0i       [0:MODP_R2_NUM-1];

wire               out_valid [0:MODP_R2_NUM-1];
wire [P_WIDTH-1:0] R2        [0:MODP_R2_NUM-1];  

reg                out_valid_modp_montymul [0:MODP_R2_NUM-1];
reg  [P_WIDTH-1:0] d_modp_montymul         [0:MODP_R2_NUM-1];
reg                ready_modp_montymul     [0:MODP_R2_NUM-1];

wire               in_valid_modp_montymul  [0:MODP_R2_NUM-1];
wire [P_WIDTH-1:0] a_modp_montymul         [0:MODP_R2_NUM-1];
wire [P_WIDTH-1:0] b_modp_montymul         [0:MODP_R2_NUM-1];
wire [P_WIDTH-1:0] p_modp_montymul         [0:MODP_R2_NUM-1];
wire [P_WIDTH-1:0] p0i_modp_montymul       [0:MODP_R2_NUM-1];
wire               isMQ_modp_montymul      [0:MODP_R2_NUM-1];

/*
 * MODP_MONTYMUL_TOP
 */
reg  [MODP_R2_NUM-1:0]         in_valid_modp_montymul_bus;
reg  [P_WIDTH*MODP_R2_NUM-1:0] a_modp_montymul_bus;
reg  [P_WIDTH*MODP_R2_NUM-1:0] b_modp_montymul_bus;
reg  [P_WIDTH*MODP_R2_NUM-1:0] p_modp_montymul_bus;
reg  [P_WIDTH*MODP_R2_NUM-1:0] p0i_modp_montymul_bus;
reg  [MODP_R2_NUM-1:0]         isMQ_modp_montymul_bus;

wire [MODP_R2_NUM-1:0]         out_valid_modp_montymul_bus;
wire [P_WIDTH*MODP_R2_NUM-1:0] d_modp_montymul_bus;
wire [MODP_R2_NUM-1:0]         ready_modp_montymul_bus;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * Interface -- MODP_R2
 */
genvar modp_R2_pin_idx;
generate
    for (modp_R2_pin_idx = 0; modp_R2_pin_idx < MODP_R2_NUM; modp_R2_pin_idx = modp_R2_pin_idx + 1) begin
        assign in_valid[modp_R2_pin_idx] = in_valid_bus[modp_R2_pin_idx];
        assign p[modp_R2_pin_idx]        = p_bus[P_WIDTH*(modp_R2_pin_idx+1)-1 -: P_WIDTH];
        assign p0i[modp_R2_pin_idx]      = p0i_bus[P_WIDTH*(modp_R2_pin_idx+1)-1 -: P_WIDTH];
        assign out_valid_bus[modp_R2_pin_idx] = out_valid[modp_R2_pin_idx];
        assign R2_bus[P_WIDTH*(modp_R2_pin_idx+1)-1 -: P_WIDTH] = R2[modp_R2_pin_idx];
    end
endgenerate

/*
 * MODP_R2 -- MODP_MONTYMUL_TOP
 */
genvar modp_montymul_pin_idx;
generate
    for (modp_montymul_pin_idx = 0; modp_montymul_pin_idx < MODP_R2_NUM; modp_montymul_pin_idx = modp_montymul_pin_idx + 1) begin
        always @(*) begin
            out_valid_modp_montymul[modp_montymul_pin_idx] = out_valid_modp_montymul_bus[modp_montymul_pin_idx];
            d_modp_montymul[modp_montymul_pin_idx]         = d_modp_montymul_bus[P_WIDTH*(modp_montymul_pin_idx+1)-1 -: P_WIDTH];
            ready_modp_montymul[modp_montymul_pin_idx]     = ready_modp_montymul_bus[modp_montymul_pin_idx];
            in_valid_modp_montymul_bus[modp_montymul_pin_idx]                     = in_valid_modp_montymul[modp_montymul_pin_idx];
            a_modp_montymul_bus[P_WIDTH*(modp_montymul_pin_idx+1)-1 -: P_WIDTH]   = a_modp_montymul[modp_montymul_pin_idx];
            b_modp_montymul_bus[P_WIDTH*(modp_montymul_pin_idx+1)-1 -: P_WIDTH]   = b_modp_montymul[modp_montymul_pin_idx];
            p_modp_montymul_bus[P_WIDTH*(modp_montymul_pin_idx+1)-1 -: P_WIDTH]   = p_modp_montymul[modp_montymul_pin_idx];
            p0i_modp_montymul_bus[P_WIDTH*(modp_montymul_pin_idx+1)-1 -: P_WIDTH] = p0i_modp_montymul[modp_montymul_pin_idx];
            isMQ_modp_montymul_bus[modp_montymul_pin_idx]                         = isMQ_modp_montymul[modp_montymul_pin_idx];
        end
    end
endgenerate

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
genvar modp_R2_idx;
generate
  for (modp_R2_idx = 0; modp_R2_idx < MODP_R2_NUM; modp_R2_idx = modp_R2_idx + 1) begin
    MODP_R2 u_MODP_R2(
      .clk(clk),
      .rst_n(rst_n),
      .in_valid(in_valid[modp_R2_idx]),
      .p(p[modp_R2_idx]),
      .p0i(p0i[modp_R2_idx]),
      .out_valid(out_valid[modp_R2_idx]),
      .R2(R2[modp_R2_idx]),
      .out_valid_modp_montymul(out_valid_modp_montymul[modp_R2_idx]),
      .d_modp_montymul(d_modp_montymul[modp_R2_idx]),
      .ready_modp_montymul(ready_modp_montymul[modp_R2_idx]),
      .in_valid_modp_montymul(in_valid_modp_montymul[modp_R2_idx]),
      .a_modp_montymul(a_modp_montymul[modp_R2_idx]),
      .b_modp_montymul(b_modp_montymul[modp_R2_idx]),
      .p_modp_montymul(p_modp_montymul[modp_R2_idx]),
      .p0i_modp_montymul(p0i_modp_montymul[modp_R2_idx]),
      .isMQ_modp_montymul(isMQ_modp_montymul[modp_R2_idx])
    );
  end
endgenerate

MODP_MONTYMUL_TOP #(.BUS_WIDTH(MODP_R2_NUM), .MUL_NUM(MODP_MONTYMUL_NUM)) u_MODP_MONTYMUL_TOP(
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
 
endmodule
