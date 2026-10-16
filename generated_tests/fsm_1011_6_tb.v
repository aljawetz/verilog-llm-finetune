`timescale 1ns/1ps

module tb_fsm_1011;

    reg clk;
    reg rst;
    reg din;
    wire y;

    // Instantiate the module under test (uut)
    fsm_1011 uut (
        .clk(clk),
        .rst(rst),
        .din(din),
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
        rst = 0;

        // Test sequence to detect "1011"
        // Input: 1 (S0 -> S1)
        din = 1; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 in state S1");

        // Input: 0 (S1 -> S2)
        din = 0; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 in state S2");

        // Input: 1 (S2 -> S3)
        din = 1; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 in state S3");

        // Input: 1 (S3 -> S4)
        din = 1; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 in state S4");

        // Input: 0 (S4 -> S0)
        din = 0; #10;
        if (uut.y !== 1) $display("FAIL: Output should be 1 in state S4");

        // Reset and check again
        rst = 1; #10;
        rst = 0; #10;

        // New sequence to detect "1011"
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 after invalid sequence");

        // Valid sequence "1011"
        din = 1; #10; // S0 -> S1
        din = 0; #10; // S1 -> S2
        din = 1; #10; // S2 -> S3
        din = 1; #10; // S3 -> S4
        if (uut.y !== 1) $display("FAIL: Output should be 1 after detecting '1011'");

        // Final check
        din = 0; #10; // S4 -> S0
        if (uut.y !== 1) $display("FAIL: Output should still be 1 after '1011'");

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule