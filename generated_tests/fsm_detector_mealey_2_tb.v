`timescale 1ns/1ps

module tb_fsm_detector_mealey;

    // Inputs
    reg in;
    reg clk;
    reg reset;

    // Outputs
    wire out;

    // Instantiate the Unit Under Test (UUT)
    fsm_detector_mealey uut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        in = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test sequence to detect "101"
        // State s0
        in = 0; #10; // Stay in s0, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0 in state s0");

        // State s0 to s1
        in = 1; #10; // Move to s1, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0 in state s1");

        // State s1
        in = 0; #10; // Move to s2, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0 in state s2");

        // State s2
        in = 1; #10; // Detect "101", move to s0, out should be 1
        if (out !== 1) $display("FAIL: Expected out=1 after detecting '101'");

        // Reset the FSM
        reset = 1; #10; // Reset should clear the state
        reset = 0; #10;

        // Check after reset
        in = 0; #10; // Stay in s0, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0 after reset in state s0");

        // Test another sequence
        in = 1; #10; // Move to s1, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0 in state s1");

        in = 0; #10; // Move to s2, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0 in state s2");

        in = 1; #10; // Detect "101", move to s0, out should be 1
        if (out !== 1) $display("FAIL: Expected out=1 after detecting '101'");

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule