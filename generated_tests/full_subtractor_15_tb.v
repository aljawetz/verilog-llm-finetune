`timescale 1ns/1ps

module tb_full_subtractor;
  reg a, b, Bin;
  wire D, Bout;

  // Instantiate the full subtractor
  full_subtractor uut (
    .a(a),
    .b(b),
    .Bin(Bin),
    .D(D),
    .Bout(Bout)
  );

  initial begin
    // Test case 1: 0 - 0 - 0
    a = 0; b = 0; Bin = 0;
    #10;
    if (D !== 0 || Bout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 - 0 - 1
    a = 0; b = 0; Bin = 1;
    #10;
    if (D !== 1 || Bout !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 - 1 - 0
    a = 0; b = 1; Bin = 0;
    #10;
    if (D !== 1 || Bout !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 - 1 - 1
    a = 0; b = 1; Bin = 1;
    #10;
    if (D !== 0 || Bout !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 - 0 - 0
    a = 1; b = 0; Bin = 0;
    #10;
    if (D !== 1 || Bout !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 - 0 - 1
    a = 1; b = 0; Bin = 1;
    #10;
    if (D !== 0 || Bout !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 - 1 - 0
    a = 1; b = 1; Bin = 0;
    #10;
    if (D !== 0 || Bout !== 0) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 - 1 - 1
    a = 1; b = 1; Bin = 1;
    #10;
    if (D !== 1 || Bout !== 1) $display("FAIL: Test case 8 failed");

    $display("PASS");
    $finish;
  end
endmodule