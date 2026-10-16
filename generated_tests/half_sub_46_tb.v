`timescale 1ns/1ps

module tb_half_sub;
  reg a;
  reg b;
  wire diff;
  wire borrow;

  // Instantiate the half_sub module
  half_sub uut (
    .a(a),
    .b(b),
    .diff(diff),
    .borrow(borrow)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (diff !== 0 || borrow !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (diff !== 1 || borrow !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (diff !== 1 || borrow !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (diff !== 0 || borrow !== 0) $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule