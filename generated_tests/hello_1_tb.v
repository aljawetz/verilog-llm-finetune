`timescale 1ns/1ps

module tb_hello;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg d;
  reg e;

  // Output
  wire z;

  // Instantiate the Unit Under Test (UUT)
  hello uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .z(z)
  );

  initial begin
    // Test case 1: a = 1, b = 1, c = 0, d = 0, e = 0
    a = 1; b = 1; c = 0; d = 0; e = 0;
    #10;
    if (z !== 1) $display("FAIL: Test case 1 failed, expected z = 1, got z = %b", z);

    // Test case 2: a = 0, b = 0, c = 1, d = 1, e = 1
    a = 0; b = 0; c = 1; d = 1; e = 1;
    #10;
    if (z !== 0) $display("FAIL: Test case 2 failed, expected z = 0, got z = %b", z);

    // Test case 3: a = 0, b = 1, c = 1, d = 0, e = 0
    a = 0; b = 1; c = 1; d = 0; e = 0;
    #10;
    if (z !== 1) $display("FAIL: Test case 3 failed, expected z = 1, got z = %b", z);

    // Test case 4: a = 1, b = 0, c = 0, d = 1, e = 1
    a = 1; b = 0; c = 0; d = 1; e = 1;
    #10;
    if (z !== 0) $display("FAIL: Test case 4 failed, expected z = 0, got z = %b", z);

    // Test case 5: a = 1, b = 1, c = 1, d = 1, e = 0
    a = 1; b = 1; c = 1; d = 1; e = 0;
    #10;
    if (z !== 1) $display("FAIL: Test case 5 failed, expected z = 1, got z = %b", z);

    // Test case 6: a = 0, b = 0, c = 0, d = 0, e = 0
    a = 0; b = 0; c = 0; d = 0; e = 0;
    #10;
    if (z !== 0) $display("FAIL: Test case 6 failed, expected z = 0, got z = %b", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule