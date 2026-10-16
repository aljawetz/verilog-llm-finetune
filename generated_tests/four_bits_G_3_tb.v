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
    // Test case 1: 0 pairs high (G should be 0)
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (G !== 1'b0) $display("FAIL: Test case 1 failed, expected G=0, got G=%b", G);

    // Test case 2: 1 pair high (G should be 1)
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (G !== 1'b1) $display("FAIL: Test case 2 failed, expected G=1, got G=%b", G);

    // Test case 3: 2 pairs high (G should be 0)
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (G !== 1'b0) $display("FAIL: Test case 3 failed, expected G=0, got G=%b", G);

    // Test case 4: 3 pairs high (G should be 1)
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (G !== 1'b1) $display("FAIL: Test case 4 failed, expected G=1, got G=%b", G);

    // Test case 5: 4 pairs high (G should be 0)
    a = 1; b = 0; c = 0; d = 1;
    #10;
    if (G !== 1'b0) $display("FAIL: Test case 5 failed, expected G=0, got G=%b", G);

    // Test case 6: 2 pairs high (G should be 0)
    a = 0; b = 1; c = 1; d = 0;
    #10;
    if (G !== 1'b0) $display("FAIL: Test case 6 failed, expected G=0, got G=%b", G);

    // Test case 7: 1 pair high (G should be 1)
    a = 0; b = 1; c = 0; d = 1;
    #10;
    if (G !== 1'b1) $display("FAIL: Test case 7 failed, expected G=1, got G=%b", G);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule