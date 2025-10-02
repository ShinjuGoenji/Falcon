`ifdef RTL
    `define CYCLE_TIME 2.0
`elsif GATE
    `define CYCLE_TIME 2.0
`else
    `define CYCLE_TIME 2.0
`endif

module PATTERN #(
    parameter MODP_R2_NUM = 3
)(
    // Output signals
    clk,
    rst_n,
    in_valid_bus,
    p_bus,
    p0i_bus,
    // Input signals
    out_valid_bus,
    R2_bus
);

//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------
localparam    P_WIDTH = 31;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg                           clk;
output reg                           rst_n;
output reg [MODP_R2_NUM-1:0]         in_valid_bus;
output reg [P_WIDTH*MODP_R2_NUM-1:0] p_bus;
output reg [P_WIDTH*MODP_R2_NUM-1:0] p0i_bus;

input      [MODP_R2_NUM-1:0]         out_valid_bus;
input      [P_WIDTH*MODP_R2_NUM-1:0] R2_bus;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_out, file_num;

parameter MAX_OUT_LATENCY = 2000;
integer total_latency, block_latency, pattern_latency;

integer i_pat, i_module;
integer PAT_NUM;

integer fscanf_int;

integer module_en [0:MODP_R2_NUM-1], block_i_cnt [0:MODP_R2_NUM-1], block_o_cnt [0:MODP_R2_NUM-1], keep_block;
parameter BLOCK = 10;
integer rnd;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------
reg               in_valid  [0:MODP_R2_NUM-1];
reg [P_WIDTH-1:0] p         [0:MODP_R2_NUM-1];
reg [P_WIDTH-1:0] p0i       [0:MODP_R2_NUM-1];

reg               out_valid [0:MODP_R2_NUM-1];
reg [P_WIDTH-1:0] R2        [0:MODP_R2_NUM-1];

reg [P_WIDTH-1:0] R2_gold         [0:MODP_R2_NUM-1][0:BLOCK-1];

//---------------------------------------------------------------------
//   Clock
//---------------------------------------------------------------------
real CYCLE = `CYCLE_TIME;
always	#(CYCLE/2.0) clk = ~clk;

//---------------------------------------------------------------------
//  Simulation
//---------------------------------------------------------------------
/*
 * Unpack input bus
 */
genvar i_bus_idx;
generate
    for (i_bus_idx = 0; i_bus_idx < MODP_R2_NUM; i_bus_idx = i_bus_idx + 1) begin
        always @(*) begin
            out_valid[i_bus_idx] = out_valid_bus[i_bus_idx];
            R2[i_bus_idx]        = R2_bus[P_WIDTH*(i_bus_idx+1)-1 -: P_WIDTH];
        end
    end
endgenerate

/*
 * Assign module to MODP_MONTYMUL_TOP bus
 */
always @(*) begin
    for (i_module = 0; i_module < MODP_R2_NUM; i_module = i_module + 1) begin
        in_valid_bus[i_module]                     = in_valid[i_module];
        p_bus[P_WIDTH*(i_module+1)-1 -: P_WIDTH]   = p[i_module];
        p0i_bus[P_WIDTH*(i_module+1)-1 -: P_WIDTH] = p0i[i_module];
    end
end

initial begin
	file_in = $fopen(INPUT_PATH, "r");
	file_out = $fopen(OUTPUT_PATH, "r");
	file_num = $fopen(PATNUM_PATH, "r");
	fscanf_int = $fscanf(file_num, "%d", PAT_NUM);	

	reset_task;
	total_latency = 0;
    i_pat = 0;
	repeat(4) @(posedge clk);
	while (i_pat < PAT_NUM) begin 
        rnd = $urandom_range(1, 2**MODP_R2_NUM-1);
        for (i_module = 0; i_module < MODP_R2_NUM; i_module = i_module + 1)begin
            module_en[i_module] = rnd & (1 << i_module);
            block_i_cnt[i_module] = 0;
            block_o_cnt[i_module] = 0;
        end
        keep_block = 1;
        block_latency = 0;
        while (keep_block && block_latency != MAX_OUT_LATENCY + 1) begin
            input_task;
	        @(posedge clk);		
            for (i_module = 0; i_module < MODP_R2_NUM; i_module = i_module + 1)
                in_valid[i_module] = 'b0;
            check_ans_task;

            keep_block = 0;
            for (i_module = 0; i_module < MODP_R2_NUM; i_module = i_module + 1) begin
                if (block_o_cnt[i_module] < BLOCK && module_en[i_module])
                    keep_block = 1;
            end
            block_latency = block_latency + 1;
         end
		if(block_latency === MAX_OUT_LATENCY + 1) begin
            $display("***********************************************************");    
            $display("                          FAIL!                          	 ");
			$display("         The execution latency are over %d cycles        	 ", MAX_OUT_LATENCY);
		    $display("***********************************************************"); 
			repeat(2) @(posedge clk);
			$finish;
		end
        total_latency = total_latency + block_latency;
		$display("PASS BLOCK NO.%4d ~ NO.%4d, %4d CYCLES", i_pat + 1 - BLOCK, i_pat + 1, block_latency);
		repeat($urandom_range(0, 4)) @(posedge clk);
	end
	YOU_PASS_task;
