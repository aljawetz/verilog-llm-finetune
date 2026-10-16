`timescale 1ns/1ps

module tb_half_adder;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire sum;
  wire cout;

  // Instantiate the half_adder module
  half_adder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (sum !== 0 || cout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (sum !== 1 || cout !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (sum !== 1 || cout !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (sum !== 0 || cout !== 1) $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule