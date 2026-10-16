`timescale 1ns/1ps

module tb_Moore_NO;

reg clk;
reg rst;
reg in;
wire out;

// Instantiate the module under test
Moore_NO uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    in = 0;

    // Apply reset
    #10;
    rst = 0;

    // Test sequence
    // Test case 1: Input sequence that should not produce output
    in = 0; #10; // State s0
    if (out !== 0) $display("FAIL: Expected out=0 in state s0");

    in = 1; #10; // State s1
    if (out !== 0) $display("FAIL: Expected out=0 in state s1");

    in = 0; #10; // State s10
    if (out !== 0) $display("FAIL: Expected out=0 in state s10");

    in = 1; #10; // State s101
    if (out !== 0) $display("FAIL: Expected out=0 in state s101");

    in = 0; #10; // State s1010
    if (out !== 1) $display("FAIL: Expected out=1 in state s1010");

    // Test case 2: Input sequence that should produce output
    in = 1; #10; // State s1
    if (out !== 0) $display("FAIL: Expected out=0 in state s1 after input 1");

    in = 0; #10; // State s10
    if (out !== 0) $display("FAIL: Expected out=0 in state s10 after input 0");

    in = 1; #10; // State s101
    if (out !== 0) $display("FAIL: Expected out=0 in state s101 after input 1");

    in = 0; #10; // State s1010
    if (out !== 1) $display("FAIL: Expected out=1 in state s1010 after input 0");

    // End of test
    $display("PASS");
    $finish;
end

endmodule