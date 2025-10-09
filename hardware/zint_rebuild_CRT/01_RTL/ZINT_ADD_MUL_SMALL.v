/*
 * Add y*s to x. x and y initially have length 'len' words; the new x
 * has length 'len+1' words. 's' must fit on 31 bits. x[] and y[] must
 * not overlap.
 */
module ZINT_ADD_MUL_SMALL (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    x_i,
    y,
    len,
    s,
    // Output signals
    out_valid,
    x_o
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
//   Input & Output
//---------------------------------------------------------------------
/*
 * Main channel
 */
input                  clk;
input                  rst_n;
input                  in_valid;
input  [P_WIDTH-1:0]   x_i;
input  [P_WIDTH-1:0]   y;
input  [LEN_WIDTH-1:0] len;
input  [P_WIDTH-1:0]   s;

output                 out_valid;
output [P_WIDTH-1:0]   x_o;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg                 state, next_state;
reg [LEN_WIDTH-1:0] cnt, next_cnt;

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
        S_EXE: begin
            if (cnt == 0)
                next_state = S_EXE;
            else
                next_state = state;
        end
    endcase
end

always @(*) begin
    if (in_valid)
        next_cnt = dlen - 1;
    else if (state == S_EXE && out_valid_modp_montymul)
        next_cnt = cnt - 1;
    else
        next_cnt = cnt;
end

/*
 * variable
 */
always @(*) begin
    if (d < p)
        d_p = d;
    else
        d_p = d - p;
end

always @(*) begin
    if (in_valid || out_valid_modp_montymul)
        w_comb = d_p;
    else
        w_comb = w;
end

always @(*) begin
    if (in_valid || out_valid_modp_montymul)
        out_valid_modp_add_comb = 1;
    else
        out_valid_modp_add_comb = 0;
end

always @(*) begin
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
always @(posedge clk or negedge rst_n) begin
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
