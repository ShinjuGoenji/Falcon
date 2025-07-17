`ifdef RTL
    `define CYCLE_TIME 2.0
`endif
`ifdef GATE
    `define CYCLE_TIME 2.0
`endif

module PATTERN #(
    parameter logn = 9
)(
    // Output signals
    clk,
    rst_n,
    ena,
    f_valid,
    f,
    // Input signals
    s_valid,
    s
);

localparam n = 1 << logn;
localparam f_bit = (logn == 9) ? 7 : 6;
localparam s_bit = (logn == 9) ? 21 : 20;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg           		  clk;
output reg           		  rst_n;
output reg           		  ena;
output reg           		  f_valid;
output reg signed [f_bit-1:0] f;
  
input                		  s_valid;
input [s_bit-1:0]  			  s;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_out, file_num;

parameter MAX_OUT_LATENCY = 2000;
integer total_latency, out_latency;
integer random_delay;

integer i_pat, i_deg;
integer PAT_NUM;

integer fscanf_int;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------
reg [s_bit:0] golden_s, your_s;

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
	ena = 0;
	repeat(4) @(negedge clk);
	fscanf_int = $fscanf(file_num, "%d", PAT_NUM);	
	for (i_pat = 0; i_pat < PAT_NUM; i_pat = i_pat + 1)begin
		for (i_deg = 0; i_deg < n; i_deg = i_deg + 1) begin
			input_task;
			wait_out_task;
			total_latency = total_latency + out_latency;
			if (i_deg == n-1)
				check_ans_task;
		end
		$display("PASS PATTERN NO.%3d", i_pat);
		ena = 'b0;
		repeat($urandom_range(2, 4)) @(negedge clk);
	end
	YOU_PASS_task;
end

//---------------------------------------------------------------------
//   Task
//---------------------------------------------------------------------
task reset_task; begin 
    rst_n = 'b1;
    f_valid = 'b0;
    f = 'bx;
	
    force clk = 0;
    #CYCLE; rst_n = 0; 
    #CYCLE; rst_n = 1;
    if(s_valid !== 'b0 || s !== 0) begin 
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
	fscanf_int = $fscanf(file_in, "%d", f);	
	@(negedge clk);
	ena = 'b1;
	f_valid = 'b1;
end endtask

task wait_out_task; begin
	out_latency = 1;
	while(s_valid !== 1)begin
		if(out_latency === MAX_OUT_LATENCY + 1) begin
            $display("***********************************************************");    
            $display("*                          FAIL!                          *");
			$display("*         The execution latency are over %d cycles        *", MAX_OUT_LATENCY);
		    $display("***********************************************************"); 
			repeat(2) @(negedge clk);
			$finish;
		end
		@(negedge clk);
	end
end endtask

task check_out_valid_task; begin
	if(s_valid !== 0)begin
		$display("***********************************************************");     
        $display("*                          FAIL!                          *");
		$display("*  out_valid should not be raised when in_valid is high.  *");
		$display("***********************************************************");
		repeat(2) @(negedge clk);
		$finish;
	end
end endtask

task check_ans_task; begin
	if(s_valid == 1) begin
		fscanf_int = $fscanf(file_out, "%d", golden_s);	
		if(s !== golden_s)begin
            $display("***********************************************************");     
            $display("                          FAIL!                          	 ");  
            $display("                       Degree #%3d                    	 ", i_deg);
            $display("                      Golden answer                      	 ");
            $display("                      val = %d                    	     ", golden_s);
            $display("                       Your answer                       	 ");
            $display("                      val = %d                    		 ", s);
            $display("***********************************************************");    
                repeat(2) @(negedge clk);
                $finish;
		end
		ena = 'b0;
		f_valid = 'b0;
		f = 'bx;
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