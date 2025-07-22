`include "RADIX2.v"

module FFT #(
    parameter   FLOAT_PRECISION = 64,
    parameter   logn = 8
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    fi_re,
    fi_im,
    s_re_0,
    s_im_0,
    // Output signals
    out_valid,
    tw_idx_0,
    fo_re,
    fo_im
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                        clk;
input                        rst_n;
input                        in_valid;
input  [FLOAT_PRECISION-1:0] fi_re;
input  [FLOAT_PRECISION-1:0] fi_im;
input  [FLOAT_PRECISION-1:0] s_re_0;
input  [FLOAT_PRECISION-1:0] s_im_0;

output reg                   out_valid;
output reg [logn:0]          tw_idx_0;
output [FLOAT_PRECISION-1:0] fo_re;
output [FLOAT_PRECISION-1:0] fo_im;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg in_valid_reg;
reg [FLOAT_PRECISION-1:0] fi_re_reg;
reg [FLOAT_PRECISION-1:0] fi_im_reg;
reg [FLOAT_PRECISION-1:0] s_re_0_reg;
reg [FLOAT_PRECISION-1:0] s_im_0_reg;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
RADIX2 #(FLOAT_PRECISION, logn, 1)
u_stage_1 (
    // Input signals
    .clk(clk), .rst_n(rst_n),
    .in_valid(in_valid_reg),
    .di_re(fi_re_reg), .di_im(fi_im_reg),
    .s_re(s_re_0_reg), .s_im(s_im_0_reg),
    // Output signals
    .tw_idx(tw_idx_0),
    .out_valid(out_valid),
    .do_re(fo_re), .do_im(fo_im)
);

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        in_valid_reg <= 0;
        fi_re_reg <= 0;
        fi_im_reg <= 0;
        s_re_0_reg <= 0;
        s_im_0_reg <= 0;
    end
    else begin
        in_valid_reg <= in_valid;
        fi_re_reg <= fi_re;
        fi_im_reg <= fi_im;
        s_re_0_reg <= s_re_0;
        s_im_0_reg <= s_im_0;
    end
end

endmodule
