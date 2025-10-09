
/*
 * At the entry of each loop iteration:
 *  - the first u words of each array have been
 *    reassembled;
 *  - the first u words of tmp[] contains the
 * product of the prime moduli processed so far.
 *
 * We call 'q' the product of all previous primes.
 */
module ZINT_REBUILD_CRT_INNER (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    x_i,
    u,
    p,
    s,
    p0i,
    R2,
    tmp,
    // Output signals
    out_valid,
    x_o,
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
localparam    P_WIDTH = 31;

`ifdef FALCON1024
    localparam LEN_WIDTH = 9;
`else
    localparam LEN_WIDTH = 8;
`endif


// localparam S_IDLE = 0;
// localparam S_R2 = 1;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
/*
 * Main channel
 */
input                       clk;
input                       rst_n;
input                       in_valid;
input      [P_WIDTH-1:0]    x_i;
input      [LEN_WIDTH-1:0]  u;
input      [P_WIDTH-1:0]    p;
input      [P_WIDTH-1:0]    s;
input      [P_WIDTH-1:0]    p0i;
input      [P_WIDTH-1:0]    R2;
input      [P_WIDTH-1:0]    tmp;

output reg                  out_valid;
output reg [P_WIDTH-1:0]    x_o;

/*
 * MODP_MONTYMUL_TOP
 */
input  [1:0]           out_valid_modp_montymul_bus;
input  [P_WIDTH*2-1:0] d_modp_montymul_bus;
input  [1:0]           ready_modp_montymul_bus;

output [1:0]           in_valid_modp_montymul_bus;
output [P_WIDTH*2-1:0] a_modp_montymul_bus;
output [P_WIDTH*2-1:0] b_modp_montymul_bus;
output [P_WIDTH*2-1:0] p_modp_montymul_bus;
output [P_WIDTH*2-1:0] p0i_modp_montymul_bus;
output [1:0]           isMQ_modp_montymul_bus;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg [2:0] state, next_state;
reg [9:0] cnt, next_cnt;

/*
 * variables
 */
// reg [LOGN_WIDTH-1:0] logn_reg, logn_comb;
reg [P_WIDTH-1:0]    g_reg, g_comb;
reg [P_WIDTH-1:0]    ig_reg, ig_comb;
reg [P_WIDTH-1:0]    x1, x1_comb;
reg [P_WIDTH-1:0]    x2, x2_comb;
reg [P_WIDTH-1:0]    R;

/*
 * R2
 */
reg in_valid_modp_R2_reg, in_valid_modp_R2_comb;

/*
 * MONTY_MUL
 */
// slave 1
reg               out_valid_modp_montymul_0;
reg [P_WIDTH-1:0] d_modp_montymul_0;
reg               ready_modp_montymul_0;

reg               in_valid_modp_montymul_0, in_valid_modp_montymul_0_comb;
reg [P_WIDTH-1:0] a_modp_montymul_0;
reg [P_WIDTH-1:0] b_modp_montymul_0;
reg [P_WIDTH-1:0] p_modp_montymul_0;
reg [P_WIDTH-1:0] p0i_modp_montymul_0;
reg               isMQ_modp_montymul_0;

// slave 2
reg               out_valid_modp_montymul_1;
reg [P_WIDTH-1:0] d_modp_montymul_1;
reg               ready_modp_montymul_1;

reg               in_valid_modp_montymul_1, in_valid_modp_montymul_1_reg, in_valid_modp_montymul_1_comb;
reg [P_WIDTH-1:0] a_modp_montymul_1;
reg [P_WIDTH-1:0] b_modp_montymul_1;
reg [P_WIDTH-1:0] p_modp_montymul_1;
reg [P_WIDTH-1:0] p0i_modp_montymul_1;
reg               isMQ_modp_montymul_1;

/*
 * DIV
 */
reg               in_valid_modp_div, in_valid_modp_div_comb;
reg [P_WIDTH-1:0] a_modp_div;
reg [P_WIDTH-1:0] b_modp_div;
reg [P_WIDTH-1:0] R_modp_div;

reg               out_valid_modp_div;
reg [P_WIDTH-1:0] z_modp_div;

reg               out_valid_modp_montymul_modp_div;
reg [P_WIDTH-1:0] d_modp_montymu_modp_div;
reg               ready_modp_montymul_modp_div;

reg               in_valid_modp_montymul_modp_div;
reg [P_WIDTH-1:0] a_modp_montymul_modp_div;
reg [P_WIDTH-1:0] b_modp_montymul_modp_div;
reg [P_WIDTH-1:0] p_modp_montymul_modp_div;
reg [P_WIDTH-1:0] p0i_modp_montymul_modp_div;
reg               isMQ_modp_montymul_modp_div;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
MODP_R u_MODP_R (.p(p), .R(R));

MODP_DIV u_MODP_DIV (
    // Main channel
    // Input signals
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid_modp_div),
    .a(a_modp_div),
    .b(b_modp_div),
    .p(p),
    .p0i(p0i),
    .R(R_modp_div),
    // Output signals
    .out_valid(out_valid_modp_div),
    .z(z_modp_div),
    // MODP_MONTYMUL_TOP
    // Input signals
    .out_valid_modp_montymul(out_valid_modp_montymul_1),
    .d_modp_montymul(d_modp_montymul_1),
    .ready_modp_montymul(ready_modp_montymul_1),
    // Output signals
    .in_valid_modp_montymul(in_valid_modp_montymul_modp_div),
    .a_modp_montymul(a_modp_montymul_modp_div),
    .b_modp_montymul(b_modp_montymul_modp_div),
    .p_modp_montymul(p_modp_montymul_modp_div),
    .p0i_modp_montymul(p0i_modp_montymul_modp_div),
    .isMQ_modp_montymul(isMQ_modp_montymul_modp_div)
);

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
assign n = 1 << logn;
assign k = $clog2(LUT_SIZE) - logn;

/*
 * FSM
 */
always @(*) begin
    case (state)
        S_IDLE: begin
            if (in_valid)
                next_state = S_R2;
            else
                next_state = state;
        end
        S_R2: 
            if (out_valid_modp_R2)
                next_state = S_G;
            else
                next_state = state;
        S_G: 
            if (cnt == 10 && out_valid_modp_montymul_0)
                if (mode == M_ONLY_GM)
                    next_state = S_ONLY_GM;
                else if (mode == M_ONLY_IGM)
                    next_state = S_iG;
                else
                    next_state = S_iG_GM;
            else
                next_state = state;
        S_ONLY_GM:
            if (cnt == n - 1)
                next_state = S_IDLE;
            else
                next_state = state;
        S_iG:
            if (out_valid_modp_div)
                next_state = S_ONLY_iGM;
            else
                next_state = state;
        S_ONLY_iGM:
            if (cnt2 == n - 1)
                next_state = S_IDLE;
            else
                next_state = state;
        S_iG_GM:
            if (out_valid_modp_div)
                next_state = S_GM_iGM;
            else
                next_state = state;
        S_GM_iGM:
            if (cnt == n - 1 && cnt2 == n - 1)
                next_state = S_IDLE;
            else
                next_state = state;
    endcase
end

always @(*) begin
    case (state)
        S_IDLE:
            next_cnt = 0;
        S_R2: 
            if (next_state == S_G)
                next_cnt = logn;
            else
                next_cnt = cnt;
        S_G: 
            if (out_valid_modp_montymul_0)
                if (cnt == 10)
                    next_cnt = 0;
                else 
                    next_cnt = cnt + 1;
            else
                next_cnt = cnt;
        S_ONLY_GM:
            if (cnt < n - 1 && out_valid_modp_montymul_0)
                next_cnt = cnt + 1;
            else
                next_cnt = cnt;
        S_iG_GM:
            if (cnt < n - 1 && out_valid_modp_montymul_0)
                next_cnt = cnt + 1;
            else
                next_cnt = cnt;
        S_GM_iGM:
            if (cnt < n - 1 && out_valid_modp_montymul_0)
                next_cnt = cnt + 1;
            else
                next_cnt = cnt;
        default: 
            next_cnt = cnt;
    endcase
end

always @(*) begin
    case (state)
        S_IDLE:
            next_cnt2 = 0;
        S_ONLY_iGM:
            if (cnt2 < n - 1 && out_valid_modp_montymul_1)
                next_cnt2 = cnt2 + 1;
            else
                next_cnt2 = cnt2;
        S_GM_iGM:
            if (cnt2 < n - 1 && out_valid_modp_montymul_1)
                next_cnt2 = cnt2 + 1;
            else
                next_cnt2 = cnt2;
        default: 
            next_cnt2 = cnt2;
    endcase
end

// /*
//  *  Register input
//  */
// always @(*) begin
//     if (in_valid) begin
//         logn_comb = logn;
//     end
//     else begin
//         logn_comb = logn_reg;
//     end
// end

/*
 *  MODP_R2 
 */
// p, p0i
assign in_valid_modp_R2 = (in_valid) ? in_valid : in_valid_modp_R2_reg;
assign p_modp_R2 = p;
assign p0i_modp_R2 = p0i;

// in_valid
always @(*) begin
    if (in_valid) 
        if (ready_modp_R2)
            in_valid_modp_R2_comb = 0;
        else 
            in_valid_modp_R2_comb = 1;
    else if (state == S_R2 && ready_modp_R2)
        in_valid_modp_R2_comb = 0;
    else 
        in_valid_modp_R2_comb = in_valid_modp_R2_reg;
end

/*
 * Pack / unpack MODP_MONTYMUL bus
 */
assign out_valid_modp_montymul_0 = out_valid_modp_montymul_bus[0];
assign out_valid_modp_montymul_1 = out_valid_modp_montymul_bus[1];
assign d_modp_montymul_0 = d_modp_montymul_bus[P_WIDTH-1:0];
assign d_modp_montymul_1 = d_modp_montymul_bus[P_WIDTH*2-1 -: P_WIDTH];
assign ready_modp_montymul_0 = ready_modp_montymul_bus[0];
assign ready_modp_montymul_1 = ready_modp_montymul_bus[1];

assign in_valid_modp_montymul_bus = {in_valid_modp_montymul_1, in_valid_modp_montymul_0};
assign a_modp_montymul_bus = {a_modp_montymul_1, a_modp_montymul_0};
assign b_modp_montymul_bus = {b_modp_montymul_1, b_modp_montymul_0};
assign p_modp_montymul_bus = {p_modp_montymul_1, p_modp_montymul_0};
assign p0i_modp_montymul_bus = {p0i_modp_montymul_1, p0i_modp_montymul_0};
assign isMQ_modp_montymul_bus = {isMQ_modp_montymul_1, isMQ_modp_montymul_0};

/*
 *  MODP_MONTYMUL slave 0
 */
// p, p0i
assign p_modp_montymul_0 = p;
assign p0i_modp_montymul_0 = p0i;
assign isMQ_modp_montymul_0 = 1'b0;

// in_valid
always @(*) begin
    // state 'S_G'
    if (state == S_R2 && next_state == S_G) 
        in_valid_modp_montymul_0_comb = 1;
    else if (state == S_G)
        if (out_valid_modp_montymul_0 && cnt != 10)
            in_valid_modp_montymul_0_comb = 1;
        else if (next_state == S_ONLY_GM || next_state == S_iG_GM || next_state == S_GM_iGM)
            in_valid_modp_montymul_0_comb = 1;
        else if (ready_modp_montymul_0)
            in_valid_modp_montymul_0_comb = 0;
        else
            in_valid_modp_montymul_0_comb = in_valid_modp_montymul_0;
    // state 'S_ONLY_GM' or 'S_GM_iGM'
    else if (state == S_ONLY_GM || state == S_iG_GM || state == S_GM_iGM)
        if (out_valid_modp_montymul_0 && cnt < n-2)
            in_valid_modp_montymul_0_comb = 1;
        else if (ready_modp_montymul_0)
            in_valid_modp_montymul_0_comb = 0;
        else
            in_valid_modp_montymul_0_comb = in_valid_modp_montymul_0;
    else
        in_valid_modp_montymul_0_comb = in_valid_modp_montymul_0;
end

// a, b
always @(*) begin
    if (state == S_G) 
        a_modp_montymul_0 = g_reg;
    else if (state == S_ONLY_GM || state == S_iG_GM || state == S_GM_iGM) 
        a_modp_montymul_0 = g_reg;
    else 
        a_modp_montymul_0 = 0;
end

always @(*) begin
    if (state == S_G) 
        if (cnt == logn)
            b_modp_montymul_0 = ig_reg;
        else 
            b_modp_montymul_0 = g_reg;
    else if (state == S_ONLY_GM || state == S_iG_GM || state == S_GM_iGM) 
        b_modp_montymul_0 = x1;
    else 
        b_modp_montymul_0 = 0;
end

/*
 *  MODP_MONTYMUL slave 1
 */
// p, p0i
assign p_modp_montymul_1 = p;
assign p0i_modp_montymul_1 = p0i;
assign isMQ_modp_montymul_1 = 1'b0;

// in_valid
assign in_valid_modp_montymul_1 = (state == S_iG || state == S_iG_GM) ? in_valid_modp_montymul_modp_div : in_valid_modp_montymul_1_reg;
always @(*) begin
    // state 'S_ONLY_iGM' or 'S_GM_iGM'
    if ((state == S_iG && next_state == S_ONLY_iGM) || (state == S_iG_GM && next_state == S_GM_iGM))
        in_valid_modp_montymul_1_comb = 1;
    else if (state == S_ONLY_iGM || state == S_GM_iGM)
        if (out_valid_modp_montymul_1 && cnt2 < n-2)
            in_valid_modp_montymul_1_comb = 1;
        else if (ready_modp_montymul_1)
            in_valid_modp_montymul_1_comb = 0;
        else
            in_valid_modp_montymul_1_comb = in_valid_modp_montymul_1_reg;
    else
        in_valid_modp_montymul_1_comb = 0;
end

// a, b
always @(*) begin
    if (state == S_iG || state == S_iG_GM) 
        a_modp_montymul_1 = a_modp_montymul_modp_div;
    else if (state == S_ONLY_iGM || state == S_GM_iGM) 
        a_modp_montymul_1 = ig_reg;
    else 
        a_modp_montymul_1 = 0;
end

always @(*) begin
    if (state == S_iG || state == S_iG_GM) 
        b_modp_montymul_1 = b_modp_montymul_modp_div;
    else if (state == S_ONLY_iGM || state == S_GM_iGM) 
        b_modp_montymul_1 = x2;
    else 
        b_modp_montymul_1 = 0;
end

/*
 *  MODP_DIV
 */
// a, b
assign a_modp_div = ig_reg;
assign b_modp_div = g_reg;
assign R_modp_div = x2;

// in_valid
always @(*) begin
    if (state == S_G && cnt == 10 && (next_state == S_iG || next_state == S_iG_GM) && out_valid_modp_montymul_0) 
        in_valid_modp_div_comb = 1;
    else 
        in_valid_modp_div_comb = 0;
end

/*
 *  variables
 */
// g
always @(*) begin
    if (in_valid) 
        g_comb = g;
    else if (state == S_G && out_valid_modp_montymul_0) 
        g_comb = d_modp_montymul_0;
    else 
        g_comb = g_reg;
end

// ig
always @(*) begin
    if (state == S_R2 && out_valid_modp_R2) 
        ig_comb = R2_modp_R2;
    else if ((state == S_iG || state == S_iG_GM) && out_valid_modp_div) 
        ig_comb = z_modp_div;
    else
        ig_comb = ig_reg;
end

// x1
always @(*) begin
    if (in_valid) 
        x1_comb = R;
    else if ((state == S_ONLY_GM || state == S_iG_GM || state == S_GM_iGM) && out_valid_modp_montymul_0)
        x1_comb = d_modp_montymul_0;
    else   
        x1_comb = x1;
end

// x2
always @(*) begin
    if (in_valid) 
        x2_comb = R;
    else if ((state == S_ONLY_iGM || state == S_GM_iGM) && out_valid_modp_montymul_1)
        x2_comb = d_modp_montymul_1;
    else   
        x2_comb = x2;
end

/*
 *  output
 */
// gm
always @(*) begin
    if (state == S_G && cnt == 10 && out_valid_modp_montymul_0)
        out_valid_gm = 1;
    else if ((state == S_ONLY_GM || state == S_iG_GM || state == S_GM_iGM) && out_valid_modp_montymul_0)
        out_valid_gm = 1;
    else 
        out_valid_gm = 0;
end

assign v_gm = REV10[next_cnt << k];

always @(*) begin
    if (state == S_G)
        gm = x1;
    else 
        gm = d_modp_montymul_0;
end

// igm
always @(*) begin
    if ((state == S_iG || state == S_iG_GM) && out_valid_modp_div)
        out_valid_igm = 1;
    else if ((state == S_ONLY_iGM || state == S_GM_iGM) && out_valid_modp_montymul_1)
        out_valid_igm = 1;
    else 
        out_valid_igm = 0;
end

assign v_igm = REV10[next_cnt2 << k];

always @(*) begin
    // if (state == S_ONLY_iGM || state == S_GM_iGM)
    if (state == S_iG || state == S_iG_GM)
        igm = x2;
    else 
        igm = d_modp_montymul_1;
end




//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= 0;
        cnt <= 0;
        cnt2 <= 0;
        g_reg <= 0;
        ig_reg <= 0;
        x1 <= 0;
        x2 <= 0;
        in_valid_modp_R2_reg <= 0;
        in_valid_modp_montymul_0 <= 0;
        in_valid_modp_montymul_1_reg <= 0;
        in_valid_modp_div <= 0;
    end
    else begin
        state <= next_state;
        cnt <= next_cnt;
        cnt2 <= next_cnt2;
        g_reg <= g_comb;
        ig_reg <= ig_comb;
        x1 <= x1_comb;
        x2 <= x2_comb;
        in_valid_modp_R2_reg <= in_valid_modp_R2_comb;
        in_valid_modp_montymul_0 <= in_valid_modp_montymul_0_comb;
        in_valid_modp_montymul_1_reg <= in_valid_modp_montymul_1_comb;
        in_valid_modp_div <= in_valid_modp_div_comb;
    end
end

endmodule
