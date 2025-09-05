#include "MQ.v"

/*
 * Divide x by y modulo q = 12289.
 */
module MQ_DIV_12289 ( 
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
localparam MULT_STAGE = 19;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                     clk;
input                     rst_n;
input                     in_valid;
input       [Q_WIDTH-1:0] x;
input       [Q_WIDTH-1:0] y;

output reg                out_valid;
output reg  [Q_WIDTH-1:0] z;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg in_valid_reg;
reg [Q_WIDTH-1:0] x_reg, y_reg;

reg        mult_in_valid [0:MULT_STAGE-1];
reg [Q_WIDTH-1:0] mult_x [0:MULT_STAGE-1];
reg [Q_WIDTH-1:0] mult_y [0:MULT_STAGE-1];

reg       mult_out_valid [0:MULT_STAGE-1];
reg [Q_WIDTH-1:0] mult_z [0:MULT_STAGE-1];

//---------------------------------------------------------------------
//   Submodule
//--------------------------------------------------------------------
genvar mq_montymul_idx;
generate
    for (mq_montymul_idx = 0; mq_montymul_idx < MULT_STAGE; mq_montymul_idx = mq_montymul_idx + 1) begin
        MQ_MONTYMUL u_MQ_MONTYMUL (
            // Input signals
            .clk(clk),
            .rst_n(rst_n),
            .in_valid(mult_in_valid[mq_montymul_idx]),
            .x(mult_x[mq_montymul_idx]),
            .y(mult_y[mq_montymul_idx]),
            // Output signals
            .out_valid(mult_out_valid[mq_montymul_idx]),
            .z(mult_z[mq_montymul_idx])
            );
    end
endgenerate

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        in_valid_reg <= 0;
        x_reg <= 0;
        y_reg <= 0;
    end
    else begin
        in_valid_reg <= in_valid;
        x_reg <= x;
        y_reg <= y;
    end
end

endmodule
