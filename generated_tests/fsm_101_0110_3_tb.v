`timescale 1ns/1ps

module tb_fsm_101_0110;
    reg din;
    reg clk;
    reg reset;
    wire y;

    // Instantiate the module under test
    fsm_101_0110 uut (
        .din(din),
        .clk(clk),
        .reset(reset),
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
        reset = 1;
        din = 0;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test pattern "101"
        din = 1; #10; // S0 -> S1
        din = 0; #10; // S1 -> S3, y should be 1
        if (y !== 1) $display("FAIL: Expected y=1 after input '10' in state S1");
        
        din = 1; #10; // S3 -> S4
        if (y !== 1) $display("FAIL: Expected y=1 after input '1' in state S3");
        
        din = 0; #10; // S4 -> S3, y should be 0
        if (y !== 0) $display("FAIL: Expected y=0 after input '0' in state S4");

        // Test pattern "0110"
        din = 0; #10; // S3 -> S2
        din = 1; #10; // S2 -> S4
        din = 1; #10; // S4 -> S5
        din = 0; #10; // S5 -> S3, y should be 1
        if (y !== 1) $display("FAIL: Expected y=1 after input '0' in state S5");

        // Reset and test another sequence
        reset = 1; #10; reset = 0;
        din = 0; #10; // S0 -> S2
        din = 1; #10; // S2 -> S4
        din = 1; #10; // S4 -> S5
        din = 1; #10; // S5 -> S1, y should be 0
        if (y !== 0) $display("FAIL: Expected y=0 after input '1' in state S5");

        // Final check for y
        din = 0; #10; // S5 -> S3, y should be 1
        if (y !== 1) $display("FAIL: Expected y=1 after input '0' in state S5");

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule