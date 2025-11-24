`ifndef USERTYPE
`define USERTYPE

package usertype;

/*
 * 31-bit integer
 */
typedef logic [30:0] uint31_t;


parameter LOGN_WIDTH = 4;
parameter XLEN_WIDTH = 9;

typedef enum logic [1:0] { 
    S_IDLE	  = 3'd0,
    S_INPUT	  = 3'd1,
    S_OUTPUT  = 3'd7
} State;

endpackage

import usertype::*; //import usertype into $unit

`endif