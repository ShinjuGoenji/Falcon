#include "MQ.v"

/*
 * Divide x by y modulo q = 12289.
 */
module MQ_DIV_12289 ( 
    // Input signals
    clk, 
    rst_n,
    in_valid,
    x_i,
    y_i,
    // Output signals
    out_valid,
    z_o
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam Q_WIDTH = 14;
localparam DIV_STAGE = 20;
localparam MULT_STAGE = 1;

localparam X_PIPE_NUM = (DIV_STAGE-1) * (MULT_STAGE+1);
localparam Y0_PIPE_NUM = (DIV_STAGE-3) * (MULT_STAGE+1);
localparam Y1_PIPE_NUM = 1 * (MULT_STAGE+1);
localparam Y2_PIPE_NUM = 6 * (MULT_STAGE+1);
localparam Y8_PIPE_NUM = 1 * (MULT_STAGE+1);
localparam Y9_PIPE_NUM = 3 * (MULT_STAGE+1);
localparam Y10_PIPE_NUM = 5 * (MULT_STAGE+1);

localparam R2 = 14'd10952;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                     clk;
input                     rst_n;
input                     in_valid;
input       [Q_WIDTH-1:0] x_i;
input       [Q_WIDTH-1:0] y_i;

output reg                out_valid;
output reg  [Q_WIDTH-1:0] z_o;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg in_valid_reg;
reg [Q_WIDTH-1:0] x_i_reg, y_i_reg;

reg [Q_WIDTH-1:0] y_pipe_reg [0:DIV_STAGE-1];

reg        mult_in_valid [0:DIV_STAGE-1];
reg [Q_WIDTH-1:0] mult_x [0:DIV_STAGE-1];
reg [Q_WIDTH-1:0] mult_y [0:DIV_STAGE-1];

reg       mult_out_valid [0:DIV_STAGE-1], mult_out_valid_reg [0:DIV_STAGE-1];
reg [Q_WIDTH-1:0] mult_z [0:DIV_STAGE-1], y [0:DIV_STAGE-1];

// pipeline registers
reg [Q_WIDTH-1:0] x_pipe_reg   [0:X_PIPE_NUM-1];
reg [Q_WIDTH-1:0] y0_pipe_reg  [0:Y0_PIPE_NUM-1];
reg [Q_WIDTH-1:0] y1_pipe_reg  [0:Y1_PIPE_NUM-1];
reg [Q_WIDTH-1:0] y2_pipe_reg  [0:Y2_PIPE_NUM-1];
reg [Q_WIDTH-1:0] y8_pipe_reg  [0:Y8_PIPE_NUM-1];
reg [Q_WIDTH-1:0] y9_pipe_reg  [0:Y9_PIPE_NUM-1];
reg [Q_WIDTH-1:0] y10_pipe_reg [0:Y10_PIPE_NUM-1];

//---------------------------------------------------------------------
//   Submodule
//--------------------------------------------------------------------
genvar u_mq_montymul_idx;
generate
    for (u_mq_montymul_idx = 0; u_mq_montymul_idx < DIV_STAGE; u_mq_montymul_idx = u_mq_montymul_idx + 1) begin
        MQ_MONTYMUL u_MQ_MONTYMUL (
            // Input signals
            .clk(clk),
            .rst_n(rst_n),
            .in_valid(mult_in_valid[u_mq_montymul_idx]),
            .x(mult_x[u_mq_montymul_idx]),
            .y(mult_y[u_mq_montymul_idx]),
            // Output signals
            .out_valid(mult_out_valid[u_mq_montymul_idx]),
            .z(mult_z[u_mq_montymul_idx])
            );
    end
endgenerate

//---------------------------------------------------------------------
//   Combinational Logic
//--------------------------------------------------------------------
assign mult_in_valid[0] = in_valid_reg;
assign mult_x[0] = y_i_reg;
assign mult_y[0] = R2;
assign mult_y[1] = y[0];
assign mult_y[2] = y0_pipe_reg[1];
assign mult_y[3] = y1_pipe_reg[Y1_PIPE_NUM-1];
assign mult_y[4] = y[3];
assign mult_y[5] = y[4];
assign mult_y[6] = y[5];
assign mult_y[7] = y[6];
assign mult_y[8] = y[7];
assign mult_y[9] = y2_pipe_reg[Y2_PIPE_NUM-1];
assign mult_y[10] = y8_pipe_reg[Y8_PIPE_NUM-1];
assign mult_y[11] = y[10];
assign mult_y[12] = y[11];
assign mult_y[13] = y9_pipe_reg[Y9_PIPE_NUM-1];
assign mult_y[14] = y[13];
assign mult_y[15] = y[14];
assign mult_y[16] = y10_pipe_reg[Y10_PIPE_NUM-1];
assign mult_y[17] = y[16];
assign mult_y[18] = y0_pipe_reg[Y0_PIPE_NUM-1];
assign mult_y[19] = x_pipe_reg[X_PIPE_NUM-1];

genvar mq_montymul_idx;
generate
    for (mq_montymul_idx = 1; mq_montymul_idx < DIV_STAGE; mq_montymul_idx = mq_montymul_idx + 1) begin
        always @(*) begin
            mult_in_valid[mq_montymul_idx] <= mult_out_valid_reg[mq_montymul_idx-1];
            mult_x[mq_montymul_idx] <= y[mq_montymul_idx-1];
        end
    end
endgenerate

assign out_valid = mult_out_valid_reg[DIV_STAGE-1];
assign z_o = y[DIV_STAGE-1];

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        in_valid_reg <= 0;
        x_i_reg <= 0;
        y_i_reg <= 0;
    end
    else begin
        in_valid_reg <= in_valid;
        x_i_reg <= x_i;
        y_i_reg <= y_i;
    end
end

genvar mq_montymul_reg_idx;
generate
    for (mq_montymul_reg_idx = 0; mq_montymul_reg_idx < DIV_STAGE; mq_montymul_reg_idx = mq_montymul_reg_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                mult_out_valid_reg[mq_montymul_reg_idx] <= 0;
                y[mq_montymul_reg_idx] <= 0;
            end
            else begin
                mult_out_valid_reg[mq_montymul_reg_idx] <= mult_out_valid[mq_montymul_reg_idx];
                y[mq_montymul_reg_idx] <= mult_z[mq_montymul_reg_idx];
            end
        end
    end
endgenerate

/*
 * Pipeline Registers
 */
/* x */
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        x_pipe_reg[0] <= 0;
    end
    else begin
        x_pipe_reg[0] <= x_i_reg;
    end
end
genvar x_pipe_reg_idx;
generate
    for (x_pipe_reg_idx = 1; x_pipe_reg_idx < X_PIPE_NUM; x_pipe_reg_idx = x_pipe_reg_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                x_pipe_reg[x_pipe_reg_idx] <= 0;
            end
            else begin
                x_pipe_reg[x_pipe_reg_idx] <= x_pipe_reg[x_pipe_reg_idx-1];
            end
        end
    end
endgenerate

/* y0 */
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        y0_pipe_reg[0] <= 0;
    end
    else begin
        y0_pipe_reg[0] <= y[0];
    end
end
genvar y0_pipe_reg_idx;
generate
    for (y0_pipe_reg_idx = 1; y0_pipe_reg_idx < Y0_PIPE_NUM; y0_pipe_reg_idx = y0_pipe_reg_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                y0_pipe_reg[y0_pipe_reg_idx] <= 0;
            end
            else begin
                y0_pipe_reg[y0_pipe_reg_idx] <= y0_pipe_reg[y0_pipe_reg_idx-1];
            end
        end
    end
endgenerate

/* y1 */
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        y1_pipe_reg[0] <= 0;
    end
    else begin
        y1_pipe_reg[0] <= y[1];
    end
end
genvar y1_pipe_reg_idx;
generate
    for (y1_pipe_reg_idx = 1; y1_pipe_reg_idx < Y1_PIPE_NUM; y1_pipe_reg_idx = y1_pipe_reg_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                y1_pipe_reg[y1_pipe_reg_idx] <= 0;
            end
            else begin
                y1_pipe_reg[y1_pipe_reg_idx] <= y1_pipe_reg[y1_pipe_reg_idx-1];
            end
        end
    end
endgenerate

/* y2 */
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        y2_pipe_reg[0] <= 0;
    end
    else begin
        y2_pipe_reg[0] <= y[2];
    end
end
genvar y2_pipe_reg_idx;
generate
    for (y2_pipe_reg_idx = 1; y2_pipe_reg_idx < Y2_PIPE_NUM; y2_pipe_reg_idx = y2_pipe_reg_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                y2_pipe_reg[y2_pipe_reg_idx] <= 0;
            end
            else begin
                y2_pipe_reg[y2_pipe_reg_idx] <= y2_pipe_reg[y2_pipe_reg_idx-1];
            end
        end
    end
endgenerate

/* y8 */
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        y8_pipe_reg[0] <= 0;
    end
    else begin
        y8_pipe_reg[0] <= y[8];
    end
end
genvar y8_pipe_reg_idx;
generate
    for (y8_pipe_reg_idx = 1; y8_pipe_reg_idx < Y8_PIPE_NUM; y8_pipe_reg_idx = y8_pipe_reg_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                y8_pipe_reg[y8_pipe_reg_idx] <= 0;
            end
            else begin
                y8_pipe_reg[y8_pipe_reg_idx] <= y8_pipe_reg[y8_pipe_reg_idx-1];
            end
        end
    end
endgenerate

/* y9 */
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        y9_pipe_reg[0] <= 0;
    end
    else begin
        y9_pipe_reg[0] <= y[9];
    end
end
genvar y9_pipe_reg_idx;
generate
    for (y9_pipe_reg_idx = 1; y9_pipe_reg_idx < Y9_PIPE_NUM; y9_pipe_reg_idx = y9_pipe_reg_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                y9_pipe_reg[y9_pipe_reg_idx] <= 0;
            end
            else begin
                y9_pipe_reg[y9_pipe_reg_idx] <= y9_pipe_reg[y9_pipe_reg_idx-1];
            end
        end
    end
endgenerate

/* y10 */
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        y10_pipe_reg[0] <= 0;
    end
    else begin
        y10_pipe_reg[0] <= y[10];
    end
end
genvar y10_pipe_reg_idx;
generate
    for (y10_pipe_reg_idx = 1; y10_pipe_reg_idx < Y10_PIPE_NUM; y10_pipe_reg_idx = y10_pipe_reg_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                y10_pipe_reg[y10_pipe_reg_idx] <= 0;
            end
            else begin
                y10_pipe_reg[y10_pipe_reg_idx] <= y10_pipe_reg[y10_pipe_reg_idx-1];
            end
        end
    end
endgenerate

endmodule
