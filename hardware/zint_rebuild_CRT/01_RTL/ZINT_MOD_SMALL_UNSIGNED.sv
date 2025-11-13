/*
 * Reduce a big integer d modulo a small integer p.
 * Rules:
 *  d is unsigned
 *  p is prime
 *  2^30 < p < 2^31
 *  p0i = -(1/p) mod 2^31
 *  R2 = 2^62 mod p
 */
module ZNIT_MOD_SMALL_UNSIGNED (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    d,
    dlen,
    p,
    p0i,
    R2,
    // Output signals
    ready,
    out_valid,
    x,
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

`ifdef FALCON1024
    localparam LEN_WIDTH = 9;
`else
    localparam LEN_WIDTH = 8;
`endif

localparam S_IDLE = 0;
localparam S_EXE = 1;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
/*
 * Main channel
 */
input                  clk;
input                  rst_n;
input                  in_valid;
input  [P_WIDTH-1:0]   d;
input  [LEN_WIDTH-1:0] dlen;
input  [P_WIDTH-1:0]   p;
input  [P_WIDTH-1:0]   p0i;
input  [P_WIDTH-1:0]   R2;

output                 ready;
output                 out_valid;
output [P_WIDTH-1:0]   x;

/*
 * MODP_MONTYMUL_TOP
 */
input                    out_valid_modp_montymul;
input      [P_WIDTH-1:0] d_modp_montymul;
input                    ready_modp_montymul;

output reg               in_valid_modp_montymul;
output reg [P_WIDTH-1:0] a_modp_montymul;
output reg [P_WIDTH-1:0] b_modp_montymul;
output reg [P_WIDTH-1:0] p_modp_montymul;
output reg [P_WIDTH-1:0] p0i_modp_montymul;
output reg               isMQ_modp_montymul;


//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
logic                 state, next_state;
logic [LEN_WIDTH-1:0] cnt, next_cnt;

logic [P_WIDTH-1:0]   d_p;
logic [P_WIDTH-1:0]   x0, x0_comb;
logic [P_WIDTH-1:0]   x1;
logic [P_WIDTH-1:0]   w, w_comb;
logic                 out_valid_modp_add, out_valid_modp_add_comb;
logic                 in_valid_modp_montymul_comb;

//---------------------------------------------------------------------
//  Submodule
//---------------------------------------------------------------------
MODP_ADD u_MODP_ADD (.a(x0), .b(w), .p(p), .d(x1));

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
/*
 * FSM
 */
always_comb begin
    case (state)
        S_IDLE: begin
            if (in_valid)
                next_state = S_EXE;
            else
                next_state = state;
        end
        S_EXE: begin
            if (cnt == 0)
                next_state = S_EXE;
            else
                next_state = state;
        end
    endcase
end

always_comb begin
    if (in_valid)
        next_cnt = dlen - 1;
    else if (state == S_EXE && out_valid_modp_montymul)
        next_cnt = cnt - 1;
    else
        next_cnt = cnt;
end

/*
 * MODP_MONTYMUL
 */
assign a_modp_montymul = x0;
assign b_modp_montymul = R2;
assign p_modp_montymul = p;
assign p0i_modp_montymul = p0i;
assign isMQ_modp_montymul = 1'b0;

// in_valid
always_comb begin
    if (state == S_EXE) 
        if (out_valid_modp_add)
            in_valid_modp_montymul_comb = 1;
        else if (ready_modp_montymul)
            in_valid_modp_montymul_comb = 0;
        else 
            in_valid_modp_montymul_comb = in_valid_modp_montymul;
    else
        in_valid_modp_montymul_comb = in_valid_modp_montymul;
end

/*
 * variable
 */
always_comb begin
    if (d < p)
        d_p = d;
    else
        d_p = d - p;
end

always_comb begin
    if (in_valid || out_valid_modp_montymul)
        w_comb = d_p;
    else
        w_comb = w;
end

always_comb begin
    if (in_valid || out_valid_modp_montymul)
        out_valid_modp_add_comb = 1;
    else
        out_valid_modp_add_comb = 0;
end

always_comb begin
    if (state == S_IDLE)
        x0_comb = 0;
    else if (out_valid_modp_add)
        x0_comb = x1;
    else if (out_valid_modp_montymul)
        x0_comb = d_modp_montymul;
    else
        x0_comb = x0;
end

/*
 * Output
 */
assign ready = (state == S_EXE) ? out_valid_modp_montymul : 1;
assign out_valid = state == S_EXE && cnt == 0;
assign x = x1;

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= 0;
        cnt <= 0;
        x0 <= 0;
        w <= 0;
        out_valid_modp_add <= 0;
        in_valid_modp_montymul <= 0;
    end
    else begin
        state <= next_state;
        cnt <= next_cnt;
        x0 <= x0_comb;
        w <= w_comb;
        out_valid_modp_add <= out_valid_modp_add_comb;
        in_valid_modp_montymul <= in_valid_modp_montymul_comb;
    end
end

endmodule
