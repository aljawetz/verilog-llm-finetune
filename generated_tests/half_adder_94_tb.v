`timescale 1ns/1ps

module tb_half_adder;

  // Inputs
  reg x1;
  reg x2;

  // Outputs
  wire c;
  wire s;

  // Instantiate the half_adder module
  half_adder uut (
    .x1(x1),
    .x2(x2),
    .c(c),
    .s(s)
  );

  initial begin
    // Test case 1: x1 = 0, x2 = 0
    x1 = 0; x2 = 0;
    #10;
    if (c !== 0 || s !== 0) $display("FAIL: Test case 1 failed (0, 0)");

    // Test case 2: x1 = 0, x2 = 1
    x1 = 0; x2 = 1;
    #10;
    if (c !== 0 || s !== 1) $display("FAIL: Test case 2 failed (0, 1)");

    // Test case 3: x1 = 1, x2 = 0
    x1 = 1; x2 = 0;
    #10;
    if (c !== 0 || s !== 1) $display("FAIL: Test case 3 failed (1, 0)");

    // Test case 4: x1 = 1, x2 = 1
    x1 = 1; x2 = 1;
    #10;
    if (c !== 1 || s !== 0) $display("FAIL: Test case 4 failed (1, 1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule