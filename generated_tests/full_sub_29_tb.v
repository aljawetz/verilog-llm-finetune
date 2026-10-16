`timescale 1ns/1ps

module tb_full_sub;
  reg a, b, c;
  wire diff, bo;

  // Instantiate the full_sub module
  full_sub uut (
    .a(a),
    .b(b),
    .c(c),
    .diff(diff),
    .bo(bo)
  );

  initial begin
    // Test case 1: a=0, b=0, c=0
    a = 0; b = 0; c = 0;
    #10;
    if (diff !== 0 || bo !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a=0, b=0, c=1
    a = 0; b = 0; c = 1;
    #10;
    if (diff !== 1 || bo !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: a=0, b=1, c=0
    a = 0; b = 1; c = 0;
    #10;
    if (diff !== 1 || bo !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: a=0, b=1, c=1
    a = 0; b = 1; c = 1;
    #10;
    if (diff !== 0 || bo !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: a=1, b=0, c=0
    a = 1; b = 0; c = 0;
    #10;
    if (diff !== 1 || bo !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: a=1, b=0, c=1
    a = 1; b = 0; c = 1;
    #10;
    if (diff !== 0 || bo !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: a=1, b=1, c=0
    a = 1; b = 1; c = 0;
    #10;
    if (diff !== 0 || bo !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: a=1, b=1, c=1
    a = 1; b = 1; c = 1;
    #10;
    if (diff !== 1 || bo !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule