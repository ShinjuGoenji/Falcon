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
    x_i,
    y_i,
    // Input signals
    out_valid,
    z_o
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam Q_WIDTH = 14;

parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
integer file_in, file_out;

parameter PIPLINE_STAGES = 40;
parameter MAX_OUT_LATENCY = PIPLINE_STAGES + 200;
parameter PAT_NUM = 12638;

integer out_latency[0:PIPLINE_STAGES-1];
integer pat_cnt;

integer i_pat, i_stage;

integer fscanf_int;


//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg               clk;
output reg               rst_n;
output reg               in_valid;
output reg [Q_WIDTH-1:0] x_i;
output reg [Q_WIDTH-1:0] y_i;

input                    out_valid;
input      [Q_WIDTH-1:0] z_o;

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

	reset_task;
	repeat(4) @(negedge clk);
	for (i_stage = 0; i_stage < PIPLINE_STAGES; i_stage = i_stage + 1)
		out_latency[i_stage] = -1;
	pat_cnt = 0;

	for (i_pat = 0; i_pat < PAT_NUM; i_pat = i_pat + 1)begin
		input_task;
		// repeat(0) @(negedge clk);
		repeat($urandom_range(0, 4)) @(negedge clk);
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
    x_i = 'bx;
	y_i = 'bx;
	
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
    if(z_o !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("  	'z_o' should be 0 after initial RESET  at %8t   	  ",$time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
	#CYCLE; release clk;
end endtask

task input_task;
	reg [Q_WIDTH-1:0] x_i_pat;
	reg [Q_WIDTH-1:0] y_i_pat;
	reg done;
	begin
	fscanf_int = $fscanf(file_in, "%d %d", x_i_pat, y_i_pat);
	in_valid = 'b1;
	x_i = x_i_pat;
	y_i = y_i_pat;
	done = 0;
	for (i_stage = 0; i_stage < PIPLINE_STAGES && !done; i_stage = i_stage + 1)
		if (out_latency[i_stage] == -1) begin
			out_latency[i_stage] = 0;
			done = 1;
		end

	@(negedge clk);		
	in_valid = 'b0;
    x_i = 'bx;
	y_i = 'bx;
end endtask

task check_ans_task; 
	reg [Q_WIDTH-1:0] z_o_pat;
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
		fscanf_int = $fscanf(file_out, "%d", z_o_pat);
		if(z_o !== z_o_pat)begin
            $display("***********************************************************");     
            $display("                          FAIL!                          	 ");  
            $display("                      Golden answer                      	 ");
            // $display("              			  %d                    	     ", $bitstoreal(z_o_pat));
            $display("                       Your answer                       	 ");
            // $display("              			  %d                    	     ", $bitstoreal(z_o));
            $display("***********************************************************");    
			repeat(2) @(negedge clk);
			$finish;
		end
		else begin
			pat_cnt = pat_cnt + 1;
			$display("PASS PATTERN NO.%4d", pat_cnt);
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
