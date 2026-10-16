`timescale 1ns/1ps

module tb_half_adder;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire s0;
  wire c0;

  // Instantiate the half_adder module
  half_adder uut (
    .a(a),
    .b(b),
    .s0(s0),
    .c0(c0)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (s0 !== 0 || c0 !== 0) $display("FAIL: Test case 1 failed (a=0, b=0)");

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (s0 !== 1 || c0 !== 0) $display("FAIL: Test case 2 failed (a=0, b=1)");

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (s0 !== 1 || c0 !== 0) $display("FAIL: Test case 3 failed (a=1, b=0)");

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (s0 !== 0 || c0 !== 1) $display("FAIL: Test case 4 failed (a=1, b=1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule