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
    // Test case 1: 0 & 0 & 0 = 0
    w = 0; x = 0; y = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 1 failed, expected z=0, got z=%b", z);

    // Test case 2: 0 & 0 & 1 = 0
    w = 0; x = 0; y = 1;
    #10;
    if (z !== 0) $display("FAIL: Test case 2 failed, expected z=0, got z=%b", z);

    // Test case 3: 0 & 1 & 1 = 0
    w = 0; x = 1; y = 1;
    #10;
    if (z !== 0) $display("FAIL: Test case 3 failed, expected z=0, got z=%b", z);

    // Test case 4: 1 & 0 & 1 = 0
    w = 1; x = 0; y = 1;
    #10;
    if (z !== 0) $display("FAIL: Test case 4 failed, expected z=0, got z=%b", z);

    // Test case 5: 1 & 1 & 0 = 0
    w = 1; x = 1; y = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 5 failed, expected z=0, got z=%b", z);

    // Test case 6: 1 & 1 & 1 = 1
    w = 1; x = 1; y = 1;
    #10;
    if (z !== 1) $display("FAIL: Test case 6 failed, expected z=1, got z=%b", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule