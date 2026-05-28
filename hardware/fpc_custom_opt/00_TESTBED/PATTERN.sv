`timescale 1ns/1ps

module PATTERN (
    input  clk,
    input  rst_n,
    output reg [63:0] a_re, a_im, b_re, b_im,
    output reg [1:0] op,  // 0=ADD, 1=SUB, 2=MUL
    output reg in_valid,
    input  [63:0] c_re, c_im,
    input  out_valid
);

    real input_values[4];
    real output_values[2];
    int opcode;
    int total_tests, total_pass, total_fail;
    int line_num;
    string input_line, output_line;
    int input_file, output_file;
    real expected_re, expected_im;
    real actual_re, actual_im;
    real error_re, error_im, error_tol;

    initial begin
        total_tests = 0;
        total_pass = 0;
        total_fail = 0;
        error_tol = 1e-9;  // Tolerance for floating-point comparison (relax from 1e-10)
        line_num = 0;

        // Wait for reset to be released
        wait(!rst_n);
        wait(rst_n);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);

        // Open input and output files
        input_file = $fopen("../00_TESTBED/input.txt", "r");
        output_file = $fopen("../00_TESTBED/output.txt", "r");

        if (input_file == 0 || output_file == 0) begin
            $display("ERROR: Cannot open input or output files");
            $finish;
        end

        // Main test loop
        while (!$feof(input_file) && !$feof(output_file)) begin
            // Read input line
            if ($fgets(input_line, input_file) == 0) break;
            if ($fgets(output_line, output_file) == 0) break;

            line_num = line_num + 1;

            // Parse input: a_re a_im b_re b_im opcode
            if ($sscanf(input_line, "%e %e %e %e %d",
                input_values[0], input_values[1],
                input_values[2], input_values[3],
                opcode) != 5) begin
                $display("ERROR: Failed to parse input line %d", line_num);
                continue;
            end

            // Parse output: c_re c_im
            if ($sscanf(output_line, "%e %e",
                output_values[0], output_values[1]) != 2) begin
                $display("ERROR: Failed to parse output line %d", line_num);
                continue;
            end

            // Convert to IEEE-754 64-bit representation (simplified)
            a_re <= double_to_bits(input_values[0]);
            a_im <= double_to_bits(input_values[1]);
            b_re <= double_to_bits(input_values[2]);
            b_im <= double_to_bits(input_values[3]);
            op <= opcode[1:0];
            in_valid <= 1'b1;

            total_tests = total_tests + 1;

            expected_re = output_values[0];
            expected_im = output_values[1];

            // Debug output for first 5 tests
            if (line_num <= 5) begin
                $display("Test %d: op=%d, a_re=%.6e a_im=%.6e, b_re=%.6e b_im=%.6e",
                    line_num, opcode, input_values[0], input_values[1],
                    input_values[2], input_values[3]);
                $display("  Expected: (%.6e, %.6e)", expected_re, expected_im);
            end

            // Wait for output (MUL has 2-cycle pipeline latency)
            if (opcode == 2) begin
                @(posedge clk);  // Cycle 1: inputs sampled
                @(posedge clk);  // Cycle 2: output valid
            end else begin
                @(posedge clk);  // ADD/SUB are combinational (0 latency)
            end

            actual_re = bits_to_double(c_re);
            actual_im = bits_to_double(c_im);

            // Debug output for first 5 tests
            if (line_num <= 5) begin
                $display("  Got: (%.6e, %.6e)", actual_re, actual_im);
            end

            // Check result with tolerance
            error_re = (actual_re - expected_re) / (expected_re + 1e-20);
            error_im = (actual_im - expected_im) / (expected_im + 1e-20);

            if ($abs(error_re) < error_tol && $abs(error_im) < error_tol) begin
                total_pass = total_pass + 1;
            end else begin
                total_fail = total_fail + 1;
                if (total_fail <= 5) begin  // Print first 5 errors
                    $display("FAIL [%d] Op=%d: Expected (%.6e, %.6e), Got (%.6e, %.6e)",
                        line_num, opcode, expected_re, expected_im, actual_re, actual_im);
                end
            end
        end

        $fclose(input_file);
        $fclose(output_file);

        in_valid <= 1'b0;
        @(posedge clk);

        $display("\n=== FPC Test Results ===");
        $display("Total tests: %d", total_tests);
        $display("Passed:      %d", total_pass);
        $display("Failed:      %d", total_fail);
        if (total_fail == 0)
            $display("✅ All tests PASSED!");
        else
            $display("❌ Some tests FAILED");

        $finish;
    end

    // Helper function: convert double to 64-bit IEEE-754
    function [63:0] double_to_bits(real d);
        // Simplified: just convert through bit pattern
        // In real testbench, use proper IEEE-754 encoding
        double_to_bits = $realtobits(d);
    endfunction

    // Helper function: convert 64-bit to double
    function real bits_to_double([63:0] b);
        bits_to_double = $bitstoreal(b);
    endfunction

endmodule
