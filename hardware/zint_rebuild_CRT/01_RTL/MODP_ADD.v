/*
 * Addition modulo p.
 */
module MODP_ADD (
    // Input signals
    a,
    b,
    p,
    // Output signals
    d
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam P_WIDTH = 31;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  [P_WIDTH-1:0] a;
input  [P_WIDTH-1:0] b;
input  [P_WIDTH-1:0] p;

output [P_WIDTH-1:0] d;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [P_WIDTH:0] a_b;
wire [P_WIDTH:0] a_b_p;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * We compute a + b - p. If the result is negative, then the
 * high bit will be set, and 'd >> 31' will be equal to 1;
 * thus '-(d >> 31)' will be an all-one pattern. Otherwise,
 * it will be an all-zero pattern. In other words, this
 * implements a conditional addition of p.
 */
assign a_b = a + b;
assign a_b_p = a_b - p;
assign d = (a_b >= p) ? a_b_p[P_WIDTH-1:0] : a_b[P_WIDTH-1:0];

endmodule
