/*
 * Add y*s to x. x and y initially have length 'len' words; the new x
 * has length 'len+1' words. 's' must fit on 31 bits. x[] and y[] must
 * not overlap.
 */
module ZINT_ADD_MUL_SMALL (
    // Input signals
    clk,
    rst_n,
    x_i,
    y,
    len,
    s,
    cnt,
    // Output signals
    x_o
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam P_WIDTH = 31;

`ifdef FALCON1024
    localparam LEN_WIDTH = 9;
`else
    localparam LEN_WIDTH = 8;
`endif

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                  clk;
input                  rst_n;
input  [P_WIDTH-1:0]   x_i;
input  [P_WIDTH-1:0]   y;
input  [LEN_WIDTH-1:0] len;
input  [P_WIDTH-1:0]   s;
input  [LEN_WIDTH-1:0] cnt;

output [P_WIDTH-1:0]   x_o;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
logic [P_WIDTH-1:0]   xw, yw;
logic [P_WIDTH*2-1:0] z;
logic [P_WIDTH-1:0]   cc, cc_comb;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * variable
 */
assign xw = x_i;
assign yw = y;

assign z = yw * s + xw + cc;
always_comb begin
    if (cnt == len)
        cc_comb = 0;
    else 
        cc_comb = z >> 31;
end

/*
 * Output
 */
assign x_o = z & 'h7FFFFFFF;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cc <= 0;
    end
    else begin
        cc <= cc_comb;
    end
end

endmodule
