`timescale 1ns/1ps

module tb_pattern_detector;

    reg clk_i;
    reg rst_i;
    reg d_i;
    wire pattern_detected_o;

    // Instantiate the pattern_detector module
    pattern_detector uut (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .d_i(d_i),
        .pattern_detected_o(pattern_detected_o)
    );

    // Clock generation
    initial begin
        clk_i = 0;
        forever #5 clk_i = ~clk_i; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_i = 0;
        d_i = 0;

        // Apply reset
        #10;
        rst_i = 1;

        // Test pattern: 1, 1, 0, 1, 1, 1
        // Expected output: pattern_detected_o should be high after the last 1
        #10; d_i = 1; // STATE1
        #10; d_i = 1; // STATE2
        #10; d_i = 0; // STATE3
        #10; d_i = 1; // STATE4
        #10; d_i = 1; // STATE5
        #10; d_i = 1; // Should detect pattern
        #10;

        if (pattern_detected_o !== 1) begin
            $display("FAIL: Pattern not detected as expected");
            $finish;
        end

        // Reset and test another pattern: 0, 1, 1, 0, 1, 1
        #10; rst_i = 0; // Reset
        #10; rst_i = 1; // Release reset
        d_i = 0; // STATE RST
        #10; d_i = 1; // STATE1
        #10; d_i = 1; // STATE2
        #10; d_i = 0; // STATE3
        #10; d_i = 1; // STATE4
        #10; d_i = 1; // STATE5
        #10; d_i = 1; // Should detect pattern
        #10;

        if (pattern_detected_o !== 1) begin
            $display("FAIL: Pattern not detected as expected");
            $finish;
        end

        // Test with no pattern: 0, 0, 0
        #10; rst_i = 0; // Reset
        #10; rst_i = 1; // Release reset
        d_i = 0; // STATE RST
        #10; d_i = 0; // Stay in RST
        #10; d_i = 0; // Stay in RST
        #10;

        if (pattern_detected_o !== 0) begin
            $display("FAIL: Pattern detected when it should not be");
            $finish;
        end

        // Final check with a valid pattern
        #10; d_i = 1; // STATE1
        #10; d_i = 1; // STATE2
        #10; d_i = 0; // STATE3
        #10; d_i = 1; // STATE4
        #10; d_i = 1; // STATE5
        #10; d_i = 1; // Should detect pattern
        #10;

        if (pattern_detected_o !== 1) begin
            $display("FAIL: Pattern not detected as expected");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule