`include "MODP_R.v"
`include "MODP_ADD.v"

/*
 * Compute R2 = 2^62 mod p.
 */
module MODP_R2 (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    p,
    p0i,
    // Output signals
    out_valid,
    R2,
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

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
/*
 * Main channel
 */
input                    clk;
input                    rst_n;
input                    in_valid;
input      [P_WIDTH-1:0] p;
input      [P_WIDTH-1:0] p0i;

output reg               out_valid;
output reg [P_WIDTH-1:0] R2;

/*
 * MODP_MONTYMUL_TOP
 */
input                    out_valid_modp_montymul;
input      [P_WIDTH-1:0] d_modp_montymul;
input                    ready_modp_montymul;

output               in_valid_modp_montymul;
output [P_WIDTH-1:0] a_modp_montymul;
output [P_WIDTH-1:0] b_modp_montymul;
output [P_WIDTH-1:0] p_modp_montymul;
output [P_WIDTH-1:0] p0i_modp_montymul;
output               isMQ_modp_montymul;


//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg [P_WIDTH-1:0] z0;
reg [P_WIDTH-1:0] z1;
reg [P_WIDTH-1:0] z, next_z;

reg state, next_state;
reg [1:0] cnt, next_cnt;

reg  i_valid;
wire [P_WIDTH-1:0] d;
wire o_valid;

reg next_out_valid;
reg [P_WIDTH-1:0] next_R2;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
/*
 * Compute z = 2^31 mod p (this is the value 1 in Montgomery
 * representation), then double it with an addition.
 */
MODP_R u_MODP_R (.p(p), .R(z0));
MODP_ADD u_MODP_ADD (.a(z0), .b(z0), .p(p), .d(z1));

/*
 * Square it five times to obtain 2^32 in Montgomery representation
 * (i.e. 2^63 mod p).
 */
assign in_valid_modp_montymul = i_valid;
assign a_modp_montymul = z;
assign b_modp_montymul = z;
assign p_modp_montymul = p;
assign p0i_modp_montymul = p0i;
assign isMQ_modp_montymul = 1'b0;
assign o_valid = out_valid_modp_montymul;
assign d = d_modp_montymul;

// MODP_MONTYMUL_TOP u_MODP_MONTYMUL_TOP (
//     // Input signals
//     .clk(clk),
//     .rst_n(rst_n),
//     .ena(1'b1),
//     .in_valid(i_valid),
//     .a(z),
//     .b(z),
//     .p(p),
//     .p0i(p0i),
//     .isMQ(1'b0),
//     // Output signals
//     .out_valid(o_valid),
//     .d(d)
//     );

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
            if (cnt == 5)
                next_state = S_IDLE;
            else
                next_state = state;
    endcase
end

always @(*) begin
    if (next_state == S_EXE) begin
        if (cnt == 0)
            next_cnt = cnt + 1;
        else if (o_valid)
            next_cnt = cnt + 1;
        else
        next_cnt = cnt;
    end
    else
        next_cnt = 0;
end

/*
 * z
 */
always @(*) begin
    if (in_valid)
        next_z = z1;
    else if (o_valid)
        next_z = d;
    else
        next_z = z;
end

/*
 * MODP_MONTYMUL in_valid
 */
always @(*) begin
    if (state == S_EXE) begin
        if (cnt == 1)
            i_valid = 1;
        else
            i_valid = o_valid;
    end
    else
        i_valid = 0;
end

/*
 * Output
 */
always @(*) begin
    if (state == S_EXE) begin
        if (cnt == 5) begin
            next_out_valid = 1;
            next_R2 = (z + (p & -(z & 1))) >> 1;
        end
        else begin
            next_out_valid = 0;
            next_R2 = 0;
        end
    end
    else begin
        next_out_valid = out_valid;
        next_R2 = R2;
    end
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or posedge rst_n) begin
    if (!rst_n) begin
        state = 0;
        cnt = 0;
        z <= 0;
        out_valid <= 0;
        R2 <= 0;
    end else begin
        state = next_state;
        cnt = next_cnt;
        z <= next_z;
        out_valid <= next_out_valid;
        R2 <= next_R2;
    end
end

endmodule
