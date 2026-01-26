`include "Usertype.sv"

program automatic PATTERN (
    input clk,
    output logic rst_n,
    TOP_INF.PATTERN inf
);
import usertype::*;
// //---------------------------------------------------------------------
// //   Parameter & Integer
// //---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_out, file_num;

parameter MAX_OUT_LATENCY = 4000;
integer total_latency, out_latency;

integer i_pat, i_in, i_out;
integer PAT_NUM;

integer fscanf_int;

// //---------------------------------------------------------------------
// //   REG & WIRE DECLARATION
// //---------------------------------------------------------------------
logic [NUM_WIDTH-1:0] num_gold;
logic [XLEN_WIDTH-1:0] xlen_gold;
uint31_t out_data_gold;

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
	repeat(4) @(posedge clk);
	for (i_pat = 0; i_pat < PAT_NUM; i_pat = i_pat + 1)begin
        input_task;
        for (i_out=0; i_out<(num_gold*xlen_gold); i_out=i_out + 1) begin
            wait_out_task;
            check_ans_task;
        end
		$display("PASS PATTERN NO.%4d", i_pat+1);
		repeat($urandom_range(0, 4)) @(posedge clk);
	end
	YOU_PASS_task;
end

// //---------------------------------------------------------------------
// //   Task
// //---------------------------------------------------------------------
task reset_task; begin 
    rst_n = 'b1;
    inf.in_valid = 'b0;
    inf.in_data = 'bx;
    inf.len_valid = 'b0;
    inf.num = 'bx;
    inf.xlen = 'bx;
	
    force clk = 0;
    #(1); rst_n = 0; 
    #(5); rst_n = 1;
    if(inf.out_valid !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("  'out_valid' should be 0 after initial RESET  at %8t   	 ",$time);
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
    fscanf_int = $fscanf(file_out, "%d %d", num_gold, xlen_gold);
    fscanf_int = $fscanf(file_in, "%d %d", num_gold, xlen_gold);
    num_gold = (1 << num_gold);
    inf.num = num_gold;
    inf.xlen = xlen_gold;
	@(posedge clk);		
    inf.len_valid = 'b0;
    inf.num = 'bx;
    inf.xlen = 'bx;
    repeat($urandom_range(0, 4)) @(posedge clk);


    for (i_in=0; i_in<(num_gold*xlen_gold); i_in=i_in+1) begin
        inf.in_valid = 1;
        fscanf_int = $fscanf(file_in, "%d", inf.in_data);
        @(posedge clk);
        inf.in_data = 'bx;
        inf.in_valid = 0;
        if (i_in % num_gold == num_gold - 1) begin
            repeat($urandom_range(1, 4)) @(posedge clk);
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
        $display("                 word %3d, degree %3d                      ", (i_out/num_gold), (i_out%num_gold));  
        $display("                    Gold v = %4d                           ", out_data_gold);
        $display("                    Your v = %4d                           ", inf.out_data);
        $display("***********************************************************");    
        repeat(2) @(posedge clk);
        $finish;
    end
	@(posedge clk);
end endtask

task YOU_PASS_task; begin
    $display ("--------------------------------------------------------------------");
    $display ("                         Congratulations!                           ");
    $display ("                  You have passed all patterns!                     ");
    $display ("                  Your execution cycles = %5d cycles                ", total_latency);
    $display ("--------------------------------------------------------------------");     
    repeat(2)@(posedge clk);
    $finish;
end endtask


endprogram