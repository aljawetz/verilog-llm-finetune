`timescale 1ns/1ps

module tb_fsm_11001;
    reg din;
    reg clk;
    reg rst;
    wire y;

    // Instantiate the module under test
    fsm_11001 uut (
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
        // Initialize
        rst = 1;
        din = 0;
        #10; // Wait for reset
        rst = 0;

        // Test sequence to detect "11001"
        // Input: 1
        din = 1; #10;
        if (y !== 0) $display("FAIL: y should be 0 after input 1 in S0");

        // Input: 1
        din = 1; #10;
        if (y !== 0) $display("FAIL: y should be 0 after input 1 in S1");

        // Input: 0
        din = 0; #10;
        if (y !== 0) $display("FAIL: y should be 0 after input 0 in S2");

        // Input: 0
        din = 0; #10;
        if (y !== 0) $display("FAIL: y should be 0 after input 0 in S3");

        // Input: 1
        din = 1; #10;
        if (y !== 1) $display("FAIL: y should be 1 after input 1 in S4");

        // Reset and test again
        rst = 1; #10;
        rst = 0;

        // New sequence: 1, 1, 0, 0, 1
        din = 1; #10;
        din = 1; #10;
        din = 0; #10;
        din = 0; #10;
        din = 1; #10;
        if (y !== 1) $display("FAIL: y should be 1 after input sequence 11001");

        // Final reset
        rst = 1; #10;
        rst = 0;

        // Input: 0
        din = 0; #10;
        if (y !== 0) $display("FAIL: y should be 0 after input 0 in S0");

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule