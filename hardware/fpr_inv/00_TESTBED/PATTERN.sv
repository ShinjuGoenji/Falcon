`ifndef CYCLE_TIME
    `define CYCLE_TIME 1.2
`endif

module PATTERN (
    // Outputs to DUT
    output reg        clk,
    output reg        rst_n,
    output reg        in_valid,
    output reg [63:0] b,
    // Inputs from DUT
    input      [63:0] z,
    input             out_valid
);

//---------------------------------------------------------------------
//   Verdi debug
//---------------------------------------------------------------------
real dbg_b, dbg_z;
always @(*) begin
    dbg_b = $bitstoreal(b);
    dbg_z = $bitstoreal(z);
end

//---------------------------------------------------------------------
//   Parameters
//---------------------------------------------------------------------
parameter INPUT_PATH  = "../00_TESTBED/input.txt";
parameter OUTPUT_PATH = "../00_TESTBED/output.txt";
parameter PATNUM_PATH = "../00_TESTBED/PATNUM.txt";

parameter MAX_OUT_LATENCY = 1000;

integer file_in, file_out, file_num;
integer total_latency, out_latency;
integer total_cycles;
integer i_pat, PAT_NUM;
integer fscanf_int;

//---------------------------------------------------------------------
//   Gold variables
//---------------------------------------------------------------------
reg [63:0] z_gold;

//---------------------------------------------------------------------
//   Clock
//---------------------------------------------------------------------
real CYCLE = `CYCLE_TIME;
always #(CYCLE/2.0) clk = ~clk;

//---------------------------------------------------------------------
//   Simulation
//---------------------------------------------------------------------
initial begin
    file_in  = $fopen(INPUT_PATH,  "r");
    file_out = $fopen(OUTPUT_PATH, "r");
    file_num = $fopen(PATNUM_PATH, "r");
    fscanf_int = $fscanf(file_num, "%d", PAT_NUM);

    reset_task;
    total_latency = 0;
    total_cycles  = 0;
    repeat(4) @(posedge clk);

    for (i_pat = 0; i_pat < PAT_NUM; i_pat = i_pat + 1) begin
        input_task;
        wait_out_task;
        check_ans_task;
        total_latency = total_latency + out_latency;
        $display("\033[0;32mPASS PATTERN NO.%4d\033[0m, \033[0;33mLatency: %6d\033[0m",
                 i_pat+1, out_latency);
        repeat($urandom_range(0, 3)) @(posedge clk);
    end
    YOU_PASS_task;
end

always @(posedge clk) total_cycles = total_cycles + 1;

//---------------------------------------------------------------------
//   Tasks
//---------------------------------------------------------------------
task reset_task; begin
    rst_n    = 1'b1;
    in_valid = 1'b0;
    b        = 'bx;

    force clk = 0;
    #(1); rst_n = 0;
    #(5); rst_n = 1;
    if (out_valid !== 1'b0) begin
        $display("************************************************************");
        $display("                          FAIL!                             ");
        $display("  'out_valid' should be 0 after initial RESET at %8t", $time);
        $display("************************************************************");
        repeat(2) #(1);
        $finish;
    end
    #(1); release clk;
end endtask

task input_task; begin
    fscanf_int = $fscanf(file_in, "%h", b);
    in_valid = 1'b1;
    @(posedge clk);
    in_valid = 1'b0;
    b = 'bx;
end endtask

task wait_out_task; begin
    out_latency = 1;
    while (out_valid !== 1'b1) begin
        if (out_latency > MAX_OUT_LATENCY) begin
            $display("***********************************************************");
            $display("                          FAIL!                            ");
            $display("         The execution latency exceeded %d cycles", MAX_OUT_LATENCY);
            $display("***********************************************************");
            repeat(2) @(posedge clk);
            $finish;
        end
        out_latency = out_latency + 1;
        @(posedge clk);
    end
end endtask

task check_ans_task; begin
    fscanf_int = $fscanf(file_out, "%h", z_gold);
    if (z !== z_gold) begin
        $display("***********************************************************");
        $display("                    FAIL!  (Pattern %0d)", i_pat+1);
        $display("  b      = %016h", b);
        $display("  z_gold = %016h  dut = %016h", z_gold, z);
        $display("***********************************************************");
        repeat(2) @(posedge clk);
        $finish;
    end
    @(posedge clk);
end endtask

task YOU_PASS_task; begin
    $display("--------------------------------------------------------------------");
    $display("                         Congratulations!                           ");
    $display("                  You have passed all patterns!                     ");
    $display("                  Total execution cycles = %5d cycles               ", total_latency);
    $display("--------------------------------------------------------------------");
    repeat(2) @(posedge clk);
    $finish;
end endtask

endmodule
