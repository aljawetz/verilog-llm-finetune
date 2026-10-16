`timescale 1ns/1ps

module tb_fsm;

    reg clk;
    reg reset;
    reg x;
    wire z;

    // Instantiate the module under test (uut)
    fsm uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .z(z)
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
        x = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test sequence
        // State s0 -> s1 (x = 0)
        x = 0; #10;
        if (uut.z !== 0) $display("FAIL: Expected z=0 in state s1, got z=%b", uut.z);

        // State s1 -> s2 (x = 1)
        x = 1; #10;
        if (uut.z !== 0) $display("FAIL: Expected z=0 in state s2, got z=%b", uut.z);

        // State s2 -> s3 (x = 1)
        x = 1; #10;
        if (uut.z !== 0) $display("FAIL: Expected z=0 in state s3, got z=%b", uut.z);

        // State s3 -> s1 (x = 0)
        x = 0; #10;
        if (uut.z !== 1) $display("FAIL: Expected z=1 in state s3, got z=%b", uut.z);

        // State s1 -> s1 (x = 0)
        x = 0; #10;
        if (uut.z !== 0) $display("FAIL: Expected z=0 in state s1, got z=%b", uut.z);

        // State s1 -> s2 (x = 1)
        x = 1; #10;
        if (uut.z !== 0) $display("FAIL: Expected z=0 in state s2, got z=%b", uut.z);

        // State s2 -> s3 (x = 1)
        x = 1; #10;
        if (uut.z !== 0) $display("FAIL: Expected z=0 in state s3, got z=%b", uut.z);

        // State s3 -> s1 (x = 0)
        x = 0; #10;
        if (uut.z !== 1) $display("FAIL: Expected z=1 in state s3, got z=%b", uut.z);

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule