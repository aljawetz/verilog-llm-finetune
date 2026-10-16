`timescale 1ns/1ps

module tb_full_sub;

  // Inputs
  reg a;
  reg bin;
  reg b;

  // Outputs
  wire bout;
  wire diff;

  // Instantiate the full_sub module
  full_sub uut (
    .a(a),
    .bin(bin),
    .b(b),
    .bout(bout),
    .diff(diff)
  );

  initial begin
    // Test case 1: a=0, b=0, bin=0
    a = 0; b = 0; bin = 0;
    #10;
    if (bout !== 0 || diff !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a=0, b=0, bin=1
    a = 0; b = 0; bin = 1;
    #10;
    if (bout !== 1 || diff !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: a=0, b=1, bin=0
    a = 0; b = 1; bin = 0;
    #10;
    if (bout !== 1 || diff !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: a=0, b=1, bin=1
    a = 0; b = 1; bin = 1;
    #10;
    if (bout !== 0 || diff !== 0) $display("FAIL: Test case 4 failed");

    // Test case 5: a=1, b=0, bin=0
    a = 1; b = 0; bin = 0;
    #10;
    if (bout !== 0 || diff !== 1) $display("FAIL: Test case 5 failed");

    // Test case 6: a=1, b=0, bin=1
    a = 1; b = 0; bin = 1;
    #10;
    if (bout !== 0 || diff !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: a=1, b=1, bin=0
    a = 1; b = 1; bin = 0;
    #10;
    if (bout !== 0 || diff !== 0) $display("FAIL: Test case 7 failed");

    // Test case 8: a=1, b=1, bin=1
    a = 1; b = 1; bin = 1;
    #10;
    if (bout !== 1 || diff !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule