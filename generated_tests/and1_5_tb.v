`timescale 1ns/1ps

module tb_and1;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg d;

  // Output
  wire z;

  // Instantiate the Unit Under Test (UUT)
  and1 uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .z(z)
  );

  initial begin
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 1 failed, expected z=0, got z=%b", z);

    // Test case 2: One input is 1
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 2 failed, expected z=0, got z=%b", z);

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 3 failed, expected z=0, got z=%b", z);

    // Test case 4: Three inputs are 1
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 4 failed, expected z=0, got z=%b", z);

    // Test case 5: All inputs are 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (z !== 1) $display("FAIL: Test case 5 failed, expected z=1, got z=%b", z);

    // Test case 6: Mixed inputs
    a = 1; b = 1; c = 0; d = 1;
    #10;
    if (z !== 0) $display("FAIL: Test case 6 failed, expected z=0, got z=%b", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule