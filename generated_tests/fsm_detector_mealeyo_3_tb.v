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
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test sequence: 0 -> 0 -> 1 -> 0 -> 0 -> 1
        // Expected output: 0 -> 0 -> 0 -> 1 -> 0
        in = 0; #10; // State s0, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

        in = 1; #10; // State s1, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

        in = 0; #10; // State s2, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

        in = 1; #10; // State s1, out should be 1
        if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

        in = 0; #10; // State s0, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

        // Reset the FSM
        reset = 1; #10; // Reset state
        reset = 0; #10;

        // Test sequence after reset
        in = 0; #10; // State s0, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

        in = 1; #10; // State s1, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

        in = 0; #10; // State s2, out should be 0
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

        in = 1; #10; // State s1, out should be 1
        if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule