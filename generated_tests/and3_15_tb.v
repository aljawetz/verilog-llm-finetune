`timescale 1ns/1ps

module tb_and3;

  // Inputs
  reg w;
  reg x;
  reg y;

  // Output
  wire z;

  // Instantiate the Unit Under Test (UUT)
  and3 uut (
    .z(z),
    .w(w),
    .x(x),
    .y(y)
  );

  initial begin
    // Test case 1: All inputs are low
    w = 0; x = 0; y = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 1 failed, expected z=0, got z=%b", z);

    // Test case 2: One input high
    w = 1; x = 0; y = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 2 failed, expected z=0, got z=%b", z);

    // Test case 3: Two inputs high
    w = 1; x = 1; y = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 3 failed, expected z=0, got z=%b", z);

    // Test case 4: All inputs high
    w = 1; x = 1; y = 1;
    #10;
    if (z !== 1) $display("FAIL: Test case 4 failed, expected z=1, got z=%b", z);

    // Test case 5: Two inputs high, one low
    w = 0; x = 1; y = 1;
    #10;
    if (z !== 0) $display("FAIL: Test case 5 failed, expected z=0, got z=%b", z);

    // Test case 6: One input high, two low
    w = 1; x = 0; y = 1;
    #10;
    if (z !== 0) $display("FAIL: Test case 6 failed, expected z=0, got z=%b", z);

    // Test case 7: All inputs low again
    w = 0; x = 0; y = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 7 failed, expected z=0, got z=%b", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule