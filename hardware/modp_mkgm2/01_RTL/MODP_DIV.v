/*
 * Division modulo p. If the divisor (b) is 0, then 0 is returned.
 * This function computes proper results only when p is prime.
 * Parameters:
 *   a     dividend
 *   b     divisor
 *   p     odd prime modulus
 *   p0i   -1/p mod 2^31
 *   R     2^31 mod R
 */
module MODP_DIV (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    a,
    b,
    p,
    p0i,
    R,
    // Output signals
    out_valid,
    z,
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
localparam S_OUTPUT = 4;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
/*
 * Main channel
 */
input                             clk;
input                             rst_n;
input                             in_valid;
input      [P_WIDTH-1:0]          a;
input      [P_WIDTH-1:0]          b;
input      [P_WIDTH-1:0]          p;
input      [P_WIDTH-1:0]          p0i;
input      [P_WIDTH-1:0]          R;

output reg                        out_valid;
output     [P_WIDTH-1:0]          z;

/*
 * MODP_MONTYMUL_TOP
 */
input                    out_valid_modp_montymul;
input      [P_WIDTH-1:0] d_modp_montymul;
input                    ready_modp_montymul;

output                   in_valid_modp_montymul;
output reg [P_WIDTH-1:0] a_modp_montymul;
output reg [P_WIDTH-1:0] b_modp_montymul;
output     [P_WIDTH-1:0] p_modp_montymul;
output     [P_WIDTH-1:0] p0i_modp_montymul;
output                   isMQ_modp_montymul;


//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg state, next_state;
reg [2:0] cnt, next_cnt;

reg in_valid_modp_montymul_reg, in_valid_modp_montymul_comb;

reg [P_WIDTH-1:0] e, e_comb;
reg [4:0] i, i_comb;
reg [P_WIDTH-1:0] z0, z0_comb;

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
            if (cnt == S_OUTPUT && out_valid_modp_montymul)
                next_state = S_IDLE;
            else
                next_state = state;
    endcase
end

always @(*) begin
    if (in_valid)
        next_cnt = 1;
    else if (state == S_EXE && out_valid_modp_montymul)
        if (cnt == 2)
            if (i == 0)
                next_cnt = cnt + 1;
            else 
                next_cnt = 1;
        else if (cnt == S_OUTPUT && out_valid_modp_montymul)
            next_cnt = 0;
        else
            next_cnt = cnt + 1;
    else
        next_cnt = cnt;
end

/*
 * e
 */
always @(*) begin
    if (in_valid)
        e_comb = p - 2;
    else if (cnt == 2 && out_valid_modp_montymul)
        e_comb = e << 1;
    else 
        e_comb = e;
end

/*
 * i
 */
always @(*) begin
    if (in_valid)
        i_comb = 30;
    else if (cnt == 2 && out_valid_modp_montymul && i != 0)
        i_comb = i - 1;
    else 
        i_comb = i;
end

/*
 * MODP_MONTYMUL
 */
assign in_valid_modp_montymul = (in_valid) ? in_valid : in_valid_modp_montymul_reg; 
assign p_modp_montymul = p;
assign p0i_modp_montymul = p0i;
assign isMQ_modp_montymul = 1'b0;

// in_valid
always @(*) begin
    if (in_valid)
        if (ready_modp_montymul)
            in_valid_modp_montymul_comb = 0;
        else 
            in_valid_modp_montymul_comb = 1;
    else if (state == S_EXE) 
        if (out_valid_modp_montymul && cnt < S_OUTPUT)
            in_valid_modp_montymul_comb = 1;
        else if (ready_modp_montymul)
            in_valid_modp_montymul_comb = 0;
        else 
            in_valid_modp_montymul_comb = in_valid_modp_montymul_reg;
    else
        in_valid_modp_montymul_comb = in_valid_modp_montymul_reg;
end

// a, b
always @(*) begin
    if (in_valid)
        a_modp_montymul = R;
    else
        a_modp_montymul = z0;
end

always @(*) begin
    if (in_valid)
        b_modp_montymul = R;
    else if (state == S_EXE) 
        if (cnt == 2)
            b_modp_montymul = b;
        else if (cnt == 3)
            b_modp_montymul = 'd1;
        else if (cnt == 4)
            b_modp_montymul = a;
        else
            b_modp_montymul = z0;
    else
        b_modp_montymul = z0;
end

/*
 * z0
 */
always @(*) begin
    if (in_valid)
        z0_comb = R;
    else if (out_valid_modp_montymul) 
        if (cnt == 2)
            if (e[P_WIDTH-1])
                z0_comb = d_modp_montymul;
            else 
                z0_comb = z0;
        else 
            z0_comb = d_modp_montymul;
    else 
        z0_comb = z0;
end

/*
 * Output
 */
assign z = z0_comb;

always @(*) begin
    if (cnt == S_OUTPUT && out_valid_modp_montymul) 
        out_valid = 1;
    else 
        out_valid = 0;
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state = 0;
        cnt = 0;
        in_valid_modp_montymul_reg <= 0;
        i <= 0;
        e <= 0;
        z0 <= 0;
    end
    else begin
        state = next_state;
        cnt = next_cnt;
        in_valid_modp_montymul_reg <= in_valid_modp_montymul_comb;
        i <= i_comb;
        e <= e_comb;
        z0 <= z0_comb;
    end
end

endmodule
