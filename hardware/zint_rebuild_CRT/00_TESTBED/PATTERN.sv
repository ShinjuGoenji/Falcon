`include "Usertype.sv"

`ifndef CYCLE_TIME
    `define CYCLE_TIME 2
`endif

// `ifdef RTL
//     `define CYCLE_TIME 1.48
// `elsif GATE
//     `define CYCLE_TIME 1.48
// `else
//     `define CYCLE_TIME 1.48
// `endif

module PATTERN (
    output logic clk,
    output logic rst_n,
    TOP_INF.PATTERN inf
);
import FALCON_Config::*;
//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_out, file_num;

parameter MAX_OUT_LATENCY = 200000;
integer total_latency, out_latency, latency;
integer total_cycles, start_cycle, end_cycle;
longint latency_sum [string];
int pair_count [string];
string key_str;

integer i_pat, i_in, i_out;
integer PAT_NUM;

integer fscanf_int;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------
logic [LOGN_WIDTH-1:0] logn_gold;
logic [XLEN_WIDTH-1:0] xlen_gold;
uint31_t out_data_gold;

//---------------------------------------------------------------------
//   Clock
//---------------------------------------------------------------------
real CYCLE = `CYCLE_TIME;
always #(CYCLE/2.0) clk = ~clk;

//---------------------------------------------------------------------
//  Simulation
//---------------------------------------------------------------------
initial begin
	file_in = $fopen(INPUT_PATH, "r");
	file_out = $fopen(OUTPUT_PATH, "r");
	file_num = $fopen(PATNUM_PATH, "r");
	fscanf_int = $fscanf(file_num, "%d", PAT_NUM);	        
    $display("WORD_NUM = %d, cycle time = %d", WORD_NUM, `CYCLE_TIME);

	reset_task;
    total_latency = 0;
    total_cycles = 0;
	repeat(4) @(posedge clk);
	for (i_pat = 0; i_pat < PAT_NUM; i_pat = i_pat + 1)begin
        input_task;
        if ((1 << logn_gold) >= WORD_NUM) begin
            for (i_out=0; i_out<((1 << logn_gold)*xlen_gold); i_out=i_out + 1) begin
                wait_out_task;
                if (i_out == 0) end_cycle = total_cycles;
                check_ans_task;
            end
        end
        else begin
            for (i_out=0; i_out<(WORD_NUM*xlen_gold); i_out=i_out + 1) begin
                wait_out_task;
                if (i_out%WORD_NUM < (1 << logn_gold)) begin
                    if (i_out == 0) end_cycle = total_cycles;
                    check_ans_task;
                end
                else 
	                @(posedge clk);
            end
        end
        
        latency = end_cycle - start_cycle;
        total_latency = total_latency + latency;

        $sformat(key_str, "%0d %0d", logn_gold, xlen_gold);
        if (pair_count.exists(key_str)) begin
            latency_sum[key_str] = latency_sum[key_str] + latency;
            pair_count[key_str] = pair_count[key_str] + 1;
        end else begin
            latency_sum[key_str] = latency;
            pair_count[key_str] = 1;
        end
        inf.mode = UNKNOWN;
        $display("\033[0;32mPASS PATTERN NO.%4d\033[0m, \033[0;33mLatency: %6d\033[0m, (logn, xlen) = (%2d, %3d)", i_pat+1, latency, logn_gold, xlen_gold);
		repeat($urandom_range(0, 4)) @(posedge clk);
	end
	YOU_PASS_task;
end

always @(posedge clk) total_cycles = total_cycles + 1;

