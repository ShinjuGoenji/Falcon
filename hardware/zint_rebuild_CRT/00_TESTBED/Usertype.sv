`ifndef FALCON_CONFIG_H__
`define FALCON_CONFIG_H__

`ifndef WN
    `define WN 2
`endif

package FALCON_Config;

/*
 * Paramters
 */
// 31-bit type
parameter Q_WIDTH = 16;
parameter P_WIDTH = 31;
typedef logic [P_WIDTH-1:0] uint31_t;

// len bit width
parameter LOGN_WIDTH = 4;               // max logn = 10
parameter NUM_WIDTH = $clog2(1024)+1;   // max num  = 1024
parameter XLEN_WIDTH = 9;               // max xlen = 308

/*
 * Configurables
 */
parameter WORD_NUM = `WN;
parameter RF_CRT_ADDR_WIDTH = (WORD_NUM == 2) ? 10 : 9;

typedef enum logic { 
    UNKNOWN	= 1'dx,
    FALCON_512	= 1'd0,
    FALCON_1024 = 1'd1
} FALCON_MODE;

/*
 * Structures
 */
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
