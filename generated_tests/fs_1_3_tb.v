`timescale 1ns/1ps

module tb_fs_1;
  reg a, b, bin;
  wire d, bout;

  // Instantiate the full subtractor module
  fs_1 uut (
    .a(a),
    .b(b),
    .bin(bin),
    .d(d),
    .bout(bout)
  );

  initial begin
    // Test case 1: 0 - 0 - 0
    a = 0; b = 0; bin = 0; #10;
    if (d !== 0 || bout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 - 0 - 1
    a = 0; b = 0; bin = 1; #10;
    if (d !== 1 || bout !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 - 1 - 0
    a = 0; b = 1; bin = 0; #10;
    if (d !== 1 || bout !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 - 1 - 1
    a = 0; b = 1; bin = 1; #10;
    if (d !== 0 || bout !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 - 0 - 0
    a = 1; b = 0; bin = 0; #10;
    if (d !== 1 || bout !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 - 0 - 1
    a = 1; b = 0; bin = 1; #10;
    if (d !== 0 || bout !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 - 1 - 0
    a = 1; b = 1; bin = 0; #10;
    if (d !== 0 || bout !== 0) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 - 1 - 1
    a = 1; b = 1; bin = 1; #10;
    if (d !== 1 || bout !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule