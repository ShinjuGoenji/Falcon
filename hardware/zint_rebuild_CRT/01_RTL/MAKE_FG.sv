module MAKE_FG (
    clk,
    rst_n,
    inf
);
import usertype::*;
// import make_fg_type::*;


//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------
typedef enum logic [1:0] { 
    S_IDLE	  = 2'd0,
    S_INPUT	  = 2'd1,
    S_OUTPUT  = 2'd2
} State;

typedef struct packed {
    logic [9:0] addr;
    uint31_t data;
} ADDR_DATA;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input clk;
input rst_n;
TOP_INF.MAKE_FG inf;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
State state, next_state;

logic [LOGN_WIDTH-1:0] logn, logn_comb;
logic [XLEN_WIDTH-1:0] xlen, xlen_comb;

uint31_t rf_crt_write_buffer [0:WORD_NUM-1], rf_crt_write_buffer_comb [0:WORD_NUM-1];

logic [9:0] input_ptr, input_ptr_comb;

logic all_done, output_done;

/*
 * MOD_SMALL_UNSIGNED
 */
logic [8:0] u_mod_small_unsigned;
logic [9:0] mod_small_unsigned_ptr, mod_small_unsigned_ptr_comb;

logic mod_small_unsigned_input_buffer_full, mod_small_unsigned_input_buffer_full_comb;
logic mod_small_unsigned_ready;
ADDR_DATA mod_small_unsigned_input_buffer [0:WORD_NUM-1], mod_small_unsigned_input_buffer_comb [0:WORD_NUM-1];


/*
 * RF_CRT
 */
RF_CRT_INF    rf_crt_inf();
logic         rf_crt_CENA;
logic         rf_crt_CENB, rf_crt_CENB_comb;
logic [6:0]   rf_crt_AA, rf_crt_AB_comb;
logic [6:0]   rf_crt_AB;
logic [127:0] rf_crt_DB;
logic [127:0] rf_crt_QA;

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
always_comb begin
    case (state)
        S_IDLE: 
            if (inf.len_valid)
                next_state = S_INPUT;
            else
                next_state = next_state;
        S_INPUT: 
            if (all_done)
                next_state = S_OUTPUT;
            else
                next_state = next_state;
        S_OUTPUT: 
            if (output_done)
                next_state = S_IDLE;
            else
                next_state = next_state;
        default: 
            next_state = S_IDLE;
    endcase
end

/*
 * input
 */
// logn
always_comb begin
    if (inf.len_valid)
        logn_comb = inf.logn;
    else
        logn_comb = logn;
end

// xlen
always_comb begin
    if (inf.len_valid)
        xlen_comb = inf.xlen;
    else
        xlen_comb = xlen;
end

/*
 * input data
 */
// input pointer
always_comb begin
    if (state == S_IDLE)
        input_ptr_comb = 0;
    else if (state == S_INPUT && inf.in_valid)
        input_ptr_comb = input_ptr + 1;
    else
        input_ptr_comb = input_ptr;
end

// input data
genvar rf_crt_write_buffer_comb_idx;
generate
    for (rf_crt_write_buffer_comb_idx=1; rf_crt_write_buffer_comb_idx<WORD_NUM; rf_crt_write_buffer_comb_idx=rf_crt_write_buffer_comb_idx+1) begin
        always_comb begin
            if (state == S_INPUT && inf.in_valid)
                rf_crt_write_buffer_comb[rf_crt_write_buffer_comb_idx] = rf_crt_write_buffer[rf_crt_write_buffer_comb_idx-1];
            else
                rf_crt_write_buffer_comb[rf_crt_write_buffer_comb_idx] = rf_crt_write_buffer[rf_crt_write_buffer_comb_idx];
        end
    end
endgenerate

always_comb begin
    if (state == S_INPUT && inf.in_valid)
        rf_crt_write_buffer_comb[0] = inf.in_data;
    else
        rf_crt_write_buffer_comb[0] = rf_crt_write_buffer[0];
end

/*
 * MOD_SMALL_UNSIGNED
 */
// pointer
/* 
 * u = ptr / 2 ^ logn
 */
assign u_mod_small_unsigned = mod_small_unsigned_ptr >> logn; 

always_comb begin
    if (inf.in_valid && (!mod_small_unsigned_input_buffer_full || mod_small_unsigned_ready)) 
            mod_small_unsigned_ptr_comb = mod_small_unsigned_ptr + 1;
    else
        mod_small_unsigned_ptr_comb = mod_small_unsigned_ptr;
end

// TODO: 
assign mod_small_unsigned_ready = 1;
assign mod_small_unsigned_input_buffer_full_comb = 0;

genvar mod_small_unsigned_input_buffer_comb_idx;
generate
    for (mod_small_unsigned_input_buffer_comb_idx=1; mod_small_unsigned_input_buffer_comb_idx<WORD_NUM; mod_small_unsigned_input_buffer_comb_idx=mod_small_unsigned_input_buffer_comb_idx+1) begin
        always_comb begin
            if (inf.in_valid && u_mod_small_unsigned == 0)
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
    if (inf.in_valid && u_mod_small_unsigned == 0)
        if (!mod_small_unsigned_input_buffer_full || mod_small_unsigned_ready) begin
            mod_small_unsigned_input_buffer_comb[0].data = inf.in_data;
            mod_small_unsigned_input_buffer_comb[0].addr = input_ptr;
        end
        else
            mod_small_unsigned_input_buffer_comb[0] = mod_small_unsigned_input_buffer[0];
    else
        mod_small_unsigned_input_buffer_comb[0] = mod_small_unsigned_input_buffer[0];
end

/*
 * CRT Register File
 */
// write
logic intt_write;

assign intt_write = state == S_INPUT && input_ptr % WORD_NUM == (WORD_NUM - 1) && inf.in_valid;

// CENB
always_comb begin
    if (intt_write)
        rf_crt_CENB_comb = 1;
    else
        rf_crt_CENB_comb = 0;
end

// AB
always_comb begin
    rf_crt_AB_comb = input_ptr / WORD_NUM;
end

// DB
always_comb begin
    rf_crt_inf.DB = {>> {rf_crt_write_buffer}};
end

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
RF_CRT u_RF_CRT(
    .clk(clk),
	.inf(rf_crt_inf.SLAVE)
);

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
genvar mod_small_unsigned_input_buffer_idx;
generate
    for (mod_small_unsigned_input_buffer_idx=0; mod_small_unsigned_input_buffer_idx<WORD_NUM; mod_small_unsigned_input_buffer_idx=mod_small_unsigned_input_buffer_idx+1) begin
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                mod_small_unsigned_input_buffer[mod_small_unsigned_input_buffer_idx] = 0;
            end
            else begin
                mod_small_unsigned_input_buffer[mod_small_unsigned_input_buffer_idx] = mod_small_unsigned_input_buffer_comb[mod_small_unsigned_input_buffer_idx];
            end
        end
    end
endgenerate

genvar rf_crt_write_buffer_idx;
generate
    for (rf_crt_write_buffer_idx=0; rf_crt_write_buffer_idx<WORD_NUM; rf_crt_write_buffer_idx=rf_crt_write_buffer_idx+1) begin
        always_ff @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                rf_crt_write_buffer[rf_crt_write_buffer_idx] = 0;
            end
            else begin
                rf_crt_write_buffer[rf_crt_write_buffer_idx] = rf_crt_write_buffer_comb[rf_crt_write_buffer_idx];
            end
        end
    end
endgenerate

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= S_IDLE;
        logn <= 0;
        xlen <= 0;
        input_ptr <= 0;
        // MOD_SMALL_UNSIGNED
        mod_small_unsigned_ptr <= 0;
        mod_small_unsigned_input_buffer_full <= 0;
        // RF_CRT
        rf_crt_inf.CENB <= 0;
        rf_crt_inf.AB <= 0;
        inf.out_valid <= 0;
        inf.out_data <= 0;
    end
    else begin
        state <= next_state;
        logn <= logn_comb;
        xlen <= xlen_comb;
        input_ptr <= input_ptr_comb;
        // MOD_SMALL_UNSIGNED
        mod_small_unsigned_ptr <= mod_small_unsigned_ptr_comb;
        mod_small_unsigned_input_buffer_full <= mod_small_unsigned_input_buffer_full_comb;
        // RF_CRT
        rf_crt_inf.CENB <= rf_crt_CENB_comb;
        rf_crt_inf.AB <= rf_crt_AB_comb;
        inf.out_valid <= 0;
        inf.out_data <= 0;
    end
end

endmodule

module RF_CRT (
    clk,
	inf
);

//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input            clk;
RF_CRT_INF.SLAVE inf;

//---------------------------------------------------------------------
//   Logic
//---------------------------------------------------------------------
// Redundent
logic         rf_2p_crt_CENYA;
logic [6:0]   rf_2p_crt_AYA;
logic         rf_2p_crt_CENYB;
logic [6:0]   rf_2p_crt_AYB;
logic [127:0] rf_2p_crt_DYB;

//---------------------------------------------------------------------
//   SRAM
//---------------------------------------------------------------------

rf_2p_hse_crt u_rf_2p_hse_crt (
	.CENYA(rf_2p_crt_CENYA), 
	.AYA(rf_2p_crt_AYA),     
	.CENYB(rf_2p_crt_CENYB), 
	.AYB(rf_2p_crt_AYB),     
	.DYB(rf_2p_crt_DYB),     
    .QA(inf.QA),
    .CLKA(clk),
    .CENA(inf.CENA),
    .AA(inf.AA),
    .CLKB(clk),
    .CENB(inf.CENB),
    .AB(inf.AB),
    .DB(inf.DB),
	// Extra margin adjustment pins input
	.EMAA(3'b000), .EMASA(1'b0),  .STOVA(1'b0),
	.EMAB(3'b000), .EMAWB(2'b00), .STOVB(1'b0),
	// Test mode pins (Redundent), active low 
	.TENA(1'b1), .BENA(1'b1),
	.TENB(1'b1),
	.TCENA(1'b1), .TAA(7'b0), .TQA(128'b0), 
	.TCENB(1'b1), .TAB(7'b0), .TDB(128'b0),
	// Retention mode (power down) (active low)
	.RET1N(1'b1),
	// Additional support pins input
	.COLLDISN(1'b1)
);

endmodule
