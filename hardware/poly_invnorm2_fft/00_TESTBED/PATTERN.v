`ifdef RTL
    `define CYCLE_TIME 2.0
`elsif GATE
    `define CYCLE_TIME 2.0
`else
    `define CYCLE_TIME 2.0
`endif

module PATTERN #(
    parameter FLOAT_PRECISION = 64
)( 
    // Output signals
    clk, 
    rst_n,
    in_valid,
    a_re, a_im,
    b_re, b_im,
    // Input signals
    out_valid,
    d
);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg           	   		  clk;
output reg           	   		  rst_n;
output reg                        in_valid;
output reg  [FLOAT_PRECISION-1:0] a_re, a_im;
output reg  [FLOAT_PRECISION-1:0] b_re, b_im;

input                  	  	out_valid;
input [FLOAT_PRECISION-1:0] d;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_idx, file_out, file_num;

parameter PIPLINE_STAGES = 4;
parameter MAX_OUT_LATENCY = PIPLINE_STAGES + 10;
integer out_latency[0:PIPLINE_STAGES-1];

integer i_pat, i_stage;
integer PAT_NUM, out_cnt;

integer fscanf_int;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------

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
	fscanf_int = $fscanf(file_num, "%d", PAT_NUM);	

	reset_task;
	repeat(4) @(negedge clk);
	for (i_stage = 0; i_stage < PIPLINE_STAGES; i_stage = i_stage + 1)
		out_latency[i_stage] = -1;

	for (i_pat = 0; i_pat < PAT_NUM; i_pat = i_pat + 1)begin
		input_task;
		repeat($urandom_range(0, 4)) @(negedge clk);

		// while (i_in_deg < n) begin
		// 	if (i_in_deg != n)
		// 		input_delay;
		// end		
		// while (i_out_deg < n) begin
		// 	@(negedge clk);		
		// 	in_valid = 'b0;
		// 	wait_out_task;
		// 	pattern_latency = pattern_latency + out_latency;			
		// 	total_latency = total_latency + out_latency;
		// end
		// $display("PASS PATTERN NO.%4d, %4d CYCLES", i_pat+1, pattern_latency);
	end
	YOU_PASS_task;
end

always @(negedge clk) begin
	check_ans_task;
end

//---------------------------------------------------------------------
//   Task
//---------------------------------------------------------------------
task reset_task; begin 
    rst_n = 'b1;
    in_valid = 'b0;
    a_re = 'bx;
	a_im = 'bx;
    b_re = 'bx;
	b_im = 'bx;
	
    force clk = 0;
    #CYCLE; rst_n = 0; 
    #(CYCLE * 2); rst_n = 1;
    if(out_valid !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("  'out_valid' should be 0 after initial RESET  at %8t   	  ",$time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
    if(d !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("  	'd' should be 0 after initial RESET  at %8t   	  	  ",$time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
	#CYCLE; release clk;
end endtask

task input_task;
	reg [FLOAT_PRECISION-1:0] a_re_pat;
	reg [FLOAT_PRECISION-1:0] a_im_pat;
	reg [FLOAT_PRECISION-1:0] b_re_pat;
	reg [FLOAT_PRECISION-1:0] b_im_pat;
	begin
	fscanf_int = $fscanf(file_in, "%h %h %h %h", a_re_pat, a_im_pat, b_re_pat, b_im_pat);
	in_valid = 'b1;
	a_re = a_re_pat;
	a_im = a_im_pat;
	b_re = b_re_pat;
	b_im = b_im_pat;
	for (i_stage = 0; i_stage < PIPLINE_STAGES; i_stage = i_stage + 1)
		if (out_latency[i_stage] == -1) begin
			out_latency[i_stage] = 0;
			break;
		end

	@(negedge clk);		
	in_valid = 'b0;
	a_re = 'bx;
	a_im = 'bx;
	b_re = 'bx;
	b_im = 'bx;
end endtask

// task wait_out_task; begin
// 	out_latency = 1;
// 	while(out_valid !== 1 && i_out_deg < n) begin
// 		if(out_latency === MAX_OUT_LATENCY + 1) begin
//             $display("***********************************************************");    
//             $display("                          FAIL!                          	 ");
// 			$display("         The execution latency are over %d cycles        	 ", MAX_OUT_LATENCY);
// 		    $display("***********************************************************"); 
// 			repeat(2) @(negedge clk);
// 			$finish;
// 		end
// 		out_latency = out_latency + 1;
// 		@(negedge clk);
// 	end
// end endtask

task check_out_valid_task; begin
	if(out_valid !== 0) begin
		$display("***********************************************************");     
        $display("*                          FAIL!                          *");
		$display("*  out_valid should not be raised when in_valid is high.  *");
		$display("***********************************************************");
		repeat(2) @(negedge clk);
		$finish;
	end
end endtask

task check_ans_task; 
	reg [FLOAT_PRECISION-1:0] d_pat;
	begin
	for (i_stage = 0; i_stage < PIPLINE_STAGES; i_stage = i_stage + 1)
		out_latency[i_stage] = out_latency[i_stage] + 1;
	if (out_latency[0] > MAX_OUT_LATENCY) begin
		$display("***********************************************************");    
		$display("                          FAIL!                          	 ");
		$display("         The execution latency are over %d cycles        	 ", MAX_OUT_LATENCY);
		$display("***********************************************************"); 
		repeat(2) @(negedge clk);
		$finish;
	end

	if(out_valid === 1) begin
		fscanf_int = $fscanf(file_out, "%h", d_pat);
		if(d !== d_pat)begin
            $display("***********************************************************");     
            $display("                          FAIL!                          	 ");  
            $display("                      Golden answer                      	 ");
            $display("              			  %f                    	     ", $bitstoreal(d_pat));
            $display("                       Your answer                       	 ");
            $display("              			  %f                    	     ", $bitstoreal(d));
            $display("***********************************************************");    
			repeat(2) @(negedge clk);
			$finish;
		end
		for (i_stage = 0; i_stage < PIPLINE_STAGES - 1; i_stage = i_stage + 1)
			out_latency[i_stage] = out_latency[i_stage + 1];
		out_latency[PIPLINE_STAGES - 1] = -1;
	end
end endtask

task YOU_PASS_task; begin
    $display ("--------------------------------------------------------------------");
    $display ("                         Congratulations!                           ");
    $display ("                  You have passed all patterns!                     ");
	$display ("                  Your clock period = %.1f ns                       ", CYCLE);
    $display ("--------------------------------------------------------------------");     
    repeat(2)@(negedge clk);
    $finish;
end endtask

endmodule