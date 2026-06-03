`include "FPC.sv"


module FPC_TOP #(
    parameter FLOAT_PRECISION = 64
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    a_re, a_im,
    b_re, b_im,
    // Output signals
    out_valid,
    d_re, d_im
);

input clk, rst_n;
input in_valid;
input [FLOAT_PRECISION-1:0] a_re, a_im;
input [FLOAT_PRECISION-1:0] b_re, b_im;
output reg out_valid;
output reg [FLOAT_PRECISION-1:0] d_re, d_im;

localparam PIPELINE_STAGES = 3;

reg valid_reg [0:PIPELINE_STAGES-1];

// FPC_ADD #(.FLOAT_PRECISION(FLOAT_PRECISION), .PIPELINE_STAGES(PIPELINE_STAGES)) 
// u_FPC_ADD (
//     .clk(clk), .rst_n(rst_n),
//     .a_re(a_re), .a_im(a_im),
//     .b_re(b_re), .b_im(b_im),
//     .d_re(d_re), .d_im(d_im)
// );

// FPC_SUB #(.FLOAT_PRECISION(FLOAT_PRECISION), .PIPELINE_STAGES(PIPELINE_STAGES)) 
// u_FPC_SUB (
//     .clk(clk), .rst_n(rst_n),
//     .a_re(a_re), .a_im(a_im),
//     .b_re(b_re), .b_im(b_im),
//     .d_re(d_re), .d_im(d_im)
// );

FPC_MUL #(.FLOAT_PRECISION(FLOAT_PRECISION), .PIPELINE_STAGES(PIPELINE_STAGES)) 
u_FPC_MUL (
    .clk(clk), .rst_n(rst_n),
    .a_re(a_re), .a_im(a_im),
    .b_re(b_re), .b_im(b_im),
    .d_re(d_re), .d_im(d_im)
);

assign valid_reg[PIPELINE_STAGES-1] = in_valid;
genvar i;
generate
    for (i = 0; i < PIPELINE_STAGES-1; i = i + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                valid_reg[i] <= 0;
            end else begin
                valid_reg[i] <= valid_reg[i+1];
            end
        end
    end
endgenerate

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        out_valid <= 0;
    end else begin
        out_valid <= valid_reg[0];
    end
end

endmodule