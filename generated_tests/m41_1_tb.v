`timescale 1ns/1ps

module tb_m41;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg d;
  reg s1;
  reg s0;

  // Output
  wire out;

  // Instantiate the Unit Under Test (UUT)
  m41 uut (
    .a(a), 
    .b(b), 
    .c(c), 
    .d(d), 
    .s1(s1), 
    .s0(s0), 
    .out(out)
  );

  initial begin
    // Initialize inputs
    a = 0; b = 0; c = 0; d = 0; s1 = 0; s0 = 0;

    // Test case 1: Select a (s1=0, s0=0)
    a = 1; b = 0; c = 0; d = 0; s1 = 0; s0 = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 1 failed");

    // Test case 2: Select b (s1=0, s0=1)
    a = 0; b = 1; c = 0; d = 0; s1 = 0; s0 = 1;
    #10;
    if (out !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: Select c (s1=1, s0=0)
    a = 0; b = 0; c = 1; d = 0; s1 = 1; s0 = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: Select d (s1=1, s0=1)
    a = 0; b = 0; c = 0; d = 1; s1 = 1; s0 = 1;
    #10;
    if (out !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: All inputs low (s1=0, s0=0)
    a = 0; b = 0; c = 0; d = 0; s1 = 0; s0 = 0;
    #10;
    if (out !== 0) $display("FAIL: Test case 5 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule