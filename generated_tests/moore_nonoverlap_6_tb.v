`timescale 1ns/1ps

module tb_moore_nonoverlap;

    reg din;
    reg clk;
    reg rst;
    wire y;

    // Instantiate the module under test (uut)
    moore_nonoverlap uut (
        .din(din),
        .clk(clk),
        .rst(rst),
        .y(y)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        din = 0;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test sequence to detect non-overlapping pattern "110"
        // Expected output y should be high only when the sequence "110" is detected

        // Step 1: Input '1' -> Move to state s1
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s1");

        // Step 2: Input '1' -> Stay in state s1
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s1");

        // Step 3: Input '0' -> Move to state s2
        din = 0; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s2");

        // Step 4: Input '1' -> Move to state s3
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s3");

        // Step 5: Input '0' -> Move to state s4 (y should be high)
        din = 0; #10;
        if (y !== 1) $display("FAIL: Expected y=1 in state s4");

        // Step 6: Input '0' -> Move to state s0
        din = 0; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s0");

        // Step 7: Input '1' -> Move to state s1
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s1");

        // Step 8: Input '1' -> Stay in state s1
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s1");

        // Step 9: Input '0' -> Move to state s2
        din = 0; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s2");

        // Step 10: Input '1' -> Move to state s3
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s3");

        // Step 11: Input '0' -> Move to state s4 (y should be high)
        din = 0; #10;
        if (y !== 1) $display("FAIL: Expected y=1 in state s4");

        // End of test
        $display("PASS");
        $finish;
    end

endmodule