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
input                              clk;
input                              rst_n;
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
//   Reg & Wire
//---------------------------------------------------------------------
wire               in_valid_bus_w  [0:MASTER_NUM-1];
wire [P_WIDTH-1:0] a_bus_w         [0:MASTER_NUM-1];
wire [P_WIDTH-1:0] b_bus_w         [0:MASTER_NUM-1];
wire [P_WIDTH-1:0] p_bus_w         [0:MASTER_NUM-1];
wire [P_WIDTH-1:0] p0i_bus_w       [0:MASTER_NUM-1];
wire               isMQ_bus_w      [0:MASTER_NUM-1];

reg                       i_valid [0:MUL_NUM-1];
reg [P_WIDTH-1:0]         a       [0:MUL_NUM-1];
reg [P_WIDTH-1:0]         b       [0:MUL_NUM-1];
reg [P_WIDTH-1:0]         p       [0:MUL_NUM-1];
reg [P_WIDTH-1:0]         p0i     [0:MUL_NUM-1];
reg                       isMQ    [0:MUL_NUM-1];
reg [$clog2(MASTER_NUM):0] i_bus   [0:MUL_NUM-1];

wire                       o_valid [0:MUL_NUM-1];
wire [P_WIDTH-1:0]         d       [0:MUL_NUM-1];
wire [$clog2(MASTER_NUM):0] o_bus   [0:MUL_NUM-1];

reg grant [0:MASTER_NUM-1];
reg [$clog2(MUL_NUM):0] instance_cnt;

reg               out_valid_bus_comb [0:MASTER_NUM-1];
reg [P_WIDTH-1:0] d_bus_comb [0:MASTER_NUM-1];

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
always @(*) begin
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
        always @(*) begin
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
// module MODP_MONTYMUL #(
//     parameter MASTER_NUM = 1
// )(
//     // Input signals
//     clk,
//     rst_n,
//     in_valid,
//     a,
//     b,
//     p,
//     p0i,
//     isMQ,
//     i_bus,
//     // Output signals
//     out_valid,
//     d,
//     o_bus
// );

// //---------------------------------------------------------------------
// //   Parameter & Integer
// //---------------------------------------------------------------------
// localparam P_WIDTH = 31;
// localparam Q_WIDTH = 16;

// //---------------------------------------------------------------------
// //   Input & Output
// //---------------------------------------------------------------------
// input                         clk;
// input                         rst_n;
// input                         in_valid;
// input  [P_WIDTH-1:0]          a;
// input  [P_WIDTH-1:0]          b;
// input  [P_WIDTH-1:0]          p;
// input  [P_WIDTH-1:0]          p0i;
// input                         isMQ;
// input  [$clog2(MASTER_NUM):0] i_bus;
    
// output reg                        out_valid;
// output reg [P_WIDTH-1:0]          d;
// output reg [$clog2(MASTER_NUM):0] o_bus;

// //---------------------------------------------------------------------
// //   Reg & Wire
// //---------------------------------------------------------------------
// /*
//  * pipeline registers 
//  */
// reg  [P_WIDTH-1:0]          a_reg, b_reg;
// reg  [P_WIDTH-1:0]          p_reg0, p_reg1, p_reg2, p_reg3;
// reg  [P_WIDTH-1:0]          p0i_reg0, p0i_reg1;
// reg                         isMQ_reg0, isMQ_reg1, isMQ_reg2, isMQ_reg3;
// reg                         in_valid_reg0, in_valid_reg1, in_valid_reg2;
// reg  [$clog2(MASTER_NUM):0] i_bus_reg0, i_bus_reg1, i_bus_reg2;
// reg  [P_WIDTH*2-1:0]        a_b_0, a_b_1, a_b_2;
// reg  [P_WIDTH-1:0]          a_b_p0i;
// reg  [P_WIDTH+Q_WIDTH-1:0]  w_q;
// reg  [P_WIDTH*2-1:0]        w_p;

// wire [P_WIDTH*2-1:0]        a_b_comb;
// wire [P_WIDTH-1:0]          a_b_p0i_comb;
// wire [P_WIDTH+Q_WIDTH-1:0]  w_q_comb;
// wire [P_WIDTH*2-1:0]        w_p_comb;
// wire [P_WIDTH*2:0]          z_w_q;
// wire [P_WIDTH*2:0]          z_w_p;
// wire [P_WIDTH:0]            z_w_q_shift;
// wire [P_WIDTH:0]            z_w_p_shift;

// //---------------------------------------------------------------------
// //   Combinational Logic
// //---------------------------------------------------------------------
// /*
//  * stage 1 
//  */
// assign a_b_comb = a_reg * b_reg;

