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
        #10; // Wait for a few clock cycles

        // Release reset
        rst = 0;
        #10;

        // Test sequence to detect "1011"
        // Input: 1
        din = 1; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 at state S1");

        // Input: 0
        din = 0; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 at state S2");

        // Input: 1
        din = 1; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 at state S3");

        // Input: 1
        din = 1; #10;
        if (uut.y !== 1) $display("FAIL: Output should be 1 at state S4");

        // Input: 0
        din = 0; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 at state S0");

        // Input: 1
        din = 1; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 at state S1");

        // Input: 0
        din = 0; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 at state S2");

        // Input: 1
        din = 1; #10;
        if (uut.y !== 0) $display("FAIL: Output should be 0 at state S3");

        // Input: 1
        din = 1; #10;
        if (uut.y !== 1) $display("FAIL: Output should be 1 at state S4");

        // End of test
        $display("PASS");
        $finish;
    end

endmodule