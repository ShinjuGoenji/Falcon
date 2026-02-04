interface TOP_INF();

import  usertype::*;

logic in_valid;
logic len_valid;
uint31_t in_data;
FALCON_MODE mode;
logic [LOGN_WIDTH-1:0] logn;
logic [XLEN_WIDTH-1:0] xlen;
logic out_valid;
uint31_t out_data;

modport PATTERN (
    output in_valid, in_data, mode, len_valid, logn, xlen,
    input out_valid, out_data
);

modport MAKE_FG (
    input in_valid, in_data, mode, len_valid, logn, xlen,
    output out_valid, out_data
);
    
endinterface
