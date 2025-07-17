/*
 * Compute squared norm of a short vector.
 */
module POLY_SMALL_SQNORM #(
    parameter logn = 9
)( 
    // Input signals
    clk,
    rst_n,
    ena,
    f_valid,
    f,
    // Output signals
    s_valid,
    s
);
//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam f_bit = (logn == 9) ? 7 : 6;
localparam s_bit = (logn == 9) ? 21 : 20;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                    clk;
input                    rst_n;
input                    ena;      // Enable signal of this module.
input                    f_valid;  // Valid signal of input f.
input signed [f_bit-1:0] f;        // 7-bit signed input value.

output reg               s_valid;  // Valid signal of output val.
output reg [s_bit-1:0]   s;        // 21-bit signed output value (registered).

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg _s_valid;
reg [s_bit-1:0] _s;
reg [2*f_bit-1:0] ff;

//---------------------------------------------------------------------
//   Datapath Logic
//---------------------------------------------------------------------
assign _s_valid = ena && f_valid;
assign ff = f * f;

always @(*) begin
    if (ena) begin
        if (f_valid)
            _s = s + ff;
        else
            _s = s;
    end
    else _s = 0;
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        s <= 0;
        s_valid <= 0;
    end
    else begin
        s <= _s;
        s_valid <= _s_valid;
    end
end

endmodule