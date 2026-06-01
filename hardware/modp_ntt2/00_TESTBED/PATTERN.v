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
    a_i,
    logn,
    p,
    p0i,
    isMQ,
    s_bus,
    // Input signals
    out_valid,
    a_o,
    tw_idx_bus
);

//---------------------------------------------------------------------
//   Parameter
//---------------------------------------------------------------------
localparam    P_WIDTH = 31;
localparam LOGN_WIDTH = 4;
localparam   LUT_SIZE = 1024;
localparam      MAX_N = 1 << MAX_LOGN;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
output reg                        clk;
output reg                        rst_n;
output reg                        in_valid;
output reg [P_WIDTH-1:0]          a_i;
output reg [LOGN_WIDTH-1:0]       logn;
output reg [P_WIDTH-1:0]          p;
output reg [P_WIDTH-1:0]          p0i;
output reg                        isMQ;
output reg [MAX_LOGN*P_WIDTH-1:0] s_bus;

input                                 out_valid;
input [P_WIDTH-1:0]                   a_o;
input [$clog2(LUT_SIZE)*MAX_LOGN-1:0] tw_idx_bus;

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter GM_PATH = "../00_TESTBED/gm.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";
integer file_in, file_out, file_num, file_gm;

parameter MAX_OUT_LATENCY = 2000;
integer total_latency, out_latency, pattern_latency;

integer i_pat, i_in_deg, i_delay, i_out_deg;
integer PAT_NUM;

integer fscanf_int;

//---------------------------------------------------------------------
//   REG & WIRE DECLARATION
//---------------------------------------------------------------------
reg [P_WIDTH-1:0]          a        [0:MAX_N-1];
reg [P_WIDTH-1:0]          golden_a [0:MAX_N-1];
reg [LOGN_WIDTH-1:0]       logn_gold;
wire [MAX_LOGN:0]           n;
reg [P_WIDTH-1:0]          p_gold;
reg [P_WIDTH-1:0]          p0i_gold;
reg                        isMQ_gold;

reg [P_WIDTH-1:0]          s        [0:MAX_LOGN-1];
reg [$clog2(LUT_SIZE)-1:0] tw_idx   [0:MAX_LOGN-1];
reg [P_WIDTH-1:0]          GM       [0:LUT_SIZE-1];

assign n = 1 << logn_gold;

genvar tw_idx_idx;
generate
    for (tw_idx_idx = 0; tw_idx_idx < MAX_LOGN; tw_idx_idx=tw_idx_idx+1) begin
        always @(*) begin
            tw_idx[tw_idx_idx] = tw_idx_bus[$clog2(LUT_SIZE)*(tw_idx_idx+1)-1:$clog2(LUT_SIZE)*tw_idx_idx];
        end
    end
endgenerate

genvar s_idx;
generate
    for (s_idx = 0; s_idx < MAX_LOGN; s_idx=s_idx+1) begin
        always @(*) begin
            s_bus[P_WIDTH*(s_idx+1)-1:P_WIDTH*s_idx] = s[s_idx];
        end
    end
endgenerate

genvar s_reg_idx;
generate
    for (s_reg_idx = 0; s_reg_idx < MAX_LOGN; s_reg_idx=s_reg_idx+1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n) begin
                s[s_reg_idx] <= 0;
            end
            else begin
                s[s_reg_idx] <= GM[tw_idx[s_reg_idx]];
            end
        end
    end
endgenerate

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
	file_gm = $fopen(GM_PATH, "r");
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
    logn = 'bx;
    p = 'bx;
    p0i = 'bx;
    isMQ = 'bx;
	s_bus = 'bx;
	
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


task read_pattern; 
reg [MAX_LOGN:0] tmp;
begin
    isMQ_gold = 1'b0;
    fscanf_int = $fscanf(file_in, "%d %d %d", logn_gold, p_gold, p0i_gold);
	for (i_in_deg = 0; i_in_deg < n; i_in_deg = i_in_deg + 1) 
		fscanf_int = $fscanf(file_in, "%d", a[i_in_deg]);
	for (i_in_deg = 0; i_in_deg < n; i_in_deg = i_in_deg + 1) 
		fscanf_int = $fscanf(file_out, "%d", golden_a[i_in_deg]);
    fscanf_int = $fscanf(file_gm, "%d", tmp);
	for (i_in_deg = 0; i_in_deg < tmp; i_in_deg = i_in_deg + 1) 
		fscanf_int = $fscanf(file_gm, "%d", GM[i_in_deg]);
	// $display("PAT NO. %3d\tlogn = %d, p = %d, p0i = %d", i_pat, logn_gold, p_gold, p0i_gold);
end endtask

task input_task; begin
	in_valid = 'b1;
	a_i = a[i_in_deg];
    logn = logn_gold;
	if (i_in_deg == 0) begin
		p = p_gold;
		p0i = p0i_gold;
        isMQ = isMQ_gold;
	end
	else begin
		p = 'bx;
		p0i = 'bx;
        isMQ = 'bx;
	end
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
        logn = 'bx;
		p = 'bx;
		p0i = 'bx;
        isMQ = 'bx;
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