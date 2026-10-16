`timescale 1ns/1ps

module tb_hs_1;
  reg a;
  reg bin;
  wire d;
  wire bout;

  // Instantiate the half subtractor
  hs_1 uut (
    .a(a),
    .bin(bin),
    .d(d),
    .bout(bout)
  );

  initial begin
    // Test case 1: a = 0, bin = 0
    a = 0; bin = 0;
    #10;
    if (d !== 0 || bout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a = 0, bin = 1
    a = 0; bin = 1;
    #10;
    if (d !== 1 || bout !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: a = 1, bin = 0
    a = 1; bin = 0;
    #10;
    if (d !== 1 || bout !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: a = 1, bin = 1
    a = 1; bin = 1;
    #10;
    if (d !== 0 || bout !== 0) $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule