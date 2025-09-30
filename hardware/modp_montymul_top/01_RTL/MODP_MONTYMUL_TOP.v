`include "MODP_MONTYMUL.v"

/*
 * 
 */
module MODP_MONTYMUL_TOP #(
    parameter BUS_WIDTH = 10,
    parameter MUL_NUM = 2
)(
    // Input signals
    clk,
    rst_n,
    in_valid_bus,
    a_bus,
    b_bus,
    p_bus,
    p0i_bus,
    isMQ_bus,
    // Output signals
    out_valid_bus,
    d_bus,
    ready_bus
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam P_WIDTH = 31;

integer i, j;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                              clk;
input                              rst_n;
input      [BUS_WIDTH-1:0]         in_valid_bus;
input      [P_WIDTH*BUS_WIDTH-1:0] a_bus;
input      [P_WIDTH*BUS_WIDTH-1:0] b_bus;
input      [P_WIDTH*BUS_WIDTH-1:0] p_bus;
input      [P_WIDTH*BUS_WIDTH-1:0] p0i_bus;
input      [BUS_WIDTH-1:0]         isMQ_bus;
    
output reg [BUS_WIDTH-1:0]         out_valid_bus;
output reg [P_WIDTH*BUS_WIDTH-1:0] d_bus;
output reg [BUS_WIDTH-1:0]         ready_bus;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire               in_valid_bus_w  [0:BUS_WIDTH-1];
wire [P_WIDTH-1:0] a_bus_w         [0:BUS_WIDTH-1];
wire [P_WIDTH-1:0] b_bus_w         [0:BUS_WIDTH-1];
wire [P_WIDTH-1:0] p_bus_w         [0:BUS_WIDTH-1];
wire [P_WIDTH-1:0] p0i_bus_w       [0:BUS_WIDTH-1];
wire               isMQ_bus_w      [0:BUS_WIDTH-1];

reg               i_valid [0:MUL_NUM-1];
reg [P_WIDTH-1:0] a       [0:MUL_NUM-1];
reg [P_WIDTH-1:0] b       [0:MUL_NUM-1];
reg [P_WIDTH-1:0] p       [0:MUL_NUM-1];
reg [P_WIDTH-1:0] p0i     [0:MUL_NUM-1];
reg               isMQ    [0:MUL_NUM-1];
reg               o_valid [0:MUL_NUM-1];
reg [P_WIDTH-1:0] d       [0:MUL_NUM-1];

reg grant [0:BUS_WIDTH-1];
reg [$clog2(MUL_NUM):0] mul_cnt;
reg [$clog2(BUS_WIDTH):0] i_bus [0:MUL_NUM-1], o_bus [0:MUL_NUM-1];

reg               out_valid_bus_comb [0:BUS_WIDTH-1];
reg [P_WIDTH-1:0] d_bus_comb [0:BUS_WIDTH-1];

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
genvar modp_montymul_idx;
generate
    for (modp_montymul_idx = 0; modp_montymul_idx < MUL_NUM; modp_montymul_idx = modp_montymul_idx + 1) begin
        MODP_MONTYMUL #(.BUS_WIDTH(BUS_WIDTH)) u_MODP_MONTYMUL (
            // Input signals
            .clk(clk),
            .rst_n(rst_n),
            .in_valid(i_valid[modp_montymul_idx]),
            .a(a[modp_montymul_idx]),
            .b(b[modp_montymul_idx]),
            .p(p[modp_montymul_idx]),
            .p0i(p0i[modp_montymul_idx]),
            .isMQ(isMQ[modp_montymul_idx]),
            .i_bus(i_bus[modp_montymul_idx]),
            // Output signals
            .out_valid(o_valid[modp_montymul_idx]),
            .d(d[modp_montymul_idx]),
            .o_bus(o_bus[modp_montymul_idx])
            );
    end
endgenerate

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * Unpack input bus
 */
genvar i_bus_idx;
generate
    for (i_bus_idx = 0; i_bus_idx < BUS_WIDTH; i_bus_idx = i_bus_idx + 1) begin
        assign in_valid_bus_w[i_bus_idx] = in_valid_bus[i_bus_idx];
        assign a_bus_w[i_bus_idx]        = a_bus[P_WIDTH*(i_bus_idx+1)-1 -: P_WIDTH];
        assign b_bus_w[i_bus_idx]        = b_bus[P_WIDTH*(i_bus_idx+1)-1 -: P_WIDTH];
        assign p_bus_w[i_bus_idx]        = p_bus[P_WIDTH*(i_bus_idx+1)-1 -: P_WIDTH];
        assign p0i_bus_w[i_bus_idx]      = p0i_bus[P_WIDTH*(i_bus_idx+1)-1 -: P_WIDTH];
        assign isMQ_bus_w[i_bus_idx]     = isMQ_bus[i_bus_idx];
    end
endgenerate

/*
 * Arbiter
 */
always @(*) begin : ARBITER
    for (j = 0; j < MUL_NUM; j = j + 1) begin
        i_valid[j] = 1'b0;
        a[j] = {P_WIDTH{1'b0}};
        b[j] = {P_WIDTH{1'b0}};
        p[j] = {P_WIDTH{1'b0}};
        p0i[j] = {P_WIDTH{1'b0}};
        isMQ[j] = 1'b0;
        i_bus[j] = 0;
    end
    for (i = 0; i < BUS_WIDTH; i = i + 1) begin
        grant[i] = 1'b0;
        ready_bus[i] = 1'b1;
    end
    for (j = 0; j < MUL_NUM; j = j + 1) begin
        for (i = 0; i < BUS_WIDTH; i = i + 1) begin
            if (in_valid_bus_w[i] && ~grant[i]) begin
                i_valid[j] = in_valid_bus_w[i];
                a[j]       = a_bus_w[i];
                b[j]       = b_bus_w[i];
                p[j]       = p_bus_w[i];
                p0i[j]     = p0i_bus_w[i];
                isMQ[j]    = isMQ_bus_w[i];
                grant[i]   = 1'b1;
                i_bus[j] = i;
                break;
            end
        end
    end
    mul_cnt = MUL_NUM;
    for (i = 0; i < BUS_WIDTH; i = i + 1) begin
        if (i >= MUL_NUM && mul_cnt == 0) begin
            ready_bus[i] = 1'b0;
        end
        if (in_valid_bus_w[i] && grant[i]) begin
            mul_cnt = mul_cnt - 1;
        end
    end
end

/*
 * Map kernel to bus
 */
always @(*) begin
    for (i = 0; i < BUS_WIDTH; i = i + 1) begin
        out_valid_bus_comb[i] = 0;
        d_bus_comb[i] = 0;
    end
    for (j = 0; j < MUL_NUM; j = j + 1) begin
        if (o_valid[j]) begin
            out_valid_bus_comb[o_bus[j]] = o_valid[j];
            d_bus_comb[o_bus[j]] = d[j];
        end
    end
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
genvar o_bus_idx;
generate
    for (o_bus_idx = 0; o_bus_idx < BUS_WIDTH; o_bus_idx = o_bus_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                out_valid_bus[o_bus_idx] <= 0;
                d_bus[P_WIDTH*(o_bus_idx+1)-1 -: P_WIDTH] <= 0;
            end
            else begin
                out_valid_bus[o_bus_idx] <= out_valid_bus_comb[o_bus_idx];
                d_bus[P_WIDTH*(o_bus_idx+1)-1 -: P_WIDTH] <= d_bus_comb[o_bus_idx];
            end
        end
    end
endgenerate


endmodule
