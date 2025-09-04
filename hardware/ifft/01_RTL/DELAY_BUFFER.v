module DELAY_BUFFER #(
    parameter FLOAT_PRECISION = 64,
    parameter DEPTH = 0
)(
    // Input signals
    clk, rst_n,
    ena,
    i_valid,
    di_re, di_im,
    // Output signals
    o_valid,
    do_re, do_im
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input  clk, rst_n;
input  ena;
input  i_valid;
input  [FLOAT_PRECISION-1:0] di_re;
input  [FLOAT_PRECISION-1:0] di_im;

output o_valid;
output [FLOAT_PRECISION-1:0] do_re;
output [FLOAT_PRECISION-1:0] do_im;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg buf_valid [0:DEPTH-1];
reg [FLOAT_PRECISION-1:0] buf_re [0:DEPTH-1];
reg [FLOAT_PRECISION-1:0] buf_im [0:DEPTH-1];

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        buf_valid[0] <= 0;
        buf_re[0] <= 0;
        buf_im[0] <= 0;
    end
    else begin
        if (ena) begin
            buf_valid[0] <= i_valid;
            buf_re[0] <= di_re;
            buf_im[0] <= di_im;
        end
        else begin
            buf_valid[0] <= buf_valid[0];
            buf_re[0] <= buf_re[0];
            buf_im[0] <= buf_im[0];
        end
    end
end

genvar i_depth;
generate
    for (i_depth = 1; i_depth < DEPTH; i_depth = i_depth + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                buf_valid[i_depth] <= 0;
                buf_re[i_depth] <= 0;
                buf_im[i_depth] <= 0;
            end
            else begin
                if (ena) begin
                    buf_valid[i_depth] <= buf_valid[i_depth-1];
                    buf_re[i_depth] <= buf_re[i_depth-1];
                    buf_im[i_depth] <= buf_im[i_depth-1];
                end
                else begin
                    buf_valid[i_depth] <= buf_valid[i_depth];
                    buf_re[i_depth] <= buf_re[i_depth];
                    buf_im[i_depth] <= buf_im[i_depth];
                end
            end
        end
    end
endgenerate

//---------------------------------------------------------------------
//   Output assignment
//---------------------------------------------------------------------
assign o_valid = buf_valid[DEPTH-1];
assign do_re = buf_re[DEPTH-1];
assign do_im = buf_im[DEPTH-1];

endmodule
