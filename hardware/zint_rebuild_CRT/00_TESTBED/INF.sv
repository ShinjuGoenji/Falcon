interface TOP_INF();

import  usertype::*;

logic in_valid;
logic len_valid;
uint31_t in_data;
logic [LOGN_WIDTH-1:0] logn;
logic [XLEN_WIDTH-1:0] xlen;
logic out_valid;
uint31_t out_data;

modport PATTERN (
    output in_valid, in_data, len_valid, logn, xlen,
    input out_valid, out_data
);

modport MAKE_FG (
    input in_valid, in_data, len_valid, logn, xlen,
    output out_valid, out_data
);
    
endinterface

// interface RF_CRT_INF();

// logic         CENA;
// logic [7:0]   AA;
// logic [123:0] QA;
// logic         CENB;
// logic [7:0]   AB;
// logic [123:0] DB;

// modport SLAVE (
//     input CENB, AB, DB, CENA, AA, 
//     output QA
// );
    
// endinterface

// interface MODP_MONTYMUL_INF();

// import  usertype::*;

// MODP_MONTYMUL_MASTER o_mod_small_unsigned[0:WORD_NUM-1];
// MODP_MONTYMUL_SLAVE i_mod_small_unsigned[0:WORD_NUM-1];

// MODP_MONTYMUL_MASTER o_add_mul_small[0:WORD_NUM-1];
// MODP_MONTYMUL_SLAVE i_add_mul_small[0:WORD_NUM-1];

// MODP_MONTYMUL_MASTER i[0:WORD_NUM*2-1];
// MODP_MONTYMUL_SLAVE o[0:WORD_NUM*2-1];

// always_comb begin 
//     i[0:WORD_NUM-1] = o_mod_small_unsigned;
//     i[WORD_NUM:WORD_NUM*2-1] = o_add_mul_small;
//     i_mod_small_unsigned = o[0:WORD_NUM-1];
//     i_add_mul_small = o[WORD_NUM:WORD_NUM*2-1];
// end

// modport ZINT_REBUILD_CRT (
//     input i_mod_small_unsigned, i_add_mul_small,
//     output o_mod_small_unsigned, o_add_mul_small
// );

// modport MODP_MONTYMUL_TOP (
//     input i, 
//     output o
// );
    
// endinterface

// interface ZINT_REBUILD_CRT_INF();

// import  usertype::*;

// MODP_MONTYMUL_MASTER o_mod_small_unsigned[0:WORD_NUM-1];
// MODP_MONTYMUL_SLAVE i_mod_small_unsigned[0:WORD_NUM-1];

// MODP_MONTYMUL_MASTER o_add_mul_small[0:WORD_NUM-1];
// MODP_MONTYMUL_SLAVE i_add_mul_small[0:WORD_NUM-1];

// modport ZINT_MOD_SMALL_UNSIGNED (
//     input i_mod_small_unsigned,
//     output o_mod_small_unsigned
// );

// modport ZINT_ADD_MUL_SMALL (
//     input i_add_mul_small,
//     output o_add_mul_small
// );
    
// endinterface

