`ifndef USERTYPE
`define USERTYPE

package usertype;

/*
 * 31-bit integer
 */
typedef logic [30:0] uint31_t;


/*
 * 31-bit integer
 */
parameter LOGN_WIDTH = 4;

typedef enum logic [1:0] { 
    S_IDLE	  = 3'd0,
    S_INPUT	  = 3'd1,
    S_OUTPUT  = 3'd7
} State;

endpackage

import usertype::*; //import usertype into $unit

`endif