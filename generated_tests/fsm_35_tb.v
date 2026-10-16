`timescale 1ns/1ps

module tb_fsm;
    reg in;
    reg clk;
    reg reset;
    wire out;

    // Instantiate the module under test (uut)
    fsm uut (
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
        // Initialize signals
        reset = 1;
        in = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test sequence
        // State transitions
        // s0 -> s1
        in = 0; #10; // Should transition to s1
        if (uut.PS !== 1) $display("FAIL: Expected state s1, got %0d", uut.PS);

        // s1 -> s1
        in = 0; #10; // Should remain in s1
        if (uut.PS !== 1) $display("FAIL: Expected state s1, got %0d", uut.PS);

        // s1 -> s2
        in = 1; #10; // Should transition to s2
        if (uut.PS !== 2) $display("FAIL: Expected state s2, got %0d", uut.PS);

        // s2 -> s3
        in = 1; #10; // Should transition to s3
        if (uut.PS !== 3) $display("FAIL: Expected state s3, got %0d", uut.PS);

        // s3 -> s0
        in = 0; #10; // Should transition to s0
        if (uut.PS !== 0) $display("FAIL: Expected state s0, got %0d", uut.PS);

        // s0 -> s1
        in = 0; #10; // Should transition to s1
        if (uut.PS !== 1) $display("FAIL: Expected state s1, got %0d", uut.PS);

        // s1 -> s1
        in = 0; #10; // Should remain in s1
        if (uut.PS !== 1) $display("FAIL: Expected state s1, got %0d", uut.PS);

        // s1 -> s2
        in = 1; #10; // Should transition to s2
        if (uut.PS !== 2) $display("FAIL: Expected state s2, got %0d", uut.PS);

        // s2 -> s3
        in = 1; #10; // Should transition to s3
        if (uut.PS !== 3) $display("FAIL: Expected state s3, got %0d", uut.PS);

        // Check output in s3
        if (uut.out !== 1) $display("FAIL: Expected output 1 in state s3, got %0d", uut.out);

        // s3 -> s0
        in = 0; #10; // Should transition to s0
        if (uut.PS !== 0) $display("FAIL: Expected state s0, got %0d", uut.PS);

        // End of test
        $display("PASS");
        $finish;
    end
endmodule