/*
 * Compute -1/p mod 2^31. This works for all odd integers p that fit
 * on 31 bits.
 */
module MODP_NINV31 ( 
    // Input signals
    clk, 
    rst_n,
    in_valid,
    p,
    // Output signals
    out_valid,
    p0i
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam P_WIDTH = 31;
localparam Y_WIDTH = 32;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                clk;
input                rst_n;
input                in_valid;
input  [P_WIDTH-1:0] p;

output               out_valid;
output [P_WIDTH-1:0] p0i;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
/*
 * Stage 1  
 */
reg v1;
reg [P_WIDTH-1:0] p1;
reg [Y_WIDTH-1:0] y1, next_y1;

/*
 * Stage 2  
 */
reg v2;
reg [P_WIDTH-1:0] p2;
reg [Y_WIDTH-1:0] y2, next_y2;

/*
 * Stage 3  
 */
reg v3;
reg [P_WIDTH-1:0] p3;
reg [Y_WIDTH-1:0] y3, next_y3;

/*
 * Stage 4  
 */
reg v4;
reg [P_WIDTH-1:0] y4, next_y4;


//---------------------------------------------------------------------
//   Combinational Logic
//--------------------------------------------------------------------
/*
 * Stage 1  
 */
always @(*) begin
    next_y1 = 2 - {1'b0, p};
    next_y1 = next_y1 * (2 - p * next_y1);
end

/*
 * Stage 2
 */
always @(*) begin
    next_y2 = y1 * (2 - p1 * y1);
end

/*
 * Stage 3
 */
always @(*) begin
    next_y3 = y2 * (2 - p2 * y2);
end

/*
 * Stage 4
 */
always @(*) begin
    next_y4 = y3 * (2 - p3 * y3);
    next_y4 = (31'h7FFFFFFF) & (-next_y4);
end

assign out_valid = v4;
assign p0i = y4;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        v1 <= 0;
        p1 <= 0;
        y1 <= 0;
        v2 <= 0;
        p2 <= 0;
        y2 <= 0;
        v3 <= 0;
        p3 <= 0;
        y3 <= 0;
        v4 <= 0;
        y4 <= 0;
    end
    else begin
        v1 <= in_valid;
        p1 <= p;
        y1 <= next_y1;
        v2 <= v1;
        p2 <= p1;
        y2 <= next_y2;
        v3 <= v2;
        p3 <= p2;
        y3 <= next_y3;
        v4 <= v3;
        y4 <= next_y4;
    end
end

endmodule
