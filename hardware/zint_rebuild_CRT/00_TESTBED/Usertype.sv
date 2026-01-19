`ifndef USERTYPE
`define USERTYPE

package usertype;

/*
 * 31-bit integer
 */
parameter P_WIDTH = 31;
typedef logic [P_WIDTH-1:0] uint31_t;

parameter LOGN_WIDTH = 4;
parameter XLEN_WIDTH = 9;

parameter WORD_NUM = 4;

typedef struct packed {
    uint31_t p; 
    uint31_t p0i;
    uint31_t s;
    uint31_t R2;
} small_prime;

typedef struct packed {
    logic in_valid;
    uint31_t a;
    uint31_t b;
    uint31_t p; 
    uint31_t p0i;
    logic isMQ;
} MODP_MONTYMUL_MASTER;

typedef struct packed {
    logic out_valid;
    uint31_t d;
    logic ready;
} MODP_MONTYMUL_SLAVE;

endpackage

`endif