`ifndef CYCLE_TIME
    `define CYCLE_TIME 1.2
`endif

module PATTERN (
    // Outputs to DUT
    output reg        clk,
    output reg        rst_n,
    output reg        in_valid,
    output reg [2:0]  bfu_mode,
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
real dbg_in_x_re,  dbg_in_x_im;
real dbg_in_y_re,  dbg_in_y_im;
real dbg_in_w_re,  dbg_in_w_im;
real dbg_out_X_re, dbg_out_X_im;
real dbg_out_Y_re, dbg_out_Y_im;

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

// bfu_mode encoding
localparam MODE_FFT    = 3'b000;   // FFT / Merge FFT
localparam MODE_IFFT   = 3'b001;   // iFFT
localparam MODE_SPLIT  = 3'b010;   // Split FFT
localparam MODE_FMS    = 3'b011;   // Vector FMS  : X = (x - y)*W
localparam MODE_VECADD = 3'b100;   // Vector ADD  : X = x + y

integer file_in, file_out, file_num;
integer total_latency, out_latency;
integer total_cycles;
integer i_pat, PAT_NUM;
integer fscanf_int;

//---------------------------------------------------------------------
//   Gold variables (raw 64-bit IEEE-754 hex, extracted from the C model)
//---------------------------------------------------------------------
integer    mode_in;
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
        $display("\033[0;32mPASS PATTERN NO.%4d\033[0m, \033[0;36m%-6s\033[0m, \033[0;33mLatency: %6d\033[0m",
                 i_pat+1, mode_str(mode_in), out_latency);
        repeat($urandom_range(0, 3)) @(posedge clk);
    end
    YOU_PASS_task;
end

always @(posedge clk) total_cycles = total_cycles + 1;

//---------------------------------------------------------------------
//   Helper: mode -> printable string
//---------------------------------------------------------------------
function [8*6-1:0] mode_str;
    input integer m;
    begin
        case (m[2:0])
            MODE_FFT   : mode_str = "FFT   ";  // shared by FFT & Merge
            MODE_IFFT  : mode_str = "iFFT  ";
            MODE_SPLIT : mode_str = "SPLIT ";
            MODE_FMS   : mode_str = "FMS   ";
            MODE_VECADD: mode_str = "VECADD";
            default    : mode_str = "??????";
        endcase
    end
endfunction

//---------------------------------------------------------------------
//   Tasks
//---------------------------------------------------------------------
task reset_task; begin
    rst_n    = 1'b1;
    in_valid = 1'b0;
    bfu_mode = MODE_FFT;
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
        x_re, x_im, y_re, y_im, w_re, w_im, mode_in);
    in_valid = 1'b1;
    bfu_mode = mode_in[2:0];
    @(posedge clk);
    in_valid = 1'b0;
    // NOTE: bfu_mode must stay static during the pattern's full pipeline
    // flight — the add/sub-first modes feed the multiplier mid-pipeline, so
    // reverting the mode early would mis-route the second-stage operands.
    // The sequential TB fully drains before the next pattern, so holding the
    // mode until the next input_task is safe.
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

task check_ans_task;
    reg check_y;
    reg fail;
begin
    fscanf_int = $fscanf(file_out, "%h %h %h %h",
        X_re_gold, X_im_gold, Y_re_gold, Y_im_gold);

    // Butterfly modes (FFT/iFFT/Split) produce both X and Y; the vector modes
    // (FMS / Vector ADD) have a single meaningful result on X — Y is don't-care.
    check_y = (mode_in[2:0] != MODE_FMS) && (mode_in[2:0] != MODE_VECADD);

    fail = (X_re !== X_re_gold) || (X_im !== X_im_gold);
    if (check_y)
        fail = fail || (Y_re !== Y_re_gold) || (Y_im !== Y_im_gold);

    if (fail) begin
        $display("***********************************************************");
        $display("                    FAIL!  (Pattern %0d)", i_pat+1);
        $display("  mode  = %s (%0d)", mode_str(mode_in), mode_in);
        $display("  X_re  gold=%016h  dut=%016h", X_re_gold, X_re);
        $display("  X_im  gold=%016h  dut=%016h", X_im_gold, X_im);
        if (check_y) begin
            $display("  Y_re  gold=%016h  dut=%016h", Y_re_gold, Y_re);
            $display("  Y_im  gold=%016h  dut=%016h", Y_im_gold, Y_im);
        end
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
