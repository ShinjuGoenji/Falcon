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
assign a_b = {1'b0, a} - {1'b0, b};
assign a_b_p = a_b + p;
assign d = (a_b[P_WIDTH]) ? a_b_p[P_WIDTH-1:0] : a_b[P_WIDTH-1:0];

endmodule

/*
 * Montgomery multiplication modulo p. The 'p0i' value is -1/p mod 2^31.
 * It is required that p is an odd integer.
 */
module MODP_MONTYMUL (
    // Input signals
    clk,
    rst_n,
    ena,
    in_valid,
    a,
    b,
    p,
    p0i,
    isMQ,
    // Output signals
    out_valid,
    d
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam P_WIDTH = 31;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                clk;
input                rst_n;
input                ena;
input                in_valid;
input  [P_WIDTH-1:0] a;
input  [P_WIDTH-1:0] b;
input  [P_WIDTH-1:0] p;
input  [P_WIDTH-1:0] p0i;
input                isMQ;
    
output reg               out_valid;
output reg [P_WIDTH-1:0] d;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg  [P_WIDTH-1:0]   a_reg;
reg                  ena_reg;
reg                  isMQ_reg;
wire [P_WIDTH*2-1:0] a_b;
reg  [P_WIDTH*2-1:0] a_b_reg;
wire [P_WIDTH*3-1:0] a_b_p0i;
reg  [P_WIDTH*3-1:0] a_b_p0i_reg;
wire [P_WIDTH+15:0]  w_q;
wire [P_WIDTH*2-1:0] w_p;
wire [P_WIDTH*2:0]   z_w_q;
wire [P_WIDTH*2:0]   z_w_p;
wire [P_WIDTH:0]     z_w_q_shift;
wire [P_WIDTH:0]     z_w_p_shift;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
assign a_b = a * b;
assign a_b_p0i = a_b * p0i;
assign w_q = a_b_p0i_reg[15:0] * p;
assign w_p = a_b_p0i_reg[30:0] * p;

assign z_w_q = a_b_reg + w_q;
assign z_w_p = a_b_reg + w_p;
assign z_w_q_shift = z_w_q[P_WIDTH*2:16];
assign z_w_p_shift = z_w_p[P_WIDTH*2:31];

always @(*) begin
    if (ena_reg) begin
        if (isMQ_reg) begin
            if (z_w_q_shift >= p)
                d = z_w_q_shift - p;
            else
                d = z_w_q_shift;
        end
        else begin
            if (z_w_p_shift >= p)
                d = z_w_p_shift - p;
            else
                d = z_w_p_shift;
        end
    end
    else begin
        d = a_reg;
    end
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        a_reg <= 0;
        ena_reg <= 0;
        isMQ_reg <= 0;
        out_valid <= 0;
        a_b_reg <= 0;
        a_b_p0i_reg <= 0;
    end
    else begin
        a_reg <= a;
        ena_reg <= ena;
        isMQ_reg <= isMQ;
        out_valid <= in_valid;
        a_b_reg <= a_b;
        a_b_p0i_reg <= a_b_p0i;
    end
end

endmodule