end

//---------------------------------------------------------------------
//   Task
//---------------------------------------------------------------------
task reset_task; begin 
    rst_n = 'b1;
    for (i_module = 0; i_module < MODP_R2_NUM; i_module = i_module + 1) begin
        in_valid[i_module] = 'b0;
        p[i_module] = 'bx;
        p0i[i_module] = 'bx;
    end
	
    force clk = 0;
    #CYCLE; rst_n = 0; 
    #(CYCLE * 5); rst_n = 1;
    for (i_module = 0; i_module < MODP_R2_NUM; i_module = i_module + 1) begin
        if(out_valid[i_module] !== 'b0) begin 
            $display("************************************************************");  
            $display("                          FAIL!                             ");    
            $display("  'out_valid' should be 0 after initial RESET  at %8t   	  ",$time);
            $display("************************************************************");
            repeat(2) #CYCLE;
            $finish;
        end
        if(R2[i_module] !== 'b0) begin 
            $display("************************************************************");  
            $display("                          FAIL!                             ");    
            $display("    'R2' should be 0 after initial RESET  at %8t            ",$time);
            $display("************************************************************");
            repeat(2) #CYCLE;
            $finish;
        end
    end
	#CYCLE; release clk;
end endtask

task input_task; begin
    for (i_module = 0; i_module < MODP_R2_NUM; i_module = i_module + 1) begin
        if (module_en[i_module] && block_i_cnt[i_module] < BLOCK && block_i_cnt[i_module] == block_o_cnt[i_module]) begin
            in_valid[i_module] = 'b1;
            fscanf_int = $fscanf(file_in, "%d %d", p[i_module], p0i[i_module]);
            fscanf_int = $fscanf(file_out, "%d", R2_gold[i_module][block_i_cnt[i_module]]);

            block_i_cnt[i_module] = block_i_cnt[i_module] + 1;
            i_pat = i_pat + 1;
        end
    end
end endtask

// task wait_out_task; begin
// 	out_latency = 1;
// 	while(out_valid !== 1) begin
// 		if(out_latency === MAX_OUT_LATENCY + 1) begin
//             $display("***********************************************************");    
//             $display("                          FAIL!                          	 ");
// 			$display("         The execution latency are over %d cycles        	 ", MAX_OUT_LATENCY);
// 		    $display("***********************************************************"); 
// 			repeat(2) @(posedge clk);
// 			$finish;
// 		end
// 		out_latency = out_latency + 1;
// 		@(posedge clk);
// 	end
// end endtask

task check_ans_task; begin
    for (i_module = 0; i_module < MODP_R2_NUM; i_module = i_module + 1) begin
        if (module_en[i_module] && block_o_cnt[i_module] < BLOCK) begin
            if(out_valid[i_module] === 1) begin
                if(R2[i_module] !== R2_gold[i_module][block_o_cnt[i_module]])begin
                    $display("***********************************************************");     
                    $display("                          FAIL!                          	 ");  
                    $display("                  Module #%2d (%8t)                   	 ", i_module, $time);
                    $display("                       Gold = %5d                    	     ", R2_gold[i_module][block_o_cnt[i_module]]);
                    $display("                       Your = %5d                    	     ", R2[i_module]);
                    $display("***********************************************************");    
                    repeat(2) @(posedge clk);
                    $finish;
                end
                block_o_cnt[i_module] = block_o_cnt[i_module] + 1;
                in_valid[i_module] = 'b0;
                p[i_module] = 'bx;
                p0i[i_module] = 'bx;
            end
        end
    end
end endtask

// task check_ans_task; begin
// 	if(out_valid === 1) begin
// 		if(R2 !== R2_gold)begin
//             $display("***********************************************************");     
//             $display("                          FAIL!                          	 ");  
//             $display("                  Pattern #%5d (%8t)                   	 ", i_pat, $time);
//             $display("                       Gold = %5d                    	     ", R2_gold);
//             $display("                       Your = %5d                    	     ", R2);
//             $display("***********************************************************");  
//             p = 'bx;
//             p0i = 'bx;  
//             repeat(2) @(posedge clk);
//             $finish;
// 		end
// 	end
// end endtask

task YOU_PASS_task; begin
    $display ("--------------------------------------------------------------------");
    $display ("                         Congratulations!                           ");
    $display ("                  You have passed all patterns!                     ");
    $display ("                  Your execution cycles = %5d cycles                ", total_latency);
	$display ("                  Your clock period = %.1f ns                       ", CYCLE);
    $display ("                  Total Latency = %.1f ns                           ", total_latency*CYCLE);
    $display ("--------------------------------------------------------------------");     
    repeat(2)@(posedge clk);
    $finish;
end endtask

endmodule