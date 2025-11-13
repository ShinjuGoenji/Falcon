interface INF();
parameter P_WIDTH = 31;

/*
* MODP_MONTYMUL_TOP
*/
logic [1:0]           out_valid_modp_montymul;
logic [P_WIDTH*2-1:0] d_modp_montymul;
logic [1:0]           ready_modp_montymul;

logic [1:0]           in_valid_modp_montymul;
logic [P_WIDTH*2-1:0] a_modp_montymul;
logic [P_WIDTH*2-1:0] b_modp_montymul;
logic [P_WIDTH*2-1:0] p_modp_montymul;
logic [P_WIDTH*2-1:0] p0i_modp_montymul;
logic [1:0]           isMQ_modp_montymul;

modport MODP_MONTYMUL_MASTER_BUS(
    input in_valid_modp_montymul, a_modp_montymul, b_modp_montymul, p_modp_montymul, p0i_modp_montymul, isMQ_modp_montymul,
    output out_valid, d_modp_montymul, ready_modp_montymul
);
    
endinterface



