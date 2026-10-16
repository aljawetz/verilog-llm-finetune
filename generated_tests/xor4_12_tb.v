`timescale 1ns/1ps

module tb_xor4;

  // Inputs
  reg v;
  reg w;
  reg x;
  reg y;

  // Output
  wire z;

  // Instantiate the Unit Under Test (UUT)
  xor4 uut (
    .z(z),
    .v(v),
    .w(w),
    .x(x),
    .y(y)
  );

  initial begin
    // Test case 1: All inputs are 0
    v = 0; w = 0; x = 0; y = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 1 failed, expected z = 0, got z = %b", z);

    // Test case 2: One input is 1
    v = 1; w = 0; x = 0; y = 0;
    #10;
    if (z !== 1) $display("FAIL: Test case 2 failed, expected z = 1, got z = %b", z);

    // Test case 3: Two inputs are 1
    v = 1; w = 1; x = 0; y = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 3 failed, expected z = 0, got z = %b", z);

    // Test case 4: Three inputs are 1
    v = 1; w = 1; x = 1; y = 0;
    #10;
    if (z !== 1) $display("FAIL: Test case 4 failed, expected z = 1, got z = %b", z);

    // Test case 5: All inputs are 1
    v = 1; w = 1; x = 1; y = 1;
    #10;
    if (z !== 0) $display("FAIL: Test case 5 failed, expected z = 0, got z = %b", z);

    // Test case 6: Mixed inputs
    v = 1; w = 0; x = 1; y = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 6 failed, expected z = 0, got z = %b", z);

    v = 1; w = 0; x = 1; y = 1;
    #10;
    if (z !== 1) $display("FAIL: Test case 7 failed, expected z = 1, got z = %b", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule