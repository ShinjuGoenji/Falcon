`ifdef RTL
    `define CYCLE_TIME 2.0
`endif
`ifdef GATE
    `define CYCLE_TIME 2.0
`endif

module PATTERN #(
    parameter [3:0] logn = 9
)(
    // Output signals
    clk,
    rst_n,
    ena,
    rng_valid,
    rng,
    // Input signals
    rng_extract,
    f_valid,
    f
);

parameter n = 1 << (logn);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg           clk;
output reg           rst_n;
output reg           ena;
output reg           rng_valid;
output reg   [127:0] rng;
  
input                rng_extract;
input                f_valid;
input signed [7:0]   f;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_out, file_num;

parameter MAX_OUT_LATENCY = 5000;
integer total_latency, pattern_latency, out_latency;

integer i_pat;
integer PAT_NUM;
integer i_degree;

integer fscanf_int;

integer shake256_delay;

integer i;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------
reg	[63:0] rng_1, rng_2;
reg signed [8:0] golden_f, your_f;

//---------------------------------------------------------------------
//   Clock
//---------------------------------------------------------------------
real CYCLE = `CYCLE_TIME;
always	#(CYCLE/2.0) clk = ~clk;

//---------------------------------------------------------------------
//  Simulation
//---------------------------------------------------------------------
initial begin
	file_in = $fopen(INPUT_PATH, "r");
	file_out = $fopen(OUTPUT_PATH, "r");
	file_num = $fopen(PATNUM_PATH, "r");
	reset_task;
	total_latency = 0;
	fscanf_int = $fscanf(file_num, "%d", PAT_NUM);	
	fscanf_int = $fscanf(file_in, "%d %d", rng_1, rng_2);	
	shake256_delay = 0;
	ena = 0;
	check_shake256_extract_task;
	repeat(4) @(negedge clk);
	for (i_pat = 0; i_pat < PAT_NUM; i_pat = i_pat + 1)begin
		pattern_latency = 0;
		for (i_degree = 0; i_degree < n; i_degree = i_degree + 1) begin
			input_task;
			wait_out_task;
			pattern_latency = pattern_latency + out_latency;
			total_latency = total_latency + out_latency;
			check_ans_task;
		end
		ena = 'b0;
		$display("PASS PATTERN NO.%4d, %3d CYCLES", i_pat+1, pattern_latency);
		repeat($urandom_range(2, 4)) @(negedge clk);
	end
	YOU_PASS_task;
end

//---------------------------------------------------------------------
//   Task
//---------------------------------------------------------------------
task reset_task; begin 
    rst_n = 'b1;
    rng_valid = 'b0;
    rng = 'bx;
	
    force clk = 0;
    #CYCLE; rst_n = 0; 
    #CYCLE; rst_n = 1;
	#(10); 
    if(f_valid !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                              ");    
        $display("Output signal f_valid should be 0 after initial RESET  at %8t   ",$time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
	if(f !== 'b0) begin 
		$display("************************************************************");  
		$display("                          FAIL!                              ");    
		$display("Output signal f should be 0 after initial RESET  at %8t   ", $time);
		$display("************************************************************");
		repeat(2) #CYCLE;
		$finish;
	end
	#CYCLE; release clk;
end endtask


task input_task; begin
	fscanf_int = $fscanf(file_out, "%d", golden_f);	
	@(negedge clk);
	ena = 'b1;
end endtask

task wait_out_task; begin
	out_latency = 1;
	while(f_valid !== 1)begin
		if(out_latency === MAX_OUT_LATENCY + 1) begin
            $display("***********************************************************");    
            $display("*                          FAIL!                          *");
			$display("*         The execution latency are over %d cycles        *", MAX_OUT_LATENCY);
		    $display("***********************************************************"); 
			repeat(2) @(negedge clk);
			$finish;
		end
		if (rng_extract) begin
			// shake256_delay = $urandom_range(2, 4);
			shake256_delay = 0;
			fscanf_int = $fscanf(file_in, "%d %d", rng_1, rng_2);
			rng = 'bx;
			rng_valid = 'b0;	
		end
		check_shake256_extract_task;
		out_latency = out_latency + 1;
		@(negedge clk);
	end
end endtask

task check_shake256_extract_task; begin
	if(shake256_delay === 0)begin
		rng = {rng_2, rng_1};
		rng_valid = 'b1;
	end
	else begin
		shake256_delay = shake256_delay - 1;
	end
end endtask

task check_out_valid_task; begin
	if(f_valid !== 0)begin
		$display("***********************************************************");     
        $display("*                          FAIL!                          *");
		$display("*  out_valid should not be raised when in_valid is high.  *");
		$display("***********************************************************");
		repeat(2) @(negedge clk);
		$finish;
	end
end endtask

task check_ans_task; begin
	if(f_valid == 1) begin
		if(f !== golden_f)begin
			$display("***********************************************************");     
			$display("*                          FAIL!                          ");    
			$display("                        degree #%d                        ", i_degree);
			$display("                      Golden answer                       ");
			$display("                        val = %8d                         ", golden_f);
			$display("                       Your answer                        ");
			$display("                        val = %8d                         ", f);
			$display("***********************************************************");    
				repeat(2) @(negedge clk);
				$finish;
		end
		if (rng_extract) begin
			// shake256_delay = $urandom_range(2, 4);
			shake256_delay = 0;
			fscanf_int = $fscanf(file_in, "%d %d", rng_1, rng_2);
			rng = 'bx;
			rng_valid = 'b0;	
		end
		check_shake256_extract_task;
		// @(negedge clk);
	end
end endtask

task YOU_PASS_task; begin
    $display ("--------------------------------------------------------------------");
    $display ("                         Congratulations!                           ");
    $display ("                  You have passed all patterns!                     ");
    $display ("                  Your execution cycles = %5d cycles                ", total_latency);
	$display ("                  Your clock period = %.1f ns                       ", CYCLE);
    $display ("                  Total Latency = %.1f ns                           ", total_latency*CYCLE);
    $display ("--------------------------------------------------------------------");     
    repeat(2)@(negedge clk);
    $finish;
end endtask

endmodule