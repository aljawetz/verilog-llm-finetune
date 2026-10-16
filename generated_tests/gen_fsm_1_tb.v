`timescale 1ns/1ps

module tb_gen_fsm;

    reg in;
    reg clk;
    reg reset;
    reg [3:0] seq;
    wire out;

    // Instantiate the module under test
    gen_fsm uut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .seq(seq),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        in = 0;
        seq = 4'b1010; // Example sequence to match
        #10;
        
        reset = 0; // Release reset
        #10;

        // Test sequence input
        in = 1; #10; // s0 -> s1
        if (uut.out !== 0) $display("FAIL: Output should be 0 in state s1");

        in = 0; #10; // s1 -> s2
        if (uut.out !== 0) $display("FAIL: Output should be 0 in state s2");

        in = 1; #10; // s2 -> s3
        if (uut.out !== 0) $display("FAIL: Output should be 0 in state s3");

        in = 0; #10; // s3 -> s0
        if (uut.out !== 1) $display("FAIL: Output should be 1 when input matches seq[0]");

        // Test with a complete sequence
        in = 1; #10; // s0 -> s1
        in = 0; #10; // s1 -> s2
        in = 1; #10; // s2 -> s3
        in = 0; #10; // s3 -> s0
        if (uut.out !== 1) $display("FAIL: Output should be 1 when input matches seq[0]");

        // Test with incorrect sequence
        in = 1; #10; // s0 -> s1
        in = 1; #10; // s1 stays in s1
        in = 0; #10; // s1 -> s2
        in = 1; #10; // s2 -> s3
        in = 1; #10; // s3 -> s3
        if (uut.out !== 0) $display("FAIL: Output should be 0 when input does not match seq[0]");

        // Final check
        in = 0; #10; // s3 -> s0
        if (uut.out !== 1) $display("FAIL: Output should be 1 when input matches seq[0]");

        $display("PASS");
        $finish;
    end

endmodule