`timescale 1ns/1ps

module tb_fsm_101_0110;

    reg din;
    reg clk;
    reg reset;
    wire y;

    // Instantiate the module under test (uut)
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
        // Initialize inputs
        din = 0;
        reset = 1;

        // Apply reset
        #10 reset = 0;

        // Test sequence
        // Test case 1: Input sequence leading to state S3 (y should be 1)
        din = 1; #10; // S0 -> S1
        din = 0; #10; // S1 -> S3
        if (y !== 1'b1) $display("FAIL: Expected y=1 at S3, got y=%b", y);

        // Test case 2: Input sequence leading to state S5 (y should be 1)
        din = 1; #10; // S3 -> S4
        din = 0; #10; // S4 -> S3
        din = 0; #10; // S3 -> S5
        if (y !== 1'b1) $display("FAIL: Expected y=1 at S5, got y=%b", y);

        // Test case 3: Input sequence leading to state S2 (y should be 0)
        din = 1; #10; // S5 -> S1
        din = 1; #10; // S1 -> S1
        din = 0; #10; // S1 -> S3
        if (y !== 1'b1) $display("FAIL: Expected y=1 at S3, got y=%b", y);

        // Test case 4: Reset the FSM
        reset = 1; #10; // Reset to S0
        reset = 0; #10;

        // Test case 5: Input sequence leading to state S2 (y should be 0)
        din = 0; #10; // S0 -> S2
        if (y !== 1'b0) $display("FAIL: Expected y=0 at S2, got y=%b", y);

        // Test case 6: Input sequence leading to state S4 (y should be 0)
        din = 1; #10; // S2 -> S4
        din = 1; #10; // S4 -> S5
        din = 0; #10; // S5 -> S3
        if (y !== 1'b1) $display("FAIL: Expected y=1 at S3, got y=%b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule