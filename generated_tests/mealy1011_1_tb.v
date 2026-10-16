`timescale 1ns/1ps

module tb_mealy1011;
  reg clk;
  reg rst;
  reg din;
  wire out;

  // Instantiate the module under test (uut)
  mealy1011 uut (
    .clk(clk),
    .rst(rst),
    .din(din),
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
    rst = 0;
    din = 0;

    // Apply reset
    #10;
    rst = 1; // Release reset
    #10;

    // Test sequence: 1011 (should assert out high)
    din = 1; #10; // s0 -> s1
    if (out !== 0) $display("FAIL: Output should be 0 in state s1");

    din = 0; #10; // s1 -> s2
    if (out !== 0) $display("FAIL: Output should be 0 in state s2");

    din = 1; #10; // s2 -> s3
    if (out !== 0) $display("FAIL: Output should be 0 in state s3");

    din = 1; #10; // s3 -> s1, out should be 1
    if (out !== 1) $display("FAIL: Output should be 1 in state s3");

    // Test sequence deviation
    din = 0; #10; // s1 -> s2
    if (out !== 0) $display("FAIL: Output should be 0 in state s2");

    din = 0; #10; // s2 -> s0
    if (out !== 0) $display("FAIL: Output should be 0 in state s0");

    // Test sequence: 1011 again
    din = 1; #10; // s0 -> s1
    din = 0; #10; // s1 -> s2
    din = 1; #10; // s2 -> s3
    din = 1; #10; // s3 -> s1, out should be 1
    if (out !== 1) $display("FAIL: Output should be 1 in state s3");

    // Reset the machine
    rst = 0; #10; // Assert reset
    rst = 1; #10; // Release reset

    // Final check: input 0 should keep output 0
    din = 0; #10;
    if (out !== 0) $display("FAIL: Output should be 0 after reset in state s0");

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule