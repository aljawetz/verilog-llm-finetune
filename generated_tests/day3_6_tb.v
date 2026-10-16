`timescale 1ns/1ps

module tb_day3;

  // Inputs
  reg x3;
  reg x2;
  reg x1;

  // Output
  wire f;

  // Instantiate the Unit Under Test (UUT)
  day3 uut (
    .x3(x3),
    .x2(x2),
    .x1(x1),
    .f(f)
  );

  initial begin
    // Test case 1: x3 = 0, x2 = 0, x1 = 0 -> f should be 0
    x3 = 0; x2 = 0; x1 = 0;
    #10;
    if (f !== 0) $display("FAIL: Test case 1 failed, expected f = 0, got f = %b", f);

    // Test case 2: x3 = 0, x2 = 1, x1 = 0 -> f should be 1
    x3 = 0; x2 = 1; x1 = 0;
    #10;
    if (f !== 1) $display("FAIL: Test case 2 failed, expected f = 1, got f = %b", f);

    // Test case 3: x3 = 1, x2 = 0, x1 = 0 -> f should be 0
    x3 = 1; x2 = 0; x1 = 0;
    #10;
    if (f !== 0) $display("FAIL: Test case 3 failed, expected f = 0, got f = %b", f);

    // Test case 4: x3 = 1, x2 = 0, x1 = 1 -> f should be 1
    x3 = 1; x2 = 0; x1 = 1;
    #10;
    if (f !== 1) $display("FAIL: Test case 4 failed, expected f = 1, got f = %b", f);

    // Test case 5: x3 = 1, x2 = 1, x1 = 0 -> f should be 1
    x3 = 1; x2 = 1; x1 = 0;
    #10;
    if (f !== 1) $display("FAIL: Test case 5 failed, expected f = 1, got f = %b", f);

    // Test case 6: x3 = 0, x2 = 1, x1 = 1 -> f should be 1
    x3 = 0; x2 = 1; x1 = 1;
    #10;
    if (f !== 1) $display("FAIL: Test case 6 failed, expected f = 1, got f = %b", f);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule