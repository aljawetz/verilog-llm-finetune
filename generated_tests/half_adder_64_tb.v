`timescale 1ns/1ps

module tb_half_adder;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire sum;
  wire carry;

  // Instantiate the half_adder module
  half_adder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (sum !== 0 || carry !== 0) $display("FAIL: Test case 1 failed (0, 0)");

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (sum !== 1 || carry !== 0) $display("FAIL: Test case 2 failed (0, 1)");

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (sum !== 1 || carry !== 0) $display("FAIL: Test case 3 failed (1, 0)");

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (sum !== 0 || carry !== 1) $display("FAIL: Test case 4 failed (1, 1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule