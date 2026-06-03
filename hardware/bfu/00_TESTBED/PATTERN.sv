`ifndef CYCLE_TIME
    `define CYCLE_TIME 1.2
`endif

module PATTERN (
    // Outputs to DUT
    output reg        clk,
    output reg        rst_n,
    output reg        in_valid,
    output reg        is_ifft,
    output reg [63:0] x_re, x_im,
    output reg [63:0] y_re, y_im,
    output reg [63:0] w_re, w_im,
    // Inputs from DUT
    input             out_valid,
    input      [63:0] X_re, X_im,
    input      [63:0] Y_re, Y_im
);
//---------------------------------------------------------------------
//   Verdi Debug Signals (Real types)
//---------------------------------------------------------------------
// 宣告 real 變數
real dbg_in_x_re,  dbg_in_x_im;
real dbg_in_y_re,  dbg_in_y_im;
real dbg_in_w_re,  dbg_in_w_im;
real dbg_out_X_re, dbg_out_X_im;
real dbg_out_Y_re, dbg_out_Y_im;

// 使用 $bitstoreal 將 64-bit wire/reg 即時轉換為浮點數
always @(*) begin
    dbg_in_x_re  = $bitstoreal(x_re);
    dbg_in_x_im  = $bitstoreal(x_im);
    dbg_in_y_re  = $bitstoreal(y_re);
    dbg_in_y_im  = $bitstoreal(y_im);
    dbg_in_w_re  = $bitstoreal(w_re);
    dbg_in_w_im  = $bitstoreal(w_im);
    
    dbg_out_X_re = $bitstoreal(X_re);
    dbg_out_X_im = $bitstoreal(X_im);
    dbg_out_Y_re = $bitstoreal(Y_re);
    dbg_out_Y_im = $bitstoreal(Y_im);
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
//   Gold variables (raw 64-bit IEEE-754 hex, extracted from the C model)
//---------------------------------------------------------------------
integer    is_ifft_in;
reg [63:0] X_re_gold, X_im_gold;
reg [63:0] Y_re_gold, Y_im_gold;

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
        $display("\033[0;32mPASS PATTERN NO.%4d\033[0m, \033[0;33mLatency: %6d\033[0m", i_pat+1, out_latency);
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
    is_ifft  = 1'b0;
    x_re = 'bx; x_im = 'bx;
    y_re = 'bx; y_im = 'bx;
    w_re = 'bx; w_im = 'bx;

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
    fscanf_int = $fscanf(file_in, "%h %h %h %h %h %h %d",
        x_re, x_im, y_re, y_im, w_re, w_im, is_ifft_in);
    in_valid = 1'b1;
    is_ifft  = is_ifft_in[0];
    @(posedge clk);
    in_valid = 1'b0;
    x_re = 'bx; x_im = 'bx;
    y_re = 'bx; y_im = 'bx;
    w_re = 'bx; w_im = 'bx;
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
    fscanf_int = $fscanf(file_out, "%h %h %h %h",
        X_re_gold, X_im_gold, Y_re_gold, Y_im_gold);

    if (X_re !== X_re_gold || X_im !== X_im_gold ||
        Y_re !== Y_re_gold || Y_im !== Y_im_gold) begin
        $display("***********************************************************");
        $display("                    FAIL!  (Pattern %0d)", i_pat+1);
        $display("  mode  = %s", is_ifft_in ? "iFFT" : "FFT");
        $display("  X_re  gold=%016h  dut=%016h", X_re_gold, X_re);
        $display("  X_im  gold=%016h  dut=%016h", X_im_gold, X_im);
        $display("  Y_re  gold=%016h  dut=%016h", Y_re_gold, Y_re);
        $display("  Y_im  gold=%016h  dut=%016h", Y_im_gold, Y_im);
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
