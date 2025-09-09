module DELAY_BUFFER #(
    parameter DEPTH = 0
)(
    // Input signals
    clk, rst_n,
    ena,
    i_valid,
    d_i,
    // Output signals
    o_valid,
    d_o
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam Q_WIDTH = 14;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  clk, rst_n;
input  ena;
input  i_valid;
input  [Q_WIDTH-1:0] d_i;

output o_valid;
output [Q_WIDTH-1:0] d_o;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg buf_valid [0:DEPTH-1];
reg [Q_WIDTH-1:0] buff [0:DEPTH-1];

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        buf_valid[0] <= 0;
        buff[0] <= 0;
    end
    else begin
        if (ena) begin
            buf_valid[0] <= i_valid;
            buff[0] <= d_i;
        end
        else begin
            buf_valid[0] <= buf_valid[0];
            buff[0] <= buff[0];
        end
    end
end

genvar i_depth;
generate
    for (i_depth = 1; i_depth < DEPTH; i_depth = i_depth + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                buf_valid[i_depth] <= 0;
                buff[i_depth] <= 0;
            end
            else begin
                if (ena) begin
                    buf_valid[i_depth] <= buf_valid[i_depth-1];
                    buff[i_depth] <= buff[i_depth-1];
                end
                else begin
                    buf_valid[i_depth] <= buf_valid[i_depth];
                    buff[i_depth] <= buff[i_depth];
                end
            end
        end
    end
endgenerate

//---------------------------------------------------------------------
//   Output assignment
//---------------------------------------------------------------------
assign o_valid = buf_valid[DEPTH-1];
assign d_o = buff[DEPTH-1];

endmodule
