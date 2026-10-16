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
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        in = 0;

        // Wait for a clock cycle
        #10;
        
        // Release reset
        reset = 0;
        #10;

        // Test sequence: 101
        // State s0
        in = 0; #10; // Stay in s0, out should be 0
        if (uut.out !== 0) $display("FAIL: Expected out=0 in state s0");

        // State s0 -> s1
        in = 1; #10; // Move to s1, out should be 0
        if (uut.out !== 0) $display("FAIL: Expected out=0 in state s1");

        // State s1
        in = 0; #10; // Move to s2, out should be 0
        if (uut.out !== 0) $display("FAIL: Expected out=0 in state s2");

        // State s2
        in = 1; #10; // Move to s0, out should be 1
        if (uut.out !== 1) $display("FAIL: Expected out=1 in state s0 after 101");

        // Reset the FSM
        reset = 1; #10;
        reset = 0; #10;

        // Check after reset
        in = 0; #10; // Stay in s0, out should be 0
        if (uut.out !== 0) $display("FAIL: Expected out=0 after reset in state s0");

        // Test another sequence: 1001
        in = 1; #10; // Move to s1, out should be 0
        if (uut.out !== 0) $display("FAIL: Expected out=0 in state s1");

        in = 0; #10; // Move to s2, out should be 0
        if (uut.out !== 0) $display("FAIL: Expected out=0 in state s2");

        in = 0; #10; // Move to s0, out should be 0
        if (uut.out !== 0) $display("FAIL: Expected out=0 in state s0");

        // Test sequence: 101 again
        in = 1; #10; // Move to s1, out should be 0
        if (uut.out !== 0) $display("FAIL: Expected out=0 in state s1");

        in = 0; #10; // Move to s2, out should be 0
        if (uut.out !== 0) $display("FAIL: Expected out=0 in state s2");

        in = 1; #10; // Move to s0, out should be 1
        if (uut.out !== 1) $display("FAIL: Expected out=1 in state s0 after 101");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule