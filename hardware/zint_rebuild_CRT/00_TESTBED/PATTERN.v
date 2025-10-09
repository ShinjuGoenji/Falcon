`ifdef RTL
    `define CYCLE_TIME 2.0
`elsif GATE
    `define CYCLE_TIME 2.0
`else
    `define CYCLE_TIME 2.0
`endif

module PATTERN #(
    parameter MAX_LOGN = 9
)(
    // Output signals
    clk,
    rst_n,
    in_valid,
    logn,
    g,
    p,
    p0i,
    mode,
    // Input signals
    out_valid_gm,
    v_gm,
    gm,
    out_valid_igm,
    v_igm,
    igm
);

//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------
localparam P_WIDTH = 31;
localparam LOGN_WIDTH = 4;
`ifdef FALCON1024
    localparam LUT_SIZE = 1024;
    localparam LUT_WIDTH = $clog2(LUT_SIZE);
`else
    localparam LUT_SIZE = 512;
    localparam LUT_WIDTH = $clog2(LUT_SIZE);
`endif

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg                  clk;
output reg                  rst_n;
output reg                  in_valid;
output reg [LOGN_WIDTH-1:0] logn;
output reg [P_WIDTH-1:0]    g;
output reg [P_WIDTH-1:0]    p;
output reg [P_WIDTH-1:0]    p0i;
output reg [1:0]            mode;

input                       out_valid_gm;
input      [LUT_WIDTH-1:0]  v_gm;
input      [P_WIDTH-1:0]    gm;
input                       out_valid_igm;
input      [LUT_WIDTH-1:0]  v_igm;
input      [P_WIDTH-1:0]    igm;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_GM_PATH = "../00_TESTBED/output_gm.txt";
parameter OUTPUT_IGM_PATH = "../00_TESTBED/output_igm.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_out_gm, file_out_igm, file_num;

parameter MAX_OUT_LATENCY = 2000;
integer total_latency, out_latency, pattern_latency;

integer i_pat, i_gm, i_igm;
integer PAT_NUM;

integer fscanf_int;

integer mode_gold;
//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------
reg [LOGN_WIDTH-1:0] logn_gold;
reg [LUT_WIDTH-1:0]  v_gm_gold;
reg [P_WIDTH-1:0]    gm_gold;
reg [LUT_WIDTH-1:0]  v_igm_gold;
reg [P_WIDTH-1:0]    igm_gold;

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
	file_out_gm = $fopen(OUTPUT_GM_PATH, "r");
	file_out_igm = $fopen(OUTPUT_IGM_PATH, "r");
	file_num = $fopen(PATNUM_PATH, "r");
	fscanf_int = $fscanf(file_num, "%d", PAT_NUM);	

	reset_task;
	total_latency = 0;
	repeat(4) @(posedge clk);
	for (i_pat = 0; i_pat < PAT_NUM; i_pat = i_pat + 1)begin
        // mode_gold = $urandom_range(0, 2);
        mode_gold = 0;

        input_task;
        i_gm = 0;
        i_igm = 0;
        while (1) begin
            wait_out_task;
            check_ans_task;
	        @(posedge clk);		
            if (mode_gold == 0 && i_gm == 1 << logn_gold && i_igm == 1 << logn_gold)
                break;
            if (mode_gold == 1 && i_gm == 1 << logn_gold)
                break;
            if (mode_gold == 2 && i_igm == 1 << logn_gold)
                break;
        end
		$display("PASS PATTERN NO.%4d", i_pat+1);
        in_valid = 'b0;
        logn = 'bx;
        g = 'bx;
        p = 'bx;
        p0i = 'bx;
        mode = 'bx;
		repeat($urandom_range(0, 4)) @(posedge clk);
	end
	YOU_PASS_task;
end

//---------------------------------------------------------------------
//   Task
//---------------------------------------------------------------------
task reset_task; begin 
    rst_n = 'b1;
    in_valid = 'b0;
    logn = 'bx;
    g = 'bx;
    p = 'bx;
    p0i = 'bx;
    mode = 'bx;
	
    force clk = 0;
    #CYCLE; rst_n = 0; 
    #(CYCLE * 5); rst_n = 1;
    // if(out_valid_gm !== 'b0) begin 
    //     $display("************************************************************");  
    //     $display("                          FAIL!                             ");    
    //     $display("  'out_valid_gm' should be 0 after initial RESET  at %8t   	  ",$time);
    //     $display("************************************************************");
    //     repeat(2) #CYCLE;
    //     $finish;
    // end
    // if(out_valid_igm !== 'b0) begin 
    //     $display("************************************************************");  
    //     $display("                          FAIL!                             ");    
    //     $display("  'out_valid_igm' should be 0 after initial RESET  at %8t   ",$time);
    //     $display("************************************************************");
    //     repeat(2) #CYCLE;
    //     $finish;
    // end
    // if(v_gm !== 'b0) begin 
    //     $display("************************************************************");  
    //     $display("                          FAIL!                             ");    
    //     $display("    'v_gm' should be 0 after initial RESET  at %8t          ",$time);
    //     $display("************************************************************");
    //     repeat(2) #CYCLE;
    //     $finish;
    // end
    // if(v_igm !== 'b0) begin 
    //     $display("************************************************************");  
    //     $display("                          FAIL!                             ");    
    //     $display("    'v_igm' should be 0 after initial RESET  at %8t          ",$time);
    //     $display("************************************************************");
    //     repeat(2) #CYCLE;
    //     $finish;
    // end
    // if(gm !== 'b0) begin 
    //     $display("************************************************************");  
    //     $display("                          FAIL!                             ");    
    //     $display("    'gm' should be 0 after initial RESET  at %8t          ",$time);
    //     $display("************************************************************");
    //     repeat(2) #CYCLE;
    //     $finish;
    // end
    // if(igm !== 'b0) begin 
    //     $display("************************************************************");  
    //     $display("                          FAIL!                             ");    
    //     $display("    'igm' should be 0 after initial RESET  at %8t          ",$time);
    //     $display("************************************************************");
    //     repeat(2) #CYCLE;
    //     $finish;
    // end
	#CYCLE; release clk;
end endtask

task input_task; begin
	in_valid = 'b1;
    fscanf_int = $fscanf(file_in, "%d %d %d %d", logn_gold, g, p, p0i);
    logn = logn_gold;
    mode = mode_gold;
	@(posedge clk);		
    in_valid = 'b0;
end endtask

task wait_out_task; begin
	out_latency = 1;
	while(1) begin
        if (mode_gold == 0 && (out_valid_gm === 1 || out_valid_igm === 1))
            break;
        if (mode_gold == 1 && out_valid_gm === 1)
            break;
        if (mode_gold == 2 && out_valid_igm === 1)
            break;
		if(out_latency === MAX_OUT_LATENCY + 1) begin
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
    if (mode_gold == 0 && out_valid_gm === 1) begin
        fscanf_int = $fscanf(file_out_gm, "%d %d", v_gm_gold, gm_gold);
		if(v_gm !== v_gm_gold || gm !== gm_gold)begin
            $display("***********************************************************");     
            $display("                          FAIL!                          	 ");  
            $display("                 Gold v = %4d, gm = %d                     ", v_gm_gold, gm_gold);
            $display("                 Your v = %4d, gm = %d                     ", v_gm, gm);
            $display("***********************************************************");    
                repeat(2) @(posedge clk);
                $finish;
		end
		i_gm = i_gm + 1;
	end
    if (mode_gold == 0 && out_valid_igm === 1) begin
        fscanf_int = $fscanf(file_out_igm, "%d %d", v_igm_gold, igm_gold);
		if(v_igm !== v_igm_gold || igm !== igm_gold)begin
            $display("***********************************************************");     
            $display("                          FAIL!                          	 ");  
            $display("                 Gold v = %4d, igm = %d                    ", v_igm_gold, igm_gold);
            $display("                 Your v = %4d, igm = %d                    ", v_igm, igm);
            $display("***********************************************************");    
                repeat(2) @(posedge clk);
                $finish;
		end
		i_igm = i_igm + 1;
	end
    if (mode_gold == 1 && out_valid_gm === 1) begin
        fscanf_int = $fscanf(file_out_gm, "%d %d", v_gm_gold, gm_gold);
        fscanf_int = $fscanf(file_out_igm, "%d %d", v_igm_gold, igm_gold);
		if(v_gm !== v_gm_gold || gm !== gm_gold)begin
            $display("***********************************************************");     
            $display("                          FAIL!                          	 ");  
            $display("                 Gold v = %4d, gm = %d                     ", v_gm_gold, gm_gold);
            $display("                 Your v = %4d, gm = %d                     ", v_gm, gm);
            $display("***********************************************************");    
                repeat(2) @(posedge clk);
                $finish;
		end
		i_gm = i_gm + 1;
	end
    if (mode_gold == 2 && out_valid_igm === 1) begin
        fscanf_int = $fscanf(file_out_gm, "%d %d", v_gm_gold, gm_gold);
        fscanf_int = $fscanf(file_out_igm, "%d %d", v_igm_gold, igm_gold);
		if(v_igm !== v_igm_gold || igm !== igm_gold)begin
            $display("***********************************************************");     
            $display("                          FAIL!                          	 ");  
            $display("                 Gold v = %4d, igm = %d                    ", v_igm_gold, igm_gold);
            $display("                 Your v = %4d, igm = %d                    ", v_igm, igm);
            $display("***********************************************************");    
                repeat(2) @(posedge clk);
                $finish;
		end
		i_igm = i_igm + 1;
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