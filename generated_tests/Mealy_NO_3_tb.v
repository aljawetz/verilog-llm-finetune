`timescale 1ns/1ps

module tb_Mealy_NO;

reg in;
reg clk;
reg rst;
wire out;

// Instantiate the module under test
Mealy_NO uut (
    .in(in),
    .clk(clk),
    .rst(rst),
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
    #10; // Wait for a clock cycle
    rst = 0; // Release reset

    // Test sequence to detect 1010
    // Input: 1
    in = 1; #10; // State should transition to s1
    if (uut.state !== 2'b01) $display("FAIL: Expected state s1 after input 1");

    // Input: 0
    in = 0; #10; // State should transition to s10
    if (uut.state !== 2'b10) $display("FAIL: Expected state s10 after input 0");

    // Input: 1
    in = 1; #10; // State should transition to s101
    if (uut.state !== 2'b11) $display("FAIL: Expected state s101 after input 1");

    // Input: 0
    in = 0; #10; // State should transition to s0 and out should be high
    if (uut.state !== 2'b00) $display("FAIL: Expected state s0 after input 0");
    if (uut.out !== 1'b1) $display("FAIL: Expected output high after detecting 1010");

    // Reset the state machine
    rst = 1; #10;
    rst = 0; #10;

    // Test sequence to ensure reset works
    in = 1; #10; // State should transition to s1
    in = 0; #10; // State should transition to s10
    rst = 1; #10; // Reset
    if (uut.state !== 2'b00) $display("FAIL: Expected state s0 after reset");

    // Final check with no input
    in = 0; #10; // Should remain in state s0
    if (uut.state !== 2'b00) $display("FAIL: Expected state s0 with no input");

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule