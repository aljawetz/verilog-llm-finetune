`timescale 1ns/1ps

module tb_moore_overlapping;
  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
  moore_overlapping uut (
    .clk(clk),
    .rst_n(rst_n),
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
    rst_n = 0;
    x = 0;

    // Apply reset
    #10;
    rst_n = 1;

    // Test sequence
    // State A
    #10; x = 1; // Transition to B
    #10; x = 0; // Transition to C
    #10; x = 0; // Transition to A
    #10; x = 1; // Transition to B
    #10; x = 1; // Stay in B
    #10; x = 0; // Transition to C
    #10; x = 1; // Transition to D
    if (z !== 1) $display("FAIL: Expected z=1 in state D, got z=%b", z);
    #10; x = 0; // Transition to E
    #10; x = 0; // Transition to A
    #10; x = 1; // Transition to B
    #10; x = 1; // Stay in B
    #10; x = 0; // Transition to C
    #10; x = 1; // Transition to D
    if (z !== 1) $display("FAIL: Expected z=1 in state D, got z=%b", z);
    #10; x = 0; // Transition to E
    #10; x = 0; // Transition to A

    // End of test
    $display("PASS");
    $finish;
  end
endmodule