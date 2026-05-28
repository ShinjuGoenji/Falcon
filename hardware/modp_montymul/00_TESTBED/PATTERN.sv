`ifdef RTL
    `define CYCLE_TIME 1.2
`elsif GATE
    `define CYCLE_TIME 1.2
`else
    `define CYCLE_TIME 1.2
`endif

module PATTERN #(
    parameter MASTER_NUM = 1
)(
    // Output signals
    clk,
    rst_n,
    in_valid,
    a,
    b,
    p,
    p0i,
    isMQ,
    i_bus,
    // Input signals
    out_valid,
    d,
    o_bus
);

//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------
import FALCON_Config::*;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg                         clk;
output reg                         rst_n;
output reg                         in_valid;
output reg [P_WIDTH-1:0]           a;
output reg [P_WIDTH-1:0]           b;
output reg [P_WIDTH-1:0]           p;
output reg [P_WIDTH-1:0]           p0i;
output reg                         isMQ;
output reg [$clog2(MASTER_NUM)-1:0] i_bus;
    
input                          out_valid;
input [P_WIDTH-1:0]            d;
input [$clog2(MASTER_NUM)-1:0] o_bus;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
// parameter INPUT_PATH  = "../00_TESTBED/input.txt";
// parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
parameter INPUT_PATH  = "../00_TESTBED/input_64.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output_64.txt";
integer file_in, file_out, file_num;

parameter MAX_OUT_LATENCY = 1000;
integer total_latency, out_latency;

integer i_pat;
integer PAT_NUM;

integer fscanf_int;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------

reg [P_WIDTH-1:0] d_gold;

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
    i_pat = 0;
	repeat(4) @(posedge clk);
    for (i_pat = 0; i_pat < PAT_NUM; i_pat = i_pat + 1) begin 
        input_task;
        wait_out_task;
        check_ans_task;
        total_latency = total_latency + out_latency;
		$display("PASS NO.%4d", i_pat + 1);
	    @(posedge clk);		
		// repeat($urandom_range(2, 4)) @(posedge clk);
	end
	YOU_PASS_task;
end

//---------------------------------------------------------------------
//   Task
//---------------------------------------------------------------------
task reset_task; begin 
    rst_n = 'b1;
    in_valid = 'b0;
    a = 'bx;
    b = 'bx;
    p = 'bx;
    p0i = 'bx;
    isMQ = 'bx;
    i_bus = 'bx;
	
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
    if(d !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("     'd' should be 0 after initial RESET  at %8t            ",$time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
    if(o_bus !== 'b0) begin 
        $display("************************************************************");  
        $display("                          FAIL!                             ");    
        $display("     'o_bus' should be 0 after initial RESET  at %8t            ",$time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
	#CYCLE; release clk;
end endtask

task input_task; begin
    in_valid = 'b1;
    isMQ = 'b0;
    i_bus = 'b0;
    fscanf_int = $fscanf(file_in, "%d %d %d %d", a, b, p, p0i);
    @(posedge clk);
    in_valid = 'b0;
    a = 'bx;
    b = 'bx;
    p = 'bx;
    p0i = 'bx;
    isMQ = 'bx;
    i_bus = 'bx;
    
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
		@(posedge clk);
	end
end endtask

task check_ans_task; begin
    if(out_valid === 1) begin
        fscanf_int = $fscanf(file_out, "%d", d_gold);
        if(d !== d_gold)begin
            $display("***********************************************************");     
            $display("                          FAIL!                          	 ");  
            $display("                       Gold = %5d                    	     ", d_gold);
            $display("                       Your = %5d                    	     ", d);
            $display("***********************************************************");    
            repeat(2) @(posedge clk);
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
    repeat(2)@(posedge clk);
    $finish;
end endtask

endmodule