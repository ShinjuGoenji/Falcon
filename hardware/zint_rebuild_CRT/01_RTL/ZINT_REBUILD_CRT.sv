/*
 * At the entry of each loop iteration:
 *  - the first u words of each array have been
 *    reassembled;
 *  - the first u words of tmp[] contains the
 * product of the prime moduli processed so far.
 *
 * We call 'q' the product of all previous primes.
 */
module ZINT_REBUILD_CRT (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    x_i,
    input_ptr,
    logn,
    // Output signals
    out_valid,
    x_o
    // MODP_MONTYMUL_TOP
    // modp_montymul_inf
);
import usertype::*

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
/*
 * Main channel
 */
input  logic     clk;
input  logic     rst_n;
input  logic     in_valid;
input  uint31_t  x_i;
input  [9:0]     input_ptr;
logic  [LOGN_WIDTH-1:0] logn;

output logic     out_valid;
output uint31_t  x_o;


/*
 * MODP_MONTYMUL
 */
// MAKE_FG_INF.ZINT_REBUILD_CRT modp_montymul_inf;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
logic [9:0] mod_small_unsigned_ptr, mod_small_unsigned_ptr_comb;

logic mod_small_unsigned_input_buffer_full, mod_small_unsigned_input_buffer_full_comb;
logic mod_small_unsigned_ready;
ADDR_DATA mod_small_unsigned_input_buffer [0:WORD_NUM-1], mod_small_unsigned_input_buffer_comb [0:WORD_NUM-1];

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------


//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
always_comb begin
    
end



// TODO: 
assign mod_small_unsigned_ready = 1;
assign mod_small_unsigned_input_buffer_full_comb = 0;

genvar mod_small_unsigned_input_buffer_comb_idx;
generate
    for (mod_small_unsigned_input_buffer_comb_idx=1; mod_small_unsigned_input_buffer_comb_idx<WORD_NUM; mod_small_unsigned_input_buffer_comb_idx=mod_small_unsigned_input_buffer_comb_idx+1) begin
        always_comb begin
            if (in_valid)
                if (!mod_small_unsigned_input_buffer_full || mod_small_unsigned_ready)
                    mod_small_unsigned_input_buffer_comb[mod_small_unsigned_input_buffer_comb_idx] = mod_small_unsigned_input_buffer[mod_small_unsigned_input_buffer_comb_idx-1];
                else
                    mod_small_unsigned_input_buffer_comb[mod_small_unsigned_input_buffer_comb_idx] = mod_small_unsigned_input_buffer[mod_small_unsigned_input_buffer_comb_idx];
            else
                mod_small_unsigned_input_buffer_comb[mod_small_unsigned_input_buffer_comb_idx] = mod_small_unsigned_input_buffer[mod_small_unsigned_input_buffer_comb_idx];
        end
    end
endgenerate

always_comb begin
    if (in_valid)
        if (!mod_small_unsigned_input_buffer_full || mod_small_unsigned_ready) begin
            mod_small_unsigned_input_buffer_comb[0].data = x_i;
            mod_small_unsigned_input_buffer_comb[0].addr = input_ptr;
        end
        else
            mod_small_unsigned_input_buffer_comb[0] = mod_small_unsigned_input_buffer[0];
    else
        mod_small_unsigned_input_buffer_comb[0] = mod_small_unsigned_input_buffer[0];
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
    end
    else begin
    end
end

endmodule
