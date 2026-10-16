`timescale 1ns/1ps

module tb_seq_1010_overlap;

    reg x;
    reg clk;
    reg reset;
    wire z;

    // Instantiate the module under test (uut)
    seq_1010_overlap uut (
        .x(x),
        .clk(clk),
        .reset(reset),
        .z(z)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        x = 0;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test sequence to check for 1010 detection
        // Expected output: z should be high when the sequence 1010 is detected

        // Test case 1: Input sequence 1 (reset state)
        x = 1; #10; // State should transition to S1
        if (z !== 0) $display("FAIL: z should be 0 in state S1");

        // Test case 2: Input sequence 0
        x = 0; #10; // State should transition to S2
        if (z !== 0) $display("FAIL: z should be 0 in state S2");

        // Test case 3: Input sequence 1
        x = 1; #10; // State should transition to S3
        if (z !== 0) $display("FAIL: z should be 0 in state S3");

        // Test case 4: Input sequence 0
        x = 0; #10; // State should transition to S00, z should be 1
        if (z !== 1) $display("FAIL: z should be 1 in state S01");

        // Test case 5: Input sequence 1
        x = 1; #10; // State should transition to S1
        if (z !== 0) $display("FAIL: z should be 0 in state S1");

        // Test case 6: Input sequence 0
        x = 0; #10; // State should transition to S2
        if (z !== 0) $display("FAIL: z should be 0 in state S2");

        // Test case 7: Input sequence 1
        x = 1; #10; // State should transition to S3
        if (z !== 0) $display("FAIL: z should be 0 in state S3");

        // Test case 8: Input sequence 0
        x = 0; #10; // State should transition to S00, z should be 1
        if (z !== 1) $display("FAIL: z should be 1 in state S01");

        // Final check
        $display("PASS");
        $finish;
    end

endmodule