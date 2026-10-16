`timescale 1ns/1ps

module tb_fullsubractor;
  reg a, b, Cin;
  wire diff, barrow;

  // Instantiate the full subtractor module
  fullsubractor uut (
    .a(a),
    .b(b),
    .Cin(Cin),
    .diff(diff),
    .barrow(barrow)
  );

  initial begin
    // Test case 1: a=0, b=0, Cin=0
    a = 0; b = 0; Cin = 0;
    #10;
    if (diff !== 0 || barrow !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a=0, b=0, Cin=1
    a = 0; b = 0; Cin = 1;
    #10;
    if (diff !== 1 || barrow !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: a=0, b=1, Cin=0
    a = 0; b = 1; Cin = 0;
    #10;
    if (diff !== 1 || barrow !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: a=0, b=1, Cin=1
    a = 0; b = 1; Cin = 1;
    #10;
    if (diff !== 0 || barrow !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: a=1, b=0, Cin=0
    a = 1; b = 0; Cin = 0;
    #10;
    if (diff !== 1 || barrow !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: a=1, b=0, Cin=1
    a = 1; b = 0; Cin = 1;
    #10;
    if (diff !== 0 || barrow !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: a=1, b=1, Cin=0
    a = 1; b = 1; Cin = 0;
    #10;
    if (diff !== 0 || barrow !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: a=1, b=1, Cin=1
    a = 1; b = 1; Cin = 1;
    #10;
    if (diff !== 1 || barrow !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule