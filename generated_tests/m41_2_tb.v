`timescale 1ns/1ps

module tb_m41;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg d;
  reg s0;
  reg s1;

  // Output
  wire out;

  // Instantiate the Unit Under Test (UUT)
  m41 uut (
    .a(a), 
    .b(b), 
    .c(c), 
    .d(d), 
    .s0(s0), 
    .s1(s1), 
    .out(out)
  );

  initial begin
    // Test case 1: Select input a
    a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; s0 = 1'b0; s1 = 1'b0;
    #10;
    if (out !== a) $display("FAIL: Test case 1 failed, expected %b, got %b", a, out);

    // Test case 2: Select input b
    a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; s0 = 1'b1; s1 = 1'b0;
    #10;
    if (out !== b) $display("FAIL: Test case 2 failed, expected %b, got %b", b, out);

    // Test case 3: Select input c
    a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; s0 = 1'b0; s1 = 1'b1;
    #10;
    if (out !== c) $display("FAIL: Test case 3 failed, expected %b, got %b", c, out);

    // Test case 4: Select input d
    a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; s0 = 1'b1; s1 = 1'b1;
    #10;
    if (out !== d) $display("FAIL: Test case 4 failed, expected %b, got %b", d, out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule