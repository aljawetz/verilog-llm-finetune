`timescale 1ns/1ps

module tb_moore;
  reg clk;
  reg rst;
  reg x;
  wire z;

  // Instantiate the module under test
  moore uut (
    .clk(clk),
    .rst(rst),
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
    rst = 0;
    x = 0;

    // Apply reset
    #3;
    rst = 1; // Release reset
    #10;

    // Test sequence
    // State A (z should be 0)
    if (z !== 0) $display("FAIL: Expected z=0 in state A, got z=%b", z);

    // Transition to state B
    x = 1; #10;
    if (z !== 0) $display("FAIL: Expected z=0 in state B, got z=%b", z);

    // Stay in state B
    x = 1; #10;
    if (z !== 0) $display("FAIL: Expected z=0 in state B, got z=%b", z);

    // Transition to state D
    x = 0; #10;
    if (z !== 1) $display("FAIL: Expected z=1 in state D, got z=%b", z);

    // Stay in state D
    x = 0; #10;
    if (z !== 1) $display("FAIL: Expected z=1 in state D, got z=%b", z);

    // Transition to state C
    x = 1; #10;
    if (z !== 0) $display("FAIL: Expected z=0 in state C, got z=%b", z);

    // Transition back to state A
    x = 1; #10;
    if (z !== 0) $display("FAIL: Expected z=0 in state A, got z=%b", z);

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule