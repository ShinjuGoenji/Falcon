/*
 * At the entry of each loop iteration:
 *  - the first u words of each array have been
 *    reassembled;
 *  - the first u words of tmp[] contains the
 * product of the prime moduli processed so far.
 *
 * We call 'q' the product of all previous primes.
 */
module ZINT_REBUILD_CRT (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    x_i,
    xlen,
    p,
    s,
    p0i,
    R2,
    tmp,
    // Output signals
    out_valid,
    x_o,
    // MODP_MONTYMUL_TOP
    modp_montymul_master_bus
    // // Input signals
    // out_valid_modp_montymul_bus,
    // d_modp_montymul_bus,
    // ready_modp_montymul_bus,
    // // Output signals
    // in_valid_modp_montymul_bus,
    // a_modp_montymul_bus,
    // b_modp_montymul_bus,
    // p_modp_montymul_bus,
    // p0i_modp_montymul_bus,
    // isMQ_modp_montymul_bus
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam    P_WIDTH = 31;

`ifdef FALCON1024
    localparam XLEN_WIDTH = 9;
`else
    localparam XLEN_WIDTH = 8;
`endif


localparam S_IDLE = 0;
localparam S_ZINT_MOD_SMALL_UNSIGNED = 1;
localparam S_CALC_XR = 2;
localparam S_ZINT_ADD_MUL_SMALL = 3;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
/*
 * Main channel
 */
input  logic                  clk;
input  logic                  rst_n;
input  logic                  in_valid;
input  logic [P_WIDTH-1:0]    x_i;
input  logic [XLEN_WIDTH-1:0] xlen;
input  logic [P_WIDTH-1:0]    p;
input  logic [P_WIDTH-1:0]    s;
input  logic [P_WIDTH-1:0]    p0i;
input  logic [P_WIDTH-1:0]    R2;
input  logic [P_WIDTH-1:0]    tmp;

output logic                  out_valid;
output logic [P_WIDTH-1:0]    x_o;


/*
 * MODP_MONTYMUL
 */
INF.MODP_MONTYMUL_MASTER_BUS modp_montymul_master_bus;

// input  logic [1:0]           out_valid_modp_montymul_bus;
// input  logic [P_WIDTH*2-1:0] d_modp_montymul_bus;
// input  logic [1:0]           ready_modp_montymul_bus;

// output logic [1:0]           in_valid_modp_montymul_bus;
// output logic [P_WIDTH*2-1:0] a_modp_montymul_bus;
// output logic [P_WIDTH*2-1:0] b_modp_montymul_bus;
// output logic [P_WIDTH*2-1:0] p_modp_montymul_bus;
// output logic [P_WIDTH*2-1:0] p0i_modp_montymul_bus;
// output logic [1:0]           isMQ_modp_montymul_bus;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
logic [2:0] state, next_state;
logic [9:0] cnt, next_cnt;

// done signal
wire D_ZNIT_MOD_SMALL_UNSIGNED;

/*
 * variables
 */
logic               u;
logic [P_WIDTH-1:0] xq;

/*
 * ZNIT_MOD_SMALL_UNSIGNED
 */
logic               out_valid_zint_mod_small_unsigned;
logic [P_WIDTH-1:0] x_zint_mod_small_unsigned;

/*
 * MONTY_MUL
 */
logic               out_valid_modp_montymul;
logic [P_WIDTH-1:0] d_modp_montymul;
logic               ready_modp_montymul;

logic               in_valid_modp_montymul, in_valid_modp_montymul_comb;
logic [P_WIDTH-1:0] a_modp_montymul;
logic [P_WIDTH-1:0] b_modp_montymul;
logic [P_WIDTH-1:0] p_modp_montymul;
logic [P_WIDTH-1:0] p0i_modp_montymul;
logic               isMQ_modp_montymul;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
ZNIT_MOD_SMALL_UNSIGNED u_ZNIT_MOD_SMALL_UNSIGNED (
    // Main channel
    // Input signals
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid_zint_mod_small_unsigned),
    .d(),
    .dlen(),
    .p(),
    .p0i(),
    .R2(),
    // Output signals
    .ready(),
    .out_valid(out_valid_zint_mod_small_unsigned),
    .x(x_zint_mod_small_unsigned),
    // MODP_MONTYMUL_TOP
    // Input signals
    .out_valid_modp_montymul(),
    .d_modp_montymul(),
    .ready_modp_montymul(),
    // Output signals
    .in_valid_modp_montymul(),
    .a_modp_montymul(),
    .b_modp_montymul(),
    .p_modp_montymul(),
    .p0i_modp_montymul(),
    .isMQ_modp_montymul()
);

ZINT_ADD_MUL_SMALL u_ZINT_ADD_MUL_SMALL (
    // Input signals
    .clk(clk),
    .rst_n(rst_n),
    .x_i(),
    .y(),
    .len(),
    .s(),
    .cnt(),
    // Output signals
    .x_o()
);

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
                next_state = S_ZINT_MOD_SMALL_UNSIGNED;
            else
                next_state = state;
        end
        S_ZINT_MOD_SMALL_UNSIGNED: begin
            if (out_valid_zint_mod_small_unsigned)
                next_state = S_CALC_XR;
            else
                next_state = state;
        end
        S_CALC_XR: begin
            if (out_valid_modp_montymul)
                next_state = S_ZINT_ADD_MUL_SMALL;
            else
                next_state = state;
        end
        S_ZINT_ADD_MUL_SMALL: begin
            if (cnt == u)
                if (u == xlen)
                    next_state = S_IDLE;
                else 
                    next_state = S_ZINT_MOD_SMALL_UNSIGNED;
            else
                next_state = state;
        end
    endcase
end

always_comb begin
    if (state == S_ZINT_ADD_MUL_SMALL)
        next_cnt = cnt + 1;
    else if (state == S_CALC_XR && out_valid_modp_montymul)
        next_cnt = 0;
    else 
        next_cnt = 0;
end

logic in_valid_zint_mod_small_unsigned;
/*
 *  ZINT_MOD_SMALL_UNSIGNED
 */
// in_valid
always_comb begin
    if (state == S_IDLE && in_valid)
        in_valid_zint_mod_small_unsigned = 1;
    else 
        in_valid_zint_mod_small_unsigned = 0;
end

// d
always_comb begin
end


/*
 *  MODP_MONTYMUL
 */
// p, p0i

// in_valid

// a, b

/*
 *  variables
 */
// 

/*
 *  output
 */
// out_valid




//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= 0;
        cnt <= 0;
    end
    else begin
        state <= next_state;
        cnt <= next_cnt;
    end
end

endmodule
