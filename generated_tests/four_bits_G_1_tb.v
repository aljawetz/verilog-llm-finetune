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
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (G !== 0) $display("FAIL: Test case 1 failed (G should be 0)"); 

    // Test case 2: One input is 1
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (G !== 0) $display("FAIL: Test case 2 failed (G should be 0)");

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (G !== 1) $display("FAIL: Test case 3 failed (G should be 1)");

    // Test case 4: Three inputs are 1
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (G !== 1) $display("FAIL: Test case 4 failed (G should be 1)");

    // Test case 5: All inputs are 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (G !== 1) $display("FAIL: Test case 5 failed (G should be 1)");

    // Test case 6: Mixed inputs
    a = 1; b = 0; c = 1; d = 1;
    #10;
    if (G !== 1) $display("FAIL: Test case 6 failed (G should be 1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule