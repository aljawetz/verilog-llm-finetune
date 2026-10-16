`timescale 1ns/1ps

module tb_half_subtractor;

  reg a;
  reg b;
  wire diff;
  wire bout;

  // Instantiate the half_subtractor module
  half_subtractor uut (
    .a(a),
    .b(b),
    .diff(diff),
    .bout(bout)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (diff !== 0 || bout !== 0) $display("FAIL: Test case 1 failed (a=0, b=0)");

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (diff !== 1 || bout !== 1) $display("FAIL: Test case 2 failed (a=0, b=1)");

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (diff !== 1 || bout !== 0) $display("FAIL: Test case 3 failed (a=1, b=0)");

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (diff !== 0 || bout !== 0) $display("FAIL: Test case 4 failed (a=1, b=1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule