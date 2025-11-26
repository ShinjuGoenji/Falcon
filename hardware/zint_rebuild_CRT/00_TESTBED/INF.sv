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

interface RF_CRT_INF();

logic         CENA;
logic [6:0]   AA;
logic [127:0] QA;
logic         CENB;
logic [6:0]   AB;
logic [127:0] DB;

modport SLAVE (
    input CENB, AB, DB, CENA, AA, 
    output QA
);
    
endinterface

// interface MAKE_FG_INF();

// import  usertype::*;

// MODP_MONTYMUL_MASTER modp_montymul_master;
// MODP_MONTYMUL_SLAVE modp_montymul_slave;

// modport ZINT_REBUILD_CRT (
//     input modp_montymul_slave,
//     output modp_montymul_master
// );
    
// endinterface