//---------------------------------------------------------------------
//   Task
//---------------------------------------------------------------------
task reset_task; begin 
    rst_n = 'b1;
    inf.in_valid = 'b0;
    inf.mode = UNKNOWN;
    inf.in_data = 'bx;
    inf.len_valid = 'b0;
    inf.logn = 'bx;
    inf.xlen = 'bx;
	
    force clk = 0;
    #(1); rst_n = 0; 
    #(5); rst_n = 1;
    if(inf.out_valid !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("  'out_valid' should be 0 after initial RESET  at %8t   	  ",$time);
        $display("************************************************************");
        repeat(2) #(1);
        $finish;
    end
    if(inf.out_data !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("  'out_data' should be 0 after initial RESET  at %8t        ",$time);
        $display("************************************************************");
        repeat(2) #(1);
        $finish;
    end
	#(1); release clk;
end endtask

task input_task; begin
	inf.len_valid = 'b1;
    inf.mode = FALCON_1024;
    fscanf_int = $fscanf(file_out, "%d %d", logn_gold, xlen_gold);
    fscanf_int = $fscanf(file_in, "%d %d", logn_gold, xlen_gold);

    if ((1 << logn_gold) >= WORD_NUM) begin
        inf.logn = logn_gold;
        inf.xlen = xlen_gold;
        @(posedge clk);		
        inf.len_valid = 'b0;
        inf.logn = 'bx;
        inf.xlen = 'bx;
        repeat($urandom_range(0, 4)) @(posedge clk);
        
        for (i_in=0; i_in<((1 << logn_gold)*xlen_gold); i_in=i_in+1) begin
            if (i_in == 0) start_cycle = total_cycles;
            inf.in_valid = 1;
            fscanf_int = $fscanf(file_in, "%d", inf.in_data);
            @(posedge clk);
            inf.in_data = 'bx;
            inf.in_valid = 0;
            if (i_in % (1 << logn_gold) == (1 << logn_gold) - 1) begin
                repeat($urandom_range(1, 4)) @(posedge clk);
            end
        end
    end
    else begin
        inf.logn = $clog2(WORD_NUM);
        inf.xlen = xlen_gold;
        @(posedge clk);		
        inf.len_valid = 'b0;
        inf.logn = 'bx;
        inf.xlen = 'bx;
        repeat($urandom_range(0, 4)) @(posedge clk);
        
        for (i_in=0; i_in<(WORD_NUM*xlen_gold); i_in=i_in+1) begin
            if (i_in == 0) start_cycle = total_cycles;
            inf.in_valid = 1;
            if (i_in%WORD_NUM < (1 << logn_gold))
                fscanf_int = $fscanf(file_in, "%d", inf.in_data);
            else 
                inf.in_data = 'b0;
            @(posedge clk);
            inf.in_data = 'bx;
            inf.in_valid = 0;
            if (i_in % (1 << logn_gold) == (1 << logn_gold) - 1) begin
                repeat($urandom_range(1, 4)) @(posedge clk);
            end
        end
    end

end endtask

task wait_out_task; begin
	out_latency = 1;
	while(inf.out_valid !== 1'b1) begin
		if(out_latency > MAX_OUT_LATENCY) begin
            $display("***********************************************************");
            $display("                          FAIL!                          	 ");
            $display("         The execution latency are over %d cycles        	 ", MAX_OUT_LATENCY);
            $display("***********************************************************"); 
			repeat(2) @(posedge clk);
			$finish;
		end
		out_latency = out_latency + 1;
		@(posedge clk);
	end
end endtask

task check_ans_task; begin
    fscanf_int = $fscanf(file_out, "%d", out_data_gold);
    if(inf.out_data !== out_data_gold)begin
        $display("***********************************************************");     
        $display("                          FAIL!                          	 ");  
        $display("                word %3d, degree %3d                      ", (i_out/(1 << logn_gold)), (i_out%(1 << logn_gold)));  
        $display("                    Gold v = %4d                           ", out_data_gold);
        $display("                    Your v = %4d                           ", inf.out_data);
        $display("***********************************************************");    
        repeat(2) @(posedge clk);
        $finish;
    end
	@(posedge clk);
end endtask

task display_stats;
    typedef struct {
        int logn;
        int xlen;
        int count;
        longint total_latency;
    } stats_t;
    stats_t stats_q[$];
    stats_t temp_stats;
    integer logn_val, xlen_val;
    real avg_lat;
    int i, j;
begin
    $display ("-------------------------------------");
    $display ("           Average Latency           ");
    $display ("-------------------------------------");
    $display ("| logn | xlen | Count | Avg Latency |");
    $display ("-------------------------------------");

    foreach (pair_count[key]) begin
        logn_val = 0; xlen_val = 0;
        $sscanf(key, "%d %d", logn_val, xlen_val);
        
        temp_stats.logn = logn_val;
        temp_stats.xlen = xlen_val;
        temp_stats.count = pair_count[key];
        temp_stats.total_latency = latency_sum[key];
        
        stats_q.push_back(temp_stats);
    end

    for (i = 0; i < stats_q.size(); i++) begin
        for (j = 0; j < stats_q.size() - 1 - i; j++) begin
            if ( (stats_q[j].logn < stats_q[j+1].logn) || 
                 (stats_q[j].logn == stats_q[j+1].logn && stats_q[j].xlen > stats_q[j+1].xlen) ) begin
                temp_stats = stats_q[j];
                stats_q[j] = stats_q[j+1];
                stats_q[j+1] = temp_stats;
            end
        end
    end

    foreach(stats_q[k]) begin
        avg_lat = real'(stats_q[k].total_latency) / stats_q[k].count;
        $display ("|  %2d  |  %3d |  %3d  |  %9.2f  |", stats_q[k].logn, stats_q[k].xlen, stats_q[k].count, avg_lat);
    end
    $display ("-------------------------------------");
end
endtask

task YOU_PASS_task; 
begin
    $display ("--------------------------------------------------------------------");
    $display ("                         Congratulations!                           ");
    $display ("                  You have passed all patterns!                     ");
    $display ("                  Total execution cycles = %5d cycles               ", total_latency);
    $display ("--------------------------------------------------------------------");
    
    display_stats;

    repeat(2)@(posedge clk);
    $finish;
end endtask


endmodule
