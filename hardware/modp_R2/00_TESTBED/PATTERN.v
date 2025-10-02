`ifdef RTL
    `define CYCLE_TIME 2.0
`elsif GATE
    `define CYCLE_TIME 2.0
`else
    `define CYCLE_TIME 2.0
`endif

module PATTERN (
    // Output signals
    clk,
    rst_n,
    in_valid,
    p,
    p0i,
    // Input signals
    out_valid,
    R2
);

//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------
localparam    P_WIDTH = 31;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg               clk;
output reg               rst_n;
output reg               in_valid;
output reg [P_WIDTH-1:0] p;
output reg [P_WIDTH-1:0] p0i;

input                    out_valid;
input      [P_WIDTH-1:0] R2;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_out, file_num;

parameter MAX_OUT_LATENCY = 2000;
integer total_latency, out_latency;

integer i_pat, i_delay;
integer PAT_NUM;

integer fscanf_int;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------
reg [P_WIDTH-1:0] R2_gold;

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
		wait_out_task;
        check_ans_task;
        total_latency = total_latency + out_latency;
		$display("PASS PATTERN NO.%4d, %4d CYCLES", i_pat + 1, total_latency);
		repeat($urandom_range(0, 4)) @(negedge clk);
	end
	YOU_PASS_task;
end

//---------------------------------------------------------------------
//   Task
//---------------------------------------------------------------------
task reset_task; begin 
    rst_n = 'b1;
    in_valid = 'b0;
    p = 'bx;
    p0i = 'bx;
	
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
    if(R2 !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("    'R2' should be 0 after initial RESET  at %8t            ",$time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
	#CYCLE; release clk;
end endtask

task input_task; begin
	in_valid = 'b1;
    fscanf_int = $fscanf(file_in, "%d %d", p, p0i);
    fscanf_int = $fscanf(file_out, "%d", R2_gold);
	@(negedge clk);		
    in_valid = 'b0;
    p = 'bx;
    p0i = 'bx;
end endtask

task wait_out_task; begin
	out_latency = 1;
	while(out_valid !== 1) begin
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
	if(out_valid === 1) begin
		if(R2 !== R2_gold)begin
            $display("***********************************************************");     
            $display("                          FAIL!                          	 ");  
            $display("                  Pattern #%5d (%8t)                   	 ", i_pat, $time);
            $display("                       Gold = %5d                    	     ", R2_gold);
            $display("                       Your = %5d                    	     ", R2);
            $display("***********************************************************");    
                repeat(2) @(negedge clk);
                $finish;
		end
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