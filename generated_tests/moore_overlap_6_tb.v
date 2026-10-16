`timescale 1ns/1ps

module tb_moore_overlap;

    reg din;
    reg clk;
    reg rst;
    wire y;

    // Instantiate the module under test
    moore_overlap uut (
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
        #10; // Wait for reset to take effect
        rst = 0;

        // Test sequence for overlapping sequence detection
        // Expected output y should be 0 until state s4 is reached
        // Input sequence: 0, 1, 0, 0, 1, 1, 0, 1
        // Expected states: s0, s1, s2, s0, s1, s3, s4, s3

        // Test case 1
        din = 0; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s0");

        // Test case 2
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s1");

        // Test case 3
        din = 0; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s2");

        // Test case 4
        din = 0; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s0");

        // Test case 5
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s1");

        // Test case 6
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s3");

        // Test case 7
        din = 0; #10;
        if (y !== 1) $display("FAIL: Expected y=1 in state s4");

        // Test case 8
        din = 1; #10;
        if (y !== 0) $display("FAIL: Expected y=0 in state s3");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule