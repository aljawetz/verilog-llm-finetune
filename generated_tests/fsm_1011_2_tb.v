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
        #10; // Wait for reset to take effect
        rst = 0;

        // Test sequence to detect "1011"
        // Expected output y should be high after the sequence "1011" is detected
        // Input sequence: 1, 0, 1, 1
        din = 1; #10; // State S0 -> S1
        if (y !== 0) $display("FAIL: y should be 0 after input 1");

        din = 0; #10; // State S1 -> S2
        if (y !== 0) $display("FAIL: y should be 0 after input 0");

        din = 1; #10; // State S2 -> S3
        if (y !== 0) $display("FAIL: y should be 0 after input 1");

        din = 1; #10; // State S3 -> S4
        if (y !== 1) $display("FAIL: y should be 1 after input 1");

        // Reset the FSM
        rst = 1; #10;
        rst = 0;

        // Test sequence to ensure FSM resets correctly
        din = 0; #10; // State S0
        if (y !== 0) $display("FAIL: y should be 0 after reset and input 0");

        // Input sequence: 1, 0, 1, 1 (again)
        din = 1; #10; // State S0 -> S1
        din = 0; #10; // State S1 -> S2
        din = 1; #10; // State S2 -> S3
        din = 1; #10; // State S3 -> S4
        if (y !== 1) $display("FAIL: y should be 1 after input sequence 1011");

        // Final check to ensure FSM can detect another sequence
        rst = 1; #10;
        rst = 0;

        din = 1; #10; // State S0 -> S1
        din = 0; #10; // State S1 -> S2
        din = 1; #10; // State S2 -> S3
        din = 1; #10; // State S3 -> S4
        if (y !== 1) $display("FAIL: y should be 1 after input sequence 1011 again");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule