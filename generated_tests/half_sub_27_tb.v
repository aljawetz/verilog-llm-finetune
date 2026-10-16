`timescale 1ns/1ps

module tb_half_sub;
  reg a, b;
  wire d0, b0;

  // Instantiate the half_sub module
  half_sub uut (
    .d0(d0),
    .b0(b0),
    .a(a),
    .b(b)
  );

  initial begin
    // Test case 1: a=0, b=0
    a = 0; b = 0;
    #10;
    if (d0 !== 0 || b0 !== 0) $display("FAIL: Test case 1 failed (a=0, b=0)");

    // Test case 2: a=0, b=1
    a = 0; b = 1;
    #10;
    if (d0 !== 1 || b0 !== 1) $display("FAIL: Test case 2 failed (a=0, b=1)");

    // Test case 3: a=1, b=0
    a = 1; b = 0;
    #10;
    if (d0 !== 1 || b0 !== 0) $display("FAIL: Test case 3 failed (a=1, b=0)");

    // Test case 4: a=1, b=1
    a = 1; b = 1;
    #10;
    if (d0 !== 0 || b0 !== 0) $display("FAIL: Test case 4 failed (a=1, b=1)");

    $display("PASS");
    $finish;
  end
endmodule