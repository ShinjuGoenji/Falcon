/*
 * Subtraction modulo p.
 */
module MODP_SUB (
    // Input signals
    a,
    b,
    p,
    // Output signals
    d
);
import usertype::*;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  uint31_t a;
input  uint31_t b;
input  uint31_t p;

output uint31_t d;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [P_WIDTH:0] a_b;
wire [P_WIDTH:0] a_b_p;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
assign a_b = {1'b0, a} - {1'b0, b};
assign a_b_p = a_b + p;
assign d = (a_b[P_WIDTH]) ? a_b_p[P_WIDTH-1:0] : a_b[P_WIDTH-1:0];

endmodule