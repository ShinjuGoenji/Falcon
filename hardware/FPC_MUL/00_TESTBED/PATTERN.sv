// `include "Usertype.sv"

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
    // Output Signals
    clk,
    rst_n,
    a_re,
    a_im,
    b_re,
    b_im,
    in_valid,
    // Input Signals
    d_re,
    d_im,
    out_valid
);
// import FALCON_Config::*;
//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg        clk;
output reg        rst_n;
output reg [63:0] a_re;
output reg [63:0] a_im;
output reg [63:0] b_re;
output reg [63:0] b_im;
output reg        in_valid;

input  [63:0] d_re;
input  [63:0] d_im;
input         out_valid;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_out, file_num;

parameter MAX_OUT_LATENCY = 200000;
integer total_latency, out_latency;
integer total_cycles, start_cycle, end_cycle;
// longint latency_sum [string];
// int pair_count [string];
// string key_str;

integer i_pat, i_in, i_out;
integer PAT_NUM;

integer fscanf_int;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------
integer opcode;
real a_re_in, a_im_in, b_re_in, b_im_in;
real d_re_gold;
real d_im_gold;

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

	reset_task;
    total_latency = 0;
    total_cycles = 0;
	repeat(4) @(posedge clk);
	for (i_pat = 0; i_pat < PAT_NUM; i_pat = i_pat + 1)begin
        input_task;
        wait_out_task;
        check_ans_task;
        total_latency = total_latency + out_latency;
        $display("\033[0;32mPASS PATTERN NO.%4d\033[0m, \033[0;33mLatency: %6d\033[0m", i_pat+1, out_latency);
	end
	YOU_PASS_task;
end

//---------------------------------------------------------------------
//   Task
//---------------------------------------------------------------------
task reset_task; begin 
    rst_n = 'b1;
    in_valid = 'b0;
    a_re = 'bx; a_im = 'bx; 
    b_re = 'bx; b_im = 'bx;
	
    force clk = 0;
    #(1); rst_n = 0; 
    #(5); rst_n = 1;
    if(out_valid !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("  'out_valid' should be 0 after initial RESET  at %8t (%d)  ",$time, out_valid);
        $display("************************************************************");
        repeat(2) #(1);
        $finish;
    end
    if(d_re !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("  'd_re' should be 0 after initial RESET  at %8t (%d)       ", $time, d_re);
        $display("************************************************************");
        repeat(2) #(1);
        $finish;
    end
    if(d_im !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("  'd_im' should be 0 after initial RESET  at %8t (%d)       ", $time, d_im);
        $display("************************************************************");
        repeat(2) #(1);
        $finish;
    end
	#(1); release clk;
end endtask

task input_task; begin
    in_valid = 1'b1;
    fscanf_int = $fscanf(file_in, "%e %e %e %e %d", a_re_in, a_im_in, b_re_in, b_im_in, opcode);
    a_re = $realtobits(a_re_in); 
    a_im = $realtobits(a_im_in); 
    b_re = $realtobits(b_re_in); 
    b_im = $realtobits(b_im_in);

    @(posedge clk);
    in_valid = 1'b0;
    a_re = 'bx; a_im = 'bx; 
    b_re = 'bx; b_im = 'bx;
end endtask

task wait_out_task; begin
	out_latency = 1;
	while(out_valid !== 1'b1) begin
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
    fscanf_int = $fscanf(file_out, "%e %e", d_re_gold, d_im_gold);
    if(d_re !== $realtobits(d_re_gold) || d_im !== $realtobits(d_im_gold))begin
        $display("***********************************************************");     
        $display("                          FAIL!                          	 ");  
        $display("                    Gold v = %e, %e                           ", d_re_gold, d_im_gold);
        $display("                    Your v = %e, %e                           ", $bitstoreal(d_re), $bitstoreal(d_im));
        $display("***********************************************************");    
        repeat(2) @(posedge clk);
        $finish;
    end
	@(posedge clk);
end endtask

task YOU_PASS_task; 
begin
    $display ("--------------------------------------------------------------------");
    $display ("                         Congratulations!                           ");
    $display ("                  You have passed all patterns!                     ");
    $display ("                  Total execution cycles = %5d cycles               ", total_latency);
    $display ("--------------------------------------------------------------------");

    repeat(2)@(posedge clk);
    $finish;
end endtask

// task display_stats;
//     typedef struct {
//         int logn;
//         int xlen;
//         int count;
//         longint total_latency;
//     } stats_t;
//     stats_t stats_q[$];
//     stats_t temp_stats;
//     integer logn_val, xlen_val;
//     real avg_lat;
//     int i, j;
// begin
//     $display ("-------------------------------------");
//     $display ("           Average Latency           ");
//     $display ("-------------------------------------");
//     $display ("| logn | xlen | Count | Avg Latency |");
//     $display ("-------------------------------------");

//     foreach (pair_count[key]) begin
//         logn_val = 0; xlen_val = 0;
//         $sscanf(key, "%d %d", logn_val, xlen_val);
        
//         temp_stats.logn = logn_val;
//         temp_stats.xlen = xlen_val;
//         temp_stats.count = pair_count[key];
//         temp_stats.total_latency = latency_sum[key];
        
//         stats_q.push_back(temp_stats);
//     end

//     for (i = 0; i < stats_q.size(); i++) begin
//         for (j = 0; j < stats_q.size() - 1 - i; j++) begin
//             if ( (stats_q[j].logn < stats_q[j+1].logn) || 
//                  (stats_q[j].logn == stats_q[j+1].logn && stats_q[j].xlen > stats_q[j+1].xlen) ) begin
//                 temp_stats = stats_q[j];
//                 stats_q[j] = stats_q[j+1];
//                 stats_q[j+1] = temp_stats;
//             end
//         end
//     end

//     foreach(stats_q[k]) begin
//         avg_lat = real'(stats_q[k].total_latency) / stats_q[k].count;
//         $display ("|  %2d  |  %3d |  %3d  |  %9.2f  |", stats_q[k].logn, stats_q[k].xlen, stats_q[k].count, avg_lat);
//     end
//     $display ("-------------------------------------");
// end
// endtask


endmodule
