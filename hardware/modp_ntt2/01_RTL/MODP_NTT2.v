`include "RADIX2.v"

/*
 * Compute the NTT over a polynomial (binary case). Polynomial elements
 * are a[0], a[stride], a[2 * stride]...
 */
module MODP_NTT2 #(
    parameter MAX_LOGN = 9
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    a_i,
    logn,
    p,
    p0i,
    s_bus,
    // Output signals
    out_valid,
    a_o,
    tw_idx_bus
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam        P_WIDTH = 31;
localparam     LOGN_WIDTH = 4;
localparam      LUT_SIZE = 1024;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                                       clk;
input                                       rst_n;
input                                       in_valid;
input [P_WIDTH-1:0]                         a_i;
input [LOGN_WIDTH-1:0]                      logn;
input [P_WIDTH-1:0]                         p;
input [P_WIDTH-1:0]                         p0i;
input [MAX_LOGN*P_WIDTH-1:0]                s_bus;

output reg                                  out_valid;
output reg [P_WIDTH-1:0]                    a_o;
output reg [$clog2(LUT_SIZE)*MAX_LOGN-1:0]  tw_idx_bus;


//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg                              in_valid_reg;
reg [P_WIDTH-1:0]                a_i_reg;
reg [LOGN_WIDTH-1:0]             logn_reg;
reg [P_WIDTH-1:0]                p_reg;
reg [P_WIDTH-1:0]                p0i_reg;

reg                              radix_in_valid  [0:MAX_LOGN-1];
reg [P_WIDTH-1:0]                radix_a_i       [0:MAX_LOGN-1];
reg [LOGN_WIDTH-1:0]             logn_i          [0:MAX_LOGN-1];
reg [P_WIDTH-1:0]                p_i             [0:MAX_LOGN-1];
reg [P_WIDTH-1:0]                p0i_i           [0:MAX_LOGN-1];

reg                              radix_out_valid [0:MAX_LOGN-1];
reg [P_WIDTH-1:0]                radix_a_o       [0:MAX_LOGN-1];
reg [LOGN_WIDTH-1:0]             logn_o          [0:MAX_LOGN-1];
reg [P_WIDTH-1:0]                p_o             [0:MAX_LOGN-1];
reg [P_WIDTH-1:0]                p0i_o           [0:MAX_LOGN-1];

reg [P_WIDTH-1:0]                s               [0:MAX_LOGN-1];
reg [$clog2(LUT_SIZE)-1:0]       tw_idx          [0:MAX_LOGN-1];

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
/*
 * The NTT pipeline is constructed by chaining `logn` (9) RADIX2 stages.
 * The output of one stage becomes the input for the next. Each stage `U`
 * receives its own twiddle factor stream.
 */
genvar stage_idx;
generate
    for (stage_idx = 0; stage_idx < MAX_LOGN; stage_idx++) begin
        RADIX2 #(MAX_LOGN, stage_idx)
        u_RADIX2 (
            // Input signals
            .clk(clk), .rst_n(rst_n),
            .in_valid(radix_in_valid[stage_idx]),
            .a_i(radix_a_i[stage_idx]),
            .logn_i(logn_i[stage_idx]),
            .p_i(p_i[stage_idx]), 
            .p0i_i(p0i_i[stage_idx]),
            .s(s[stage_idx]), 
            // Output signals
            .out_valid(radix_out_valid[stage_idx]),
            .a_o(radix_a_o[stage_idx]),
            .logn_o(logn_o[stage_idx]),
            .p_o(p_o[stage_idx]), 
            .p0i_o(p0i_o[stage_idx]),
            .tw_idx(tw_idx[stage_idx])
        );
    end
endgenerate

always @(*) begin
    radix_in_valid[MAX_LOGN-1] = in_valid_reg;
    radix_a_i[MAX_LOGN-1] = a_i_reg;
    logn_i[MAX_LOGN-1] = logn_reg;
    p_i[MAX_LOGN-1] = p_reg;
    p0i_i[MAX_LOGN-1] = p0i_reg;
end

genvar radix_i_idx;
generate
    for (radix_i_idx = 0; radix_i_idx < MAX_LOGN-1; radix_i_idx++) begin
        always @(*) begin
            if (logn == radix_i_idx) begin
                radix_in_valid[radix_i_idx] = in_valid_reg;
                radix_a_i[radix_i_idx] = a_i_reg;
                logn_i[radix_i_idx] = logn_reg;
                p_i[radix_i_idx] = p_reg;
                p0i_i[radix_i_idx] = p0i_reg;
            end
            else begin
                radix_in_valid[radix_i_idx] = radix_out_valid[radix_i_idx+1];
                radix_a_i[radix_i_idx] = radix_a_o[radix_i_idx+1];
                logn_i[radix_i_idx] = logn_o[radix_i_idx+1];
                p_i[radix_i_idx] = p_o[radix_i_idx+1];
                p0i_i[radix_i_idx] = p0i_o[radix_i_idx+1];
            end
        end
    end
endgenerate

genvar s_idx;
generate
    for (s_idx = 0; s_idx < MAX_LOGN; s_idx++) begin
        always @(*) begin
            s[s_idx] = s_bus[P_WIDTH*(s_idx+1)-1:P_WIDTH*s_idx];
        end
    end
endgenerate

assign out_valid = radix_out_valid[0];
assign a_o = radix_a_o[0];

genvar tw_idx_idx;
generate
    for (tw_idx_idx = 0; tw_idx_idx < MAX_LOGN; tw_idx_idx++) begin
        always @(*) begin
            tw_idx_bus[P_WIDTH*(tw_idx_idx+1)-1:P_WIDTH*tw_idx_idx] = tw_idx[tw_idx_idx];
        end
    end
endgenerate


//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        in_valid_reg <= 0;
        a_i_reg <= 0;
        logn_reg <= 0;
        p_reg <= 0;
        p0i_reg <= 0;
    end
    else begin
        in_valid_reg <= in_valid;
        a_i_reg <= a_i;
        logn_reg <= logn;
        p_reg <= p;
        p0i_reg <= p0i;
    end
end

// genvar s_reg_idx;
// generate
//     for (s_reg_idx = 0; s_reg_idx < MAX_LOGN; s_reg_idx++) begin
//         always @(posedge clk or negedge rst_n) begin
//             if (!rst_n) begin
//                 s_reg[s_reg_idx] <= 0;
//             end
//             else begin
//                 s_reg[s_reg_idx] <= s[s_reg_idx];
//             end
//         end
//     end
// endgenerate

endmodule
