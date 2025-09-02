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

parameter MAX_OUT_LATENCY = 2000;
integer total_latency, out_latency;

integer i_pat, i_delay;
integer PAT_NUM, out_cnt;

integer fscanf_int;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------
// reg [FLOAT_PRECISION-1:0] f_re [0:n-1], f_im[0:n-1];
// reg [FLOAT_PRECISION-1:0] s_index [0:n-1];
// reg [FLOAT_PRECISION-1:0] golden_fo_re [0:n-1], golden_fo_im [0:n-1];
// reg [FLOAT_PRECISION-1:0] your_fo_re [0:n-1], your_fo_im [0:n-1];

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
	total_latency = 0;
	repeat(4) @(negedge clk);
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


task read_pattern; begin
	for (i_in_deg = 0; i_in_deg < n; i_in_deg = i_in_deg + 1) 
		fscanf_int = $fscanf(file_in, "%h", f_re[i_in_deg]);
	for (i_in_deg = 0; i_in_deg < n; i_in_deg = i_in_deg + 1) 
		fscanf_int = $fscanf(file_in, "%h", f_im[i_in_deg]);
	for (i_in_deg = 0; i_in_deg < n; i_in_deg = i_in_deg + 1) 
		fscanf_int = $fscanf(file_out, "%h", golden_fo_re[i_in_deg]);
	for (i_in_deg = 0; i_in_deg < n; i_in_deg = i_in_deg + 1) 
		fscanf_int = $fscanf(file_out, "%h", golden_fo_im[i_in_deg]);
	for (i_in_deg = 0; i_in_deg < n; i_in_deg = i_in_deg + 1) 
		fscanf_int = $fscanf(file_idx, "%d", s_index[i_in_deg]);
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
	@(negedge clk);		
	in_valid = 'b0;
	a_re = 'bx;
	a_im = 'bx;
	b_re = 'bx;
	b_im = 'bx;
end endtask

task input_delay; begin
	integer DELAY_NUM;
	// DELAY_NUM = $urandom_range(2, 4);
	DELAY_NUM = 0;
	for (i_delay = 0; i_delay < DELAY_NUM; i_delay=i_delay+1) begin
		in_valid = 'b0;
		fi_re = 'bx;
		fi_im = 'bx;
		@(negedge clk);
end
end endtask

task wait_out_task; begin
	out_latency = 1;
	while(out_valid !== 1 && i_out_deg < n) begin
		if(out_latency === MAX_OUT_LATENCY + 1) begin
            $display("***********************************************************");    
            $display("                          FAIL!                          	 ");
			$display("         The execution latency are over %d cycles        	 ", MAX_OUT_LATENCY);
		    $display("***********************************************************"); 
			repeat(2) @(negedge clk);
			$finish;
		end
		out_latency = out_latency + 1;
		@(negedge clk);
	end
end endtask

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

task check_ans_task; begin
	if(out_valid == 1) begin
		// $display("\tOUT DEGREE %3d\tRe = %f, Im = %f", i_out_deg, $bitstoreal(golden_fo_re[i_out_deg]), $bitstoreal(golden_fo_im[i_out_deg]));
		if(fo_re !== golden_fo_re[i_out_deg] || fo_im !== golden_fo_im[i_out_deg])begin
            $display("***********************************************************");     
            $display("                          FAIL!                          	 ");  
            $display("                  Degree #%3d (%8t)                   	 ", i_out_deg, $time);
            $display("                      Golden answer                      	 ");
            $display("              Re = %f, Im = %f                    	     ", $bitstoreal(golden_fo_re[i_out_deg]), $bitstoreal(golden_fo_im[i_out_deg]));
            $display("                       Your answer                       	 ");
            $display("              Re = %f, Im = %f                    	     ", $bitstoreal(fo_re), $bitstoreal(fo_im));
            $display("***********************************************************");    
                repeat(2) @(negedge clk);
                $finish;
		end
		i_out_deg = i_out_deg + 1;
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