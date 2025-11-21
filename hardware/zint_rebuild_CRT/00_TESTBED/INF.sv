interface TOP_INF();

import  usertype::*;

logic in_valid;
logic len_valid;
uint31_t f;
uint31_t p;
uint31_t p0i;
uint31_t R2;
logic [LOGN_WIDTH-1:0] logn;
logic [LOGN_WIDTH-1:0] depth;
logic out_valid;
uint31_t out_data;

modport PATTERN (
    output in_valid, f, p, p0i, R2, len_valid, logn, depth,
    input out_valid, out_data
);

modport MAKE_FG (
    input in_valid, f, p, p0i, R2, len_valid, logn, depth,
    output out_valid, out_data
);
    
endinterface



