`timescale 1ns/1ps

module tb_fsm_detector_mealeyo;

    // Inputs
    reg in;
    reg clk;
    reg reset;

    // Outputs
    wire out;

    // Instantiate the Unit Under Test (UUT)
    fsm_detector_mealeyo uut (
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

        // Wait for a clock cycle
        #10;
        
        // Release reset
        reset = 0;
        #10;

        // Test sequence
        // State s0
        in = 0; #10; // Stay in s0, out should be 0
        if (uut.out !== 1'b0) $display("FAIL: Expected out=0 in state s0, got out=%b", uut.out);

        // Transition to s1
        in = 1; #10; // Move to s1, out should be 0
        if (uut.out !== 1'b0) $display("FAIL: Expected out=0 in state s1, got out=%b", uut.out);

        // Stay in s1
        in = 1; #10; // Stay in s1, out should be 0
        if (uut.out !== 1'b0) $display("FAIL: Expected out=0 in state s1, got out=%b", uut.out);

        // Transition to s2
        in = 0; #10; // Move to s2, out should be 0
        if (uut.out !== 1'b0) $display("FAIL: Expected out=0 in state s2, got out=%b", uut.out);

        // Transition back to s0
        in = 0; #10; // Move to s0, out should be 0
        if (uut.out !== 1'b0) $display("FAIL: Expected out=0 in state s0, got out=%b", uut.out);

        // Transition to s1
        in = 1; #10; // Move to s1, out should be 0
        if (uut.out !== 1'b0) $display("FAIL: Expected out=0 in state s1, got out=%b", uut.out);

        // Transition to s2 and produce output
        in = 0; #10; // Move to s2, out should be 0
        if (uut.out !== 1'b0) $display("FAIL: Expected out=0 in state s2, got out=%b", uut.out);
        
        in = 1; #10; // Move to s1, out should be 1
        if (uut.out !== 1'b1) $display("FAIL: Expected out=1 in state s1, got out=%b", uut.out);

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule