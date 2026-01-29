interface TOP_INF();

import  usertype::*;

logic in_valid;
logic len_valid;
uint31_t in_data;
logic [LOGN_WIDTH-1:0] logn;
// logic [NUM_WIDTH-1:0] num;
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