// /*
//  * stage 2
//  */
// assign a_b_p0i_comb = a_b_0 * p0i_reg1;

// /*
//  * stage 3
//  */
// assign w_q_comb = a_b_p0i[Q_WIDTH-1:0] * p_reg2;
// assign w_p_comb = a_b_p0i[P_WIDTH-1:0] * p_reg2;

// /*
//  * stage 4
//  */
// assign z_w_q = a_b_2 + w_q;
// assign z_w_p = a_b_2 + w_p;
// assign z_w_q_shift = z_w_q[P_WIDTH*2:Q_WIDTH];
// assign z_w_p_shift = z_w_p[P_WIDTH*2:P_WIDTH];

// always @(*) begin
//     if (isMQ_reg3) begin
//         if (z_w_q_shift >= p_reg3)
//             d = z_w_q_shift - p_reg3;
//         else
//             d = z_w_q_shift;
//     end
//     else begin
//         if (z_w_p_shift >= p_reg3)
//             d = z_w_p_shift - p_reg3;
//         else
//             d = z_w_p_shift;
//     end
// end

// //---------------------------------------------------------------------
// //   Sequential Logic
// //---------------------------------------------------------------------
// /*
//  * stage 1 registers
//  */
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         a_reg <= 0;
//         b_reg <= 0;
//         p_reg0 <= 0;
//         p0i_reg0 <= 0;
//         isMQ_reg0 <= 0;
//         in_valid_reg0 <= 0;
//         i_bus_reg0 <= 0;
//     end
//     else begin
//         a_reg <= a;
//         b_reg <= b;
//         p_reg0 <= p;
//         p0i_reg0 <= p0i;
//         isMQ_reg0 <= isMQ;
//         in_valid_reg0 <= in_valid;
//         i_bus_reg0 <= i_bus;
//     end
// end

// /*
//  * stage 2 registers
//  */
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         p_reg1 <= 0;
//         p0i_reg1 <= 0;
//         isMQ_reg1 <= 0;
//         in_valid_reg1 <= 0;
//         a_b_0 <= 0;
//         i_bus_reg1 <= 0;
//     end
//     else begin
//         p_reg1 <= p_reg0;
//         p0i_reg1 <= p0i_reg0;
//         isMQ_reg1 <= isMQ_reg0;
//         in_valid_reg1 <= in_valid_reg0;
//         a_b_0 <= a_b_comb;
//         i_bus_reg1 <= i_bus_reg0;
//     end
// end

// /*
//  * stage 3 registers
//  */
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         p_reg2 <= 0;
//         isMQ_reg2 <= 0;
//         in_valid_reg2 <= 0;
//         a_b_1 <= 0;
//         a_b_p0i <= 0;
//         i_bus_reg2 <= 0;
//     end
//     else begin
//         p_reg2 <= p_reg1;
//         isMQ_reg2 <= isMQ_reg1;
//         in_valid_reg2 <= in_valid_reg1;
//         a_b_1 <= a_b_0;
//         a_b_p0i <= a_b_p0i_comb;
//         i_bus_reg2 <= i_bus_reg1;
//     end
// end

// /*
//  * stage 4 registers
//  */
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         p_reg3 <= 0;
//         isMQ_reg3 <= 0;
//         out_valid <= 0;
//         a_b_2 <= 0;
//         w_q <= 0;
//         w_p <= 0;
//         o_bus <= 0;
//     end
//     else begin
//         p_reg3 <= p_reg2;
//         isMQ_reg3 <= isMQ_reg2;
//         out_valid <= in_valid_reg2;
//         a_b_2 <= a_b_1;
//         w_q <= w_q_comb;
//         w_p <= w_p_comb;
//         o_bus <= i_bus_reg2;
//     end
// end

// endmodule
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
//   Reg & Wire
//---------------------------------------------------------------------
reg  [P_WIDTH-1:0]          p_reg;
reg                         isMQ_reg;
wire [P_WIDTH*2-1:0]        a_b;
reg  [P_WIDTH*2-1:0]        a_b_reg;
wire [P_WIDTH-1:0]          a_b_p0i;
reg  [P_WIDTH-1:0]          a_b_p0i_reg;
wire [P_WIDTH+Q_WIDTH-1:0]  w_q;
wire [P_WIDTH*2-1:0]        w_p;
wire [P_WIDTH*2:0]          z_w_q;
wire [P_WIDTH*2:0]          z_w_p;
wire [P_WIDTH:0]            z_w_q_shift;
wire [P_WIDTH:0]            z_w_p_shift;

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

always @(*) begin
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
always @(posedge clk or negedge rst_n) begin
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
