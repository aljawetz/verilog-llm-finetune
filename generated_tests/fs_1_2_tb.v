`timescale 1ns/1ps

module tb_fs_1;
  reg a, b, bin;
  wire d, bout;

  // Instantiate the module under test (uut)
  fs_1 uut (
    .a(a),
    .b(b),
    .bin(bin),
    .d(d),
    .bout(bout)
  );

  initial begin
    // Test Case 1: a=0, b=0, bin=0
    a = 0; b = 0; bin = 0;
    #10;
    if (d !== 0 || bout !== 0) $display("FAIL: Test Case 1 failed");

    // Test Case 2: a=0, b=0, bin=1
    a = 0; b = 0; bin = 1;
    #10;
    if (d !== 1 || bout !== 0) $display("FAIL: Test Case 2 failed");

    // Test Case 3: a=0, b=1, bin=0
    a = 0; b = 1; bin = 0;
    #10;
    if (d !== 0 || bout !== 1) $display("FAIL: Test Case 3 failed");

    // Test Case 4: a=0, b=1, bin=1
    a = 0; b = 1; bin = 1;
    #10;
    if (d !== 1 || bout !== 1) $display("FAIL: Test Case 4 failed");

    // Test Case 5: a=1, b=0, bin=0
    a = 1; b = 0; bin = 0;
    #10;
    if (d !== 0 || bout !== 1) $display("FAIL: Test Case 5 failed");

    // Test Case 6: a=1, b=0, bin=1
    a = 1; b = 0; bin = 1;
    #10;
    if (d !== 1 || bout !== 1) $display("FAIL: Test Case 6 failed");

    // Test Case 7: a=1, b=1, bin=0
    a = 1; b = 1; bin = 0;
    #10;
    if (d !== 1 || bout !== 0) $display("FAIL: Test Case 7 failed");

    // Test Case 8: a=1, b=1, bin=1
    a = 1; b = 1; bin = 1;
    #10;
    if (d !== 0 || bout !== 1) $display("FAIL: Test Case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule