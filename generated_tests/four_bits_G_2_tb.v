`timescale 1ns/1ps

module tb_four_bits_G;

  reg a, b, c, d;
  wire G;

  // Instantiate the module under test (uut)
  four_bits_G uut (
    .G(G),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );

  initial begin
    // Test case 1: a=0, b=0, c=0, d=0 -> G should be 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (G !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: a=1, b=0, c=0, d=0 -> G should be 0
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (G !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: a=1, b=1, c=0, d=0 -> G should be 1
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (G !== 1'b1) $display("FAIL: Test case 3 failed");

    // Test case 4: a=1, b=0, c=1, d=0 -> G should be 1
    a = 1; b = 0; c = 1; d = 0;
    #10;
    if (G !== 1'b1) $display("FAIL: Test case 4 failed");

    // Test case 5: a=1, b=1, c=1, d=0 -> G should be 0
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (G !== 1'b0) $display("FAIL: Test case 5 failed");

    // Test case 6: a=1, b=1, c=1, d=1 -> G should be 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (G !== 1'b0) $display("FAIL: Test case 6 failed");

    // Test case 7: a=0, b=1, c=1, d=0 -> G should be 1
    a = 0; b = 1; c = 1; d = 0;
    #10;
    if (G !== 1'b1) $display("FAIL: Test case 7 failed");

    // Test case 8: a=0, b=1, c=0, d=1 -> G should be 1
    a = 0; b = 1; c = 0; d = 1;
    #10;
    if (G !== 1'b1) $display("FAIL: Test case 8 failed");

    // Test case 9: a=1, b=0, c=1, d=1 -> G should be 0
    a = 1; b = 0; c = 1; d = 1;
    #10;
    if (G !== 1'b0) $display("FAIL: Test case 9 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule