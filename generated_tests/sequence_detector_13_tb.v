`timescale 1ns/1ps

module tb_sequence_detector;
  reg clk;
  reg x;
  reg rst;
  wire z;

  // Instantiate the module under test (uut)
  sequence_detector uut (
    .clk(clk),
    .x(x),
    .z(z),
    .rst(rst)
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
    x = 0;
    #10; // Wait for 10ns
    rst = 0;

    // Test sequence: 0110 (should produce z = 1 at the end)
    // State S0
    x = 0; #10; // Stay in S0
    if (z !== 0) $display("FAIL: Expected z = 0 in S0, got z = %b", z);
    
    // State S1
    x = 1; #10; // Move to S1
    if (z !== 0) $display("FAIL: Expected z = 0 in S1, got z = %b", z);
    
    // State S2
    x = 1; #10; // Move to S2
    if (z !== 0) $display("FAIL: Expected z = 0 in S2, got z = %b", z);
    
    // State S3
    x = 0; #10; // Move to S3
    if (z !== 1) $display("FAIL: Expected z = 1 in S3, got z = %b", z);
    
    // Reset and check
    rst = 1; #10; // Reset
    rst = 0; #10; // Release reset
    x = 0; #10; // Back to S0
    if (z !== 0) $display("FAIL: Expected z = 0 after reset in S0, got z = %b", z);

    // Additional test sequence: 0110
    x = 0; #10; // Stay in S0
    x = 1; #10; // Move to S1
    x = 1; #10; // Move to S2
    x = 0; #10; // Move to S3
    if (z !== 1) $display("FAIL: Expected z = 1 after sequence 0110, got z = %b", z);

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule