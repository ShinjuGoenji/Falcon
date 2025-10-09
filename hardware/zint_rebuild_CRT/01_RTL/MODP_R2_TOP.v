`include "MODP_ADD.v"

/*
 * 
 */
module MODP_R2_TOP #(
    parameter MASTER_NUM = 10,
    parameter R2_NUM = 1
)(
    // Input signals
    clk,
    rst_n,
    in_valid_bus,
    p_bus,
    p0i_bus,
    // Output signals
    out_valid_bus,
    R2_bus,
    ready_bus,
    // MODP_MONTYMUL_TOP
    // Input signals
    out_valid_modp_montymul_bus,
    d_modp_montymul_bus,
    ready_modp_montymul_bus,
    // Output signals
    in_valid_modp_montymul_bus,
    a_modp_montymul_bus,
    b_modp_montymul_bus,
    p_modp_montymul_bus,
    p0i_modp_montymul_bus,
    isMQ_modp_montymul_bus
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam P_WIDTH = 31;

integer i, j;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
/*
 * Main channel
 */
input                              clk;
input                              rst_n;
input      [MASTER_NUM-1:0]         in_valid_bus;
input      [P_WIDTH*MASTER_NUM-1:0] p_bus;
input      [P_WIDTH*MASTER_NUM-1:0] p0i_bus;
    
output reg [MASTER_NUM-1:0]         out_valid_bus;
output reg [P_WIDTH*MASTER_NUM-1:0] R2_bus;
output reg [MASTER_NUM-1:0]         ready_bus;

/*
 * MODP_MONTYMUL_TOP
 */
input      [R2_NUM-1:0]         out_valid_modp_montymul_bus;
input      [P_WIDTH*R2_NUM-1:0] d_modp_montymul_bus;
input      [R2_NUM-1:0]         ready_modp_montymul_bus;

output reg [R2_NUM-1:0]         in_valid_modp_montymul_bus;
output reg [P_WIDTH*R2_NUM-1:0] a_modp_montymul_bus;
output reg [P_WIDTH*R2_NUM-1:0] b_modp_montymul_bus;
output reg [P_WIDTH*R2_NUM-1:0] p_modp_montymul_bus;
output reg [P_WIDTH*R2_NUM-1:0] p0i_modp_montymul_bus;
output reg [R2_NUM-1:0]         isMQ_modp_montymul_bus;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire               in_valid_bus_w  [0:MASTER_NUM-1];
wire [P_WIDTH-1:0] p_bus_w         [0:MASTER_NUM-1];
wire [P_WIDTH-1:0] p0i_bus_w       [0:MASTER_NUM-1];

reg                        i_valid [0:R2_NUM-1];
reg [P_WIDTH-1:0]          p       [0:R2_NUM-1];
reg [P_WIDTH-1:0]          p0i     [0:R2_NUM-1];
reg [$clog2(MASTER_NUM):0] i_bus   [0:R2_NUM-1];

wire                        o_valid [0:R2_NUM-1];
wire [P_WIDTH-1:0]          R2      [0:R2_NUM-1];
wire [$clog2(MASTER_NUM):0] o_bus   [0:R2_NUM-1];

reg grant [0:MASTER_NUM-1];
reg [$clog2(R2_NUM):0] instance_cnt;
reg busy [0:R2_NUM-1], busy_comb [0:R2_NUM-1];

reg               out_valid_bus_comb [0:MASTER_NUM-1];
reg [P_WIDTH-1:0] R2_bus_comb [0:MASTER_NUM-1];

reg               out_valid_modp_montymul [0:R2_NUM-1];
reg [P_WIDTH-1:0] d_modp_montymul         [0:R2_NUM-1];
reg               ready_modp_montymul     [0:R2_NUM-1];

reg               in_valid_modp_montymul  [0:R2_NUM-1];
reg [P_WIDTH-1:0] a_modp_montymul         [0:R2_NUM-1];
reg [P_WIDTH-1:0] b_modp_montymul         [0:R2_NUM-1];
reg [P_WIDTH-1:0] p_modp_montymul         [0:R2_NUM-1];
reg [P_WIDTH-1:0] p0i_modp_montymul       [0:R2_NUM-1];
reg               isMQ_modp_montymul      [0:R2_NUM-1];
//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
genvar modp_R2_idx;
generate
    for (modp_R2_idx = 0; modp_R2_idx < R2_NUM; modp_R2_idx = modp_R2_idx + 1) begin
        MODP_R2 #(.MASTER_NUM(MASTER_NUM)) u_MODP_R2 (
            // Main channel
            // Input signals
            .clk(clk),
            .rst_n(rst_n),
            .in_valid(i_valid[modp_R2_idx]),
            .p(p[modp_R2_idx]),
            .p0i(p0i[modp_R2_idx]),
            .i_bus(i_bus[modp_R2_idx]),
            // Output signals
            .out_valid(o_valid[modp_R2_idx]),
            .R2(R2[modp_R2_idx]),
            .o_bus(o_bus[modp_R2_idx]),
            // MODP_MONTYMUL_TOP
            // Input signals
            .out_valid_modp_montymul(out_valid_modp_montymul[modp_R2_idx]),
            .d_modp_montymul(d_modp_montymul[modp_R2_idx]),
            .ready_modp_montymul(ready_modp_montymul[modp_R2_idx]),
            // Output signals
            .in_valid_modp_montymul(in_valid_modp_montymul[modp_R2_idx]),
            .a_modp_montymul(a_modp_montymul[modp_R2_idx]),
            .b_modp_montymul(b_modp_montymul[modp_R2_idx]),
            .p_modp_montymul(p_modp_montymul[modp_R2_idx]),
            .p0i_modp_montymul(p0i_modp_montymul[modp_R2_idx]),
            .isMQ_modp_montymul(isMQ_modp_montymul[modp_R2_idx])
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
        assign p_bus_w[i_bus_idx]        = p_bus[P_WIDTH*(i_bus_idx+1)-1 -: P_WIDTH];
        assign p0i_bus_w[i_bus_idx]      = p0i_bus[P_WIDTH*(i_bus_idx+1)-1 -: P_WIDTH];
    end
endgenerate

genvar i_modp_R2_idx;
generate
    for (i_modp_R2_idx = 0; i_modp_R2_idx < R2_NUM; i_modp_R2_idx = i_modp_R2_idx + 1) begin
        always @(*) begin
            out_valid_modp_montymul[i_modp_R2_idx] = out_valid_modp_montymul_bus[i_modp_R2_idx];
            d_modp_montymul[i_modp_R2_idx] = d_modp_montymul_bus[P_WIDTH*(i_modp_R2_idx+1)-1 -: P_WIDTH];
            ready_modp_montymul[i_modp_R2_idx] = ready_modp_montymul_bus[i_modp_R2_idx];
            in_valid_modp_montymul_bus[i_modp_R2_idx] = in_valid_modp_montymul[i_modp_R2_idx];
            a_modp_montymul_bus[P_WIDTH*(i_modp_R2_idx+1)-1 -: P_WIDTH] = a_modp_montymul[i_modp_R2_idx];
            b_modp_montymul_bus[P_WIDTH*(i_modp_R2_idx+1)-1 -: P_WIDTH] = b_modp_montymul[i_modp_R2_idx];
            p_modp_montymul_bus[P_WIDTH*(i_modp_R2_idx+1)-1 -: P_WIDTH] = p_modp_montymul[i_modp_R2_idx];
            p0i_modp_montymul_bus[P_WIDTH*(i_modp_R2_idx+1)-1 -: P_WIDTH] = p0i_modp_montymul[i_modp_R2_idx];
            isMQ_modp_montymul_bus[i_modp_R2_idx] = isMQ_modp_montymul[i_modp_R2_idx];
        end
    end
endgenerate

/*
 * Arbiter
 */
always @(*) begin : ARBITER
    for (j = 0; j < R2_NUM; j = j + 1) begin
        i_valid[j] = 1'b0;
        p[j] = {P_WIDTH{1'b0}};
        p0i[j] = {P_WIDTH{1'b0}};
        i_bus[j] = 0;
    end
    for (i = 0; i < MASTER_NUM; i = i + 1) begin
        grant[i] = 1'b0;
        ready_bus[i] = 1'b1;
    end
    for (j = 0; j < R2_NUM; j = j + 1) begin
        for (i = 0; i < MASTER_NUM; i = i + 1) begin
            if (in_valid_bus_w[i] && !grant[i]) begin
                i_valid[j] = in_valid_bus_w[i];
                p[j]       = p_bus_w[i];
                p0i[j]     = p0i_bus_w[i];
                grant[i]   = 1'b1;
                i_bus[j] = i;
                break;
            end
        end
    end
    instance_cnt = R2_NUM;
    for (j = 0; j < R2_NUM; j = j + 1) begin
        if (busy[j]) begin
            instance_cnt = instance_cnt - 1;
        end
    end
    for (i = 0; i < MASTER_NUM; i = i + 1) begin
        if (i >= R2_NUM && instance_cnt == 0) begin
            ready_bus[i] = 1'b0;
        end
        if (in_valid_bus_w[i] && grant[i] && instance_cnt > 0) begin
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
        R2_bus_comb[i] = 0;
    end
    for (j = 0; j < R2_NUM; j = j + 1) begin
        if (o_valid[j]) begin
            out_valid_bus_comb[o_bus[j]] = o_valid[j];
            R2_bus_comb[o_bus[j]] = R2[j];
        end
    end
end

/*
 * Busy signal
 */
genvar busy_comb_idx;
generate
    for (busy_comb_idx = 0; busy_comb_idx < R2_NUM; busy_comb_idx = busy_comb_idx + 1) begin
        always @(*) begin
            if (i_valid[busy_comb_idx])
                busy_comb[busy_comb_idx] = 1;
            else if (o_valid[busy_comb_idx])
                busy_comb[busy_comb_idx] = 0;
            else
                busy_comb[busy_comb_idx] = busy[busy_comb_idx];
        end
    end
endgenerate

/*
 * Output
 */
genvar o_bus_idx;
generate
    for (o_bus_idx = 0; o_bus_idx < MASTER_NUM; o_bus_idx = o_bus_idx + 1) begin
        always @(*) begin
            out_valid_bus[o_bus_idx] = out_valid_bus_comb[o_bus_idx];
            R2_bus[P_WIDTH*(o_bus_idx+1)-1 -: P_WIDTH] = R2_bus_comb[o_bus_idx];
        end
    end
endgenerate

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
genvar busy_idx;
generate
    for (busy_idx = 0; busy_idx < R2_NUM; busy_idx = busy_idx + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                busy[busy_idx] <= 0;
            end
            else begin
                busy[busy_idx] <= busy_comb[busy_idx];
            end
        end
    end
endgenerate

endmodule

/*
 * Compute R2 = 2^62 mod p.
 */
module MODP_R2 #(parameter MASTER_NUM = 10) (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    p,
    p0i,
    i_bus,
    // Output signals
    out_valid,
    R2,
    o_bus,
    // MODP_MONTYMUL_TOP
    // Input signals
    out_valid_modp_montymul,
    d_modp_montymul,
    ready_modp_montymul,
    // Output signals
    in_valid_modp_montymul,
    a_modp_montymul,
    b_modp_montymul,
    p_modp_montymul,
    p0i_modp_montymul,
    isMQ_modp_montymul
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam P_WIDTH = 31;

localparam S_IDLE = 0;
localparam S_EXE = 1;
localparam S_OUTPUT = 6;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
/*
 * Main channel
 */
input                             clk;
input                             rst_n;
input                             in_valid;
input      [P_WIDTH-1:0]          p;
input      [P_WIDTH-1:0]          p0i;
input      [$clog2(MASTER_NUM):0] i_bus;

output reg                        out_valid;
output reg [P_WIDTH-1:0]          R2;
output reg [$clog2(MASTER_NUM):0] o_bus;

/*
 * MODP_MONTYMUL_TOP
 */
input                    out_valid_modp_montymul;
input      [P_WIDTH-1:0] d_modp_montymul;
input                    ready_modp_montymul;

output reg           in_valid_modp_montymul;
output [P_WIDTH-1:0] a_modp_montymul;
output [P_WIDTH-1:0] b_modp_montymul;
output [P_WIDTH-1:0] p_modp_montymul;
output [P_WIDTH-1:0] p0i_modp_montymul;
output               isMQ_modp_montymul;


//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg [P_WIDTH-1:0] p_reg, p_comb;
reg [P_WIDTH-1:0] p0i_reg, p0i_comb;

reg [P_WIDTH-1:0] z0;
reg [P_WIDTH-1:0] z1;
reg [P_WIDTH-1:0] z, next_z;

reg state, next_state;
reg [2:0] cnt, next_cnt;

reg next_out_valid;
reg [P_WIDTH-1:0] next_R2;

reg in_valid_modp_montymul_comb;
reg [$clog2(MASTER_NUM):0] o_bus_comb;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
/*
 * Compute z = 2^31 mod p (this is the value 1 in Montgomery
 * representation), then double it with an addition.
 */
MODP_R u_MODP_R (.p(p), .R(z0));
MODP_ADD u_MODP_ADD (.a(z0), .b(z0), .p(p), .d(z1));

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * FSM
 */
always @(*) begin
    case (state)
        S_IDLE: begin
            if (in_valid)
                next_state = S_EXE;
            else
                next_state = state;
        end
        S_EXE: 
            if (cnt == S_OUTPUT)
                next_state = S_IDLE;
            else
                next_state = state;
    endcase
end

always @(*) begin
    if (next_state == S_EXE) begin
        if (cnt == 0)
            next_cnt = cnt + 1;
        else if (out_valid_modp_montymul)
            next_cnt = cnt + 1;
        else
            next_cnt = cnt;
    end
    else
        next_cnt = 0;
end

/*
 * Register inputs
 */
always @(*) begin
    if (in_valid) begin
        p_comb = p;
        p0i_comb = p0i;
    end
    else begin
        p_comb = p_reg;
        p0i_comb = p0i_reg;
    end
end

/*
 * z
 */
always @(*) begin
    if (in_valid)
        next_z = z1;
    else if (state == S_EXE && out_valid_modp_montymul)
        next_z = d_modp_montymul;
    else
        next_z = z;
end

/*
 * Square it five times to obtain 2^32 in Montgomery representation
 * (i.e. 2^63 mod p).
 */
assign a_modp_montymul = z;
assign b_modp_montymul = z;
assign p_modp_montymul = p_reg;
assign p0i_modp_montymul = p0i_reg;
assign isMQ_modp_montymul = 1'b0;

/*
 * MODP_MONTYMUL in_valid
 */
always @(*) begin
    if (next_state == S_EXE && cnt == 0)
        in_valid_modp_montymul_comb = 1;
    else if (state == S_EXE && cnt < S_OUTPUT) begin
        if (out_valid_modp_montymul && cnt < S_OUTPUT - 1)
            in_valid_modp_montymul_comb = 1;
        else if (ready_modp_montymul)
            in_valid_modp_montymul_comb = 0;
        else 
            in_valid_modp_montymul_comb = in_valid_modp_montymul;
    end
    else
        in_valid_modp_montymul_comb = in_valid_modp_montymul;
end

/*
 * Output
 */
always @(*) begin
    if (state == S_EXE) begin
        if (cnt == S_OUTPUT) begin
            next_out_valid = 1;
            next_R2 = (next_z + (p_reg & -(next_z & 1))) >> 1;
        end
        else begin
            next_out_valid = 0;
            next_R2 = R2;
        end
    end
    else begin
        next_out_valid = 0;
        next_R2 = R2;
    end
end

always @(*) begin
    if (in_valid) begin
        o_bus_comb = i_bus;
    end
    else begin
        o_bus_comb = o_bus;
    end
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= 0;
        cnt <= 0;
        p_reg <= 0;
        p0i_reg <= 0;
        in_valid_modp_montymul <= 0;
        z <= 0;
        out_valid <= 0;
        R2 <= 0;
        o_bus <= 0;
    end else begin
        state <= next_state;
        cnt <= next_cnt;
        z <= next_z;
        p_reg <= p_comb;
        p0i_reg <= p0i_comb;
        in_valid_modp_montymul <= in_valid_modp_montymul_comb;
        out_valid <= next_out_valid;
        R2 <= next_R2;
        o_bus <= o_bus_comb;
    end
end

endmodule
