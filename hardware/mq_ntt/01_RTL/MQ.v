/*
 * Addition modulo q. Operands must be in the 0..q-1 range.
 */
module MQ_ADD (
    // Input signals
    x,
    y,
    // Output signals
    d
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam Q_WIDTH = 14;
localparam       Q = 14'd12289;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  [Q_WIDTH-1:0] x;
input  [Q_WIDTH-1:0] y;

output [Q_WIDTH-1:0] d;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [Q_WIDTH:0] x_y;
wire [Q_WIDTH:0] x_y_q;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * We compute x + y - q. If the result is negative, then the
 * high bit will be set, and 'd >> 31' will be equal to 1;
 * thus '-(d >> 31)' will be an all-one pattern. Otherwise,
 * it will be an all-zero pattern. In other words, this
 * implements a conditional addition of q.
 */
assign x_y = x + y;
assign x_y_q = x_y - Q;
assign d = (x_y >= Q) ? x_y_q[Q_WIDTH-1:0] : x_y[Q_WIDTH-1:0];

endmodule

/*
 * Subtraction modulo q. Operands must be in the 0..q-1 range.
 */
module MQ_SUB (
    // Input signals
    x,
    y,
    // Output signals
    d
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam Q_WIDTH = 14;
localparam       Q = 14'd12289;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  [Q_WIDTH-1:0] x;
input  [Q_WIDTH-1:0] y;

output [Q_WIDTH-1:0] d;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [Q_WIDTH:0] x_y;
wire [Q_WIDTH:0] x_y_q;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * As in mq_add(), we use a conditional addition to ensure the
 * result is in the 0..q-1 range.
 */
assign x_y = {1'b0, x} - {1'b0, y};
assign x_y_q = x_y + Q;
assign d = (x_y[Q_WIDTH]) ? x_y_q[Q_WIDTH-1:0] : x_y[Q_WIDTH-1:0];

endmodule

/*
 * Montgomery multiplication modulo q. If we set R = 2^16 mod q, then
 * this function computes: x * y / R mod q
 * Operands must be in the 0..q-1 range.
 */
module MQ_MONTYMUL (
    // Input signals
    clk,
    rst_n,
    in_valid,
    x,
    y,
    // Output signals
    out_valid,
    z
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam Q_WIDTH = 14;
localparam       Q = 14'd12289;
localparam     Q0I = 14'd12287;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                clk;
input                rst_n;
input                in_valid;
input  [Q_WIDTH-1:0] x;
input  [Q_WIDTH-1:0] y;
    
output reg           out_valid;
output [Q_WIDTH-1:0] z;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [Q_WIDTH*2-1:0] x_y;
reg  [Q_WIDTH*2-1:0] x_y_reg;
wire [Q_WIDTH*3-1:0] x_y_Q0I;
wire [Q_WIDTH+15:0]  w;
reg  [Q_WIDTH+15:0]  w_reg;
wire [Q_WIDTH+16:0]  z_w;
wire [Q_WIDTH:0]     z_w_shift;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * We compute x*y + k*q with a value of k chosen so that the 16
 * low bits of the result are 0. We can then shift the value.
 * After the shift, result may still be larger than q, but it
 * will be lower than 2*q, so a conditional subtraction works.
 */
assign x_y = x * y;
assign x_y_Q0I = x_y * Q0I;
assign w = x_y_Q0I[15:0] * Q;

/*
 * When adding z and w, the result will have its low 16 bits
 * equal to 0. Since x, y and z are lower than q, the sum will
 * be no more than (2^15 - 1) * q + (q - 1)^2, which will
 * fit on 29 bits.
 */
assign z_w = x_y + w;
assign z_w_shift = z_w[Q_WIDTH+16:16];

/*
 * After the shift, analysis shows that the value will be less
 * than 2q. We do a subtraction then conditional subtraction to
 * ensure the result is in the expected range.
 */
assign z = (z_w_shift >= Q) ? z_w_shift - Q : z_w_shift;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        out_valid <= 0;
        x_y_reg <= 0;
        w_reg <= 0;
    end
    else begin
        out_valid <= in_valid;
        x_y_reg <= x_y;
        w_reg <= w;
    end
end

endmodule
