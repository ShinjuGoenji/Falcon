/*
 * 
 */
module MODP_MONTYMUL_TOP #(
    parameter MASTER_NUM = 10,
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
input                               clk;
input                               rst_n;
input      [MASTER_NUM-1:0]         in_valid_bus;
input      [P_WIDTH*MASTER_NUM-1:0] a_bus;
input      [P_WIDTH*MASTER_NUM-1:0] b_bus;
input      [P_WIDTH*MASTER_NUM-1:0] p_bus;
input      [P_WIDTH*MASTER_NUM-1:0] p0i_bus;
input      [MASTER_NUM-1:0]         isMQ_bus;
    
output reg [MASTER_NUM-1:0]         out_valid_bus;
output reg [P_WIDTH*MASTER_NUM-1:0] d_bus;
output reg [MASTER_NUM-1:0]         ready_bus;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
logic               in_valid_bus_w  [0:MASTER_NUM-1];
logic [P_WIDTH-1:0] a_bus_w         [0:MASTER_NUM-1];
logic [P_WIDTH-1:0] b_bus_w         [0:MASTER_NUM-1];
logic [P_WIDTH-1:0] p_bus_w         [0:MASTER_NUM-1];
logic [P_WIDTH-1:0] p0i_bus_w       [0:MASTER_NUM-1];
logic               isMQ_bus_w      [0:MASTER_NUM-1];
 
logic                        i_valid [0:MUL_NUM-1];
logic [P_WIDTH-1:0]          a       [0:MUL_NUM-1];
logic [P_WIDTH-1:0]          b       [0:MUL_NUM-1];
logic [P_WIDTH-1:0]          p       [0:MUL_NUM-1];
logic [P_WIDTH-1:0]          p0i     [0:MUL_NUM-1];
logic                        isMQ    [0:MUL_NUM-1];
logic [$clog2(MASTER_NUM):0] i_bus   [0:MUL_NUM-1];

logic                        o_valid [0:MUL_NUM-1];
logic [P_WIDTH-1:0]          d       [0:MUL_NUM-1];
logic [$clog2(MASTER_NUM):0] o_bus   [0:MUL_NUM-1];

logic                     grant [0:MASTER_NUM-1];
logic [$clog2(MUL_NUM):0] instance_cnt;

logic               out_valid_bus_comb [0:MASTER_NUM-1];
logic [P_WIDTH-1:0] d_bus_comb [0:MASTER_NUM-1];

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
genvar modp_montymul_idx;
generate
    for (modp_montymul_idx = 0; modp_montymul_idx < MUL_NUM; modp_montymul_idx = modp_montymul_idx + 1) begin
        MODP_MONTYMUL #(.MASTER_NUM(MASTER_NUM)) u_MODP_MONTYMUL (
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
    for (i_bus_idx = 0; i_bus_idx < MASTER_NUM; i_bus_idx = i_bus_idx + 1) begin
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
always_comb begin : ARBITER
    for (j = 0; j < MUL_NUM; j = j + 1) begin
        i_valid[j] = 1'b0;
        a[j] = {P_WIDTH{1'b0}};
        b[j] = {P_WIDTH{1'b0}};
        p[j] = {P_WIDTH{1'b0}};
        p0i[j] = {P_WIDTH{1'b0}};
        isMQ[j] = 1'b0;
        i_bus[j] = 0;
    end
    for (i = 0; i < MASTER_NUM; i = i + 1) begin
        grant[i] = 1'b0;
        ready_bus[i] = 1'b1;
    end
    for (j = 0; j < MUL_NUM; j = j + 1) begin
        for (i = 0; i < MASTER_NUM; i = i + 1) begin
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
    instance_cnt = MUL_NUM;
    for (i = 0; i < MASTER_NUM; i = i + 1) begin
        if (i >= MUL_NUM && instance_cnt == 0) begin
            ready_bus[i] = 1'b0;
        end
        if (in_valid_bus_w[i] && grant[i]) begin
            instance_cnt = instance_cnt - 1;
        end
    end
end

/*
 * Map kernel to bus
 */
always_comb begin
    for (i = 0; i < MASTER_NUM; i = i + 1) begin
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
    for (o_bus_idx = 0; o_bus_idx < MASTER_NUM; o_bus_idx = o_bus_idx + 1) begin
        always_comb begin
            out_valid_bus[o_bus_idx] = out_valid_bus_comb[o_bus_idx];
            d_bus[P_WIDTH*(o_bus_idx+1)-1 -: P_WIDTH] = d_bus_comb[o_bus_idx];
        end
    end
endgenerate

endmodule

/*
 * Montgomery multiplication modulo p. The 'p0i' value is -1/p mod 2^31.
 * It is required that p is an odd integer.
 */
module MODP_MONTYMUL #(
    parameter MASTER_NUM = 1
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    a,
    b,
    p,
    p0i,
    isMQ,
    i_bus,
    // Output signals
    out_valid,
    d,
    o_bus
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam P_WIDTH = 31;
localparam Q_WIDTH = 16;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                clk;
input                rst_n;
input                in_valid;
input  [P_WIDTH-1:0] a;
input  [P_WIDTH-1:0] b;
input  [P_WIDTH-1:0] p;
input  [P_WIDTH-1:0] p0i;
input                isMQ;
input  [$clog2(MASTER_NUM):0] i_bus;
    
output reg               out_valid;
output reg [P_WIDTH-1:0] d;
output reg [$clog2(MASTER_NUM):0] o_bus;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
logic [P_WIDTH-1:0]          p_reg;
logic                        isMQ_reg;
logic [P_WIDTH*2-1:0]        a_b;
logic [P_WIDTH*2-1:0]        a_b_reg;
logic [P_WIDTH-1:0]          a_b_p0i;
logic [P_WIDTH-1:0]          a_b_p0i_reg;
logic [P_WIDTH+Q_WIDTH-1:0]  w_q;
logic [P_WIDTH*2-1:0]        w_p;
logic [P_WIDTH*2:0]          z_w_q;
logic [P_WIDTH*2:0]          z_w_p;
logic [P_WIDTH:0]            z_w_q_shift;
logic [P_WIDTH:0]            z_w_p_shift;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
assign a_b = a * b;
assign a_b_p0i = a_b * p0i;
assign w_q = a_b_p0i_reg[Q_WIDTH-1:0] * p_reg;
assign w_p = a_b_p0i_reg[P_WIDTH-1:0] * p_reg;

assign z_w_q = a_b_reg + w_q;
assign z_w_p = a_b_reg + w_p;
assign z_w_q_shift = z_w_q[P_WIDTH*2:Q_WIDTH];
assign z_w_p_shift = z_w_p[P_WIDTH*2:P_WIDTH];

always_comb begin
    if (isMQ_reg) begin
        if (z_w_q_shift >= p_reg)
            d = z_w_q_shift - p_reg;
        else
            d = z_w_q_shift;
    end
    else begin
        if (z_w_p_shift >= p_reg)
            d = z_w_p_shift - p_reg;
        else
            d = z_w_p_shift;
    end
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        p_reg <= 0;
        isMQ_reg <= 0;
        out_valid <= 0;
        a_b_reg <= 0;
        a_b_p0i_reg <= 0;
        o_bus <= 0;
    end
    else begin
        p_reg <= p;
        isMQ_reg <= isMQ;
        out_valid <= in_valid;
        a_b_reg <= a_b;
        a_b_p0i_reg <= a_b_p0i;
        o_bus <= i_bus;
    end
end

endmodule
