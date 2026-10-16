`timescale 1ns/1ps

module tb_fsm4;
    reg clk;
    reg rst;
    reg in;
    wire out;

    // Instantiate the module under test (uut)
    fsm4 uut (
        .clk(clk),
        .rst(rst),
        .in(in),
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
        rst = 1;
        in = 0;
        #10; // Wait for reset to take effect
        rst = 0;

        // Test sequence
        // State: idle
        if (out !== 0) $display("FAIL: Expected out=0 in idle state");

        // Transition to state a
        in = 0; #10;
        if (out !== 0) $display("FAIL: Expected out=0 in state a");

        // Transition to state b
        in = 1; #10;
        if (out !== 0) $display("FAIL: Expected out=0 in state b");

        // Transition to state c
        in = 0; #10;
        if (out !== 0) $display("FAIL: Expected out=0 in state c");

        // Transition back to state a
        in = 0; #10;
        if (out !== 0) $display("FAIL: Expected out=0 in state a");

        // Transition to state b
        in = 1; #10;
        if (out !== 0) $display("FAIL: Expected out=0 in state b");

        // Transition to state d
        in = 1; #10;
        if (out !== 0) $display("FAIL: Expected out=0 in state d");

        // Stay in state d
        in = 1; #10;
        if (out !== 0) $display("FAIL: Expected out=0 in state d");

        // Transition to state c
        in = 0; #10;
        if (out !== 0) $display("FAIL: Expected out=0 in state c");

        // Transition to state a
        in = 0; #10;
        if (out !== 0) $display("FAIL: Expected out=0 in state a");

        // End of test
        $display("PASS");
        $finish;
    end
endmodule