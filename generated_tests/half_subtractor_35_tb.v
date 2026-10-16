`timescale 1ns/1ps

module tb_half_subtractor;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire d;
  wire bo;

  // Instantiate the Unit Under Test (UUT)
  half_subtractor uut (
    .a(a), 
    .b(b), 
    .d(d), 
    .bo(bo)
  );

  initial begin
    // Test Case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (d !== 0 || bo !== 0) $display("FAIL: Test Case 1 failed");

    // Test Case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (d !== 1 || bo !== 0) $display("FAIL: Test Case 2 failed");

    // Test Case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (d !== 1 || bo !== 1) $display("FAIL: Test Case 3 failed");

    // Test Case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (d !== 0 || bo !== 0) $display("FAIL: Test Case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule