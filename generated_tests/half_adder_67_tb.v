`timescale 1ns/1ps

module tb_half_adder;

  // Inputs
  reg x;
  reg y;

  // Outputs
  wire s;
  wire c;

  // Instantiate the half_adder module
  half_adder uut (
    .x(x),
    .y(y),
    .s(s),
    .c(c)
  );

  initial begin
    // Test case 1: x = 0, y = 0
    x = 0; y = 0;
    #10;
    if (s !== 0 || c !== 0) $display("FAIL: Test case 1 failed (x=0, y=0)");

    // Test case 2: x = 0, y = 1
    x = 0; y = 1;
    #10;
    if (s !== 1 || c !== 0) $display("FAIL: Test case 2 failed (x=0, y=1)");

    // Test case 3: x = 1, y = 0
    x = 1; y = 0;
    #10;
    if (s !== 1 || c !== 0) $display("FAIL: Test case 3 failed (x=1, y=0)");

    // Test case 4: x = 1, y = 1
    x = 1; y = 1;
    #10;
    if (s !== 0 || c !== 1) $display("FAIL: Test case 4 failed (x=1, y=1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule