`ifdef RTL
    `define CYCLE_TIME 2.0
`elsif GATE
    `define CYCLE_TIME 2.0
`else
    `define CYCLE_TIME 2.0
`endif

module PATTERN #(
    parameter logn = 9
)(
    // Output signals
    clk,
    rst_n,
    in_valid,
    a_i,
    // Input signals
    out_valid,
    a_o
);

localparam n = 1 << logn;
localparam Q_WIDTH = 14;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg               clk;
output reg               rst_n;
output reg               in_valid;
output reg [Q_WIDTH-1:0] a_i;

input 	                 out_valid;
input 	   [Q_WIDTH-1:0] a_o;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter INDEX_PATH  = "../00_TESTBED/index.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_out, file_num;

parameter MAX_OUT_LATENCY = 2000;
integer total_latency, out_latency, pattern_latency;

integer i_pat, i_in_deg, i_delay, i_out_deg;
integer PAT_NUM;

integer fscanf_int;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------
reg [Q_WIDTH-1:0] a [0:n-1];
reg [Q_WIDTH-1:0] golden_a [0:n-1];
reg [Q_WIDTH-1:0] your_a [0:n-1];

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
		read_pattern;
		i_in_deg = 0;
		i_out_deg = 0;
		pattern_latency = 0;
		while (i_in_deg < n) begin
			input_task;
			if (i_in_deg != n)
				input_delay;
		end		
		in_valid = 'b0;
		a_i = 'bx;
		while (i_out_deg < n) begin
			@(negedge clk);		
			in_valid = 'b0;
			wait_out_task;
			pattern_latency = pattern_latency + out_latency;			
			total_latency = total_latency + out_latency;
		end
		$display("PASS PATTERN NO.%4d, %4d CYCLES", i_pat+1, pattern_latency);
		repeat($urandom_range(2, 4)) @(negedge clk);
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
    a_i = 'bx;
	
    force clk = 0;
    #CYCLE; rst_n = 0; 
    #(CYCLE * 5); rst_n = 1;
    if(out_valid !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("  'out_valid' should be 0 after initial RESET  at %8t   	  ",$time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
    if(a_o !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("    'a_o' should be 0 after initial RESET  at %8t           ",$time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
	#CYCLE; release clk;
end endtask


task read_pattern; begin
	for (i_in_deg = 0; i_in_deg < n; i_in_deg = i_in_deg + 1) 
		fscanf_int = $fscanf(file_in, "%d", a[i_in_deg]);
	for (i_in_deg = 0; i_in_deg < n; i_in_deg = i_in_deg + 1) 
		fscanf_int = $fscanf(file_out, "%d", golden_a[i_in_deg]);
end endtask

task input_task; begin
	in_valid = 'b1;
	a_i = a[i_in_deg];
	// $display("\tIN  DEGREE %3d\tRe = %f, Im = %f", i_in_deg, $bitstoreal(fi_re), $bitstoreal(fi_im));
	i_in_deg = i_in_deg + 1;
	@(negedge clk);		
end endtask

task input_delay; 
	integer DELAY_NUM;
	begin
	// DELAY_NUM = $urandom_range(2, 4);
	DELAY_NUM = 0;
	for (i_delay = 0; i_delay < DELAY_NUM; i_delay=i_delay+1) begin
		in_valid = 'b0;
		a_i = 'bx;
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

task check_ans_task; begin
	if(out_valid == 1) begin
		// $display("\tOUT DEGREE %3d\tRe = %f, Im = %f", i_out_deg, $bitstoreal(golden_fo_re[i_out_deg]), $bitstoreal(golden_fo_im[i_out_deg]));
		if(a_o !== golden_a[i_out_deg])begin
            $display("***********************************************************");     
            $display("                          FAIL!                          	 ");  
            $display("                  Degree #%3d (%8t)                   	 ", i_out_deg, $time);
            $display("                       Gold = %5d                    	     ", golden_a[i_out_deg]);
            $display("                       Your = %5d                    	     ", a_o);
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