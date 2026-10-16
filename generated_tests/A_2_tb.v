`timescale 1ns/1ps

module tb_A;

  // Inputs
  reg x;
  reg y;

  // Outputs
  wire z;

  // Instantiate the Unit Under Test (UUT)
  A uut (
    .x(x),
    .y(y),
    .z(z)
  );

  initial begin
    // Test case 1: x = 0, y = 0
    x = 0; y = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 1 failed, expected z = 0, got z = %b", z);

    // Test case 2: x = 0, y = 1
    x = 0; y = 1;
    #10;
    if (z !== 0) $display("FAIL: Test case 2 failed, expected z = 0, got z = %b", z);

    // Test case 3: x = 1, y = 0
    x = 1; y = 0;
    #10;
    if (z !== 1) $display("FAIL: Test case 3 failed, expected z = 1, got z = %b", z);

    // Test case 4: x = 1, y = 1
    x = 1; y = 1;
    #10;
    if (z !== 0) $display("FAIL: Test case 4 failed, expected z = 0, got z = %b", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule