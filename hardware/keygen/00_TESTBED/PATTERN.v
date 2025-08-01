`ifdef RTL
    `define CYCLE_TIME 20.0
`endif
`ifdef GATE
    `define CYCLE_TIME 20.0
`endif

module PATTERN(
    // Output signals
    clk,
    rst_n,
    in_valid,
    rng,
    // Input signals
    out_valid,
    val
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg          clk;
output reg          rst_n;
output reg          in_valid;
output reg [63:0]   rng;

input               out_valid;
input      [31:0]   val;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_out, file_num;

parameter MAX_OUT_LATENCY = 2000;
integer total_latency, out_latency;

integer i_pat;
integer PAT_NUM;

integer fscanf_int;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------
reg	[63:0] rng_1, rng_2;
reg signed [31:0] golden_val, your_val;

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
	repeat(4) @(negedge clk);
	for (i_pat = 0; i_pat < PAT_NUM; i_pat = i_pat + 1)begin
		input_task;
		wait_out_task;
		total_latency = total_latency + out_latency;
		check_ans_task;
		$display("PASS PATTERN NO.%4d", i_pat);
		repeat($urandom_range(2, 4)) @(negedge clk);
	end
	YOU_PASS_task;
end

//---------------------------------------------------------------------
//   Task
//---------------------------------------------------------------------
task reset_task; begin 
    rst_n = 'b1;
    in_valid = 'b0;
    rng = 'bx;
	
    force clk = 0;
    #CYCLE; rst_n = 0; 
    #CYCLE; rst_n = 1;
    if(out_valid !== 'b0 || val !== 0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                              ");    
        $display("*  Output signal should be 0 after initial RESET  at %8t   *",$time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
	#CYCLE; release clk;
end endtask


task input_task; begin
	fscanf_int = $fscanf(file_in, "%d %d", rng_1, rng_2);	
	fscanf_int = $fscanf(file_out, "%d", golden_val);	
	@(negedge clk);
	in_valid = 'b1;
	rng = rng_1;
	check_out_valid_task;
	@(negedge clk);
	rng = rng_2;
	check_out_valid_task;
	@(negedge clk);
		
    in_valid = 'b0;
    rng = 'bx;
	@(negedge clk);
end endtask

task wait_out_task; begin
	out_latency = 1;
	while(out_valid !== 1)begin
		if(out_latency === MAX_OUT_LATENCY + 1) begin
            $display("***********************************************************");    
            $display("*                          FAIL!                          *");
			$display("*         The execution latency are over %d cycles        *", MAX_OUT_LATENCY);
		    $display("***********************************************************"); 
			repeat(2) @(negedge clk);
			$finish;
		end
		out_latency = out_latency + 1;
		@(negedge clk);
	end
end endtask

task check_out_valid_task; begin
	if(out_valid !== 0)begin
		$display("***********************************************************");     
        $display("*                          FAIL!                          *");
		$display("*  out_valid should not be raised when in_valid is high.  *");
		$display("***********************************************************");
		repeat(2) @(negedge clk);
		$finish;
	end
end endtask

task check_ans_task; begin
	while(out_valid == 1) begin
		if(val !== golden_val)begin
            $display("***********************************************************");     
            $display("*                          FAIL!                          *");
            $display("*                      Golden answer                      *");
            $display("*                    val = %11d                    *", golden_val);
            $display("*                       Your answer                       *");
            $display("*                    val = %11d                    *", val);
            $display("***********************************************************");    
                repeat(2) @(negedge clk);
                $finish;
		end
		@(negedge clk);
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