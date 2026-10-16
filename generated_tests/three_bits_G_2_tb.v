`timescale 1ns/1ps

module tb_three_bits_G;

  reg a, b, c;
  wire G;

  // Instantiate the module under test (uut)
  three_bits_G uut (
    .G(G),
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: a=0, b=0, c=0 -> G should be 0
    a = 0; b = 0; c = 0;
    #10;
    if (G !== 1'b0) $display("FAIL: Test case 1 failed (0, 0, 0) -> G = %b", G);

    // Test case 2: a=0, b=0, c=1 -> G should be 0
    a = 0; b = 0; c = 1;
    #10;
    if (G !== 1'b0) $display("FAIL: Test case 2 failed (0, 0, 1) -> G = %b", G);

    // Test case 3: a=0, b=1, c=1 -> G should be 1
    a = 0; b = 1; c = 1;
    #10;
    if (G !== 1'b1) $display("FAIL: Test case 3 failed (0, 1, 1) -> G = %b", G);

    // Test case 4: a=1, b=0, c=1 -> G should be 1
    a = 1; b = 0; c = 1;
    #10;
    if (G !== 1'b1) $display("FAIL: Test case 4 failed (1, 0, 1) -> G = %b", G);

    // Test case 5: a=1, b=1, c=0 -> G should be 1
    a = 1; b = 1; c = 0;
    #10;
    if (G !== 1'b1) $display("FAIL: Test case 5 failed (1, 1, 0) -> G = %b", G);

    // Test case 6: a=1, b=1, c=1 -> G should be 1
    a = 1; b = 1; c = 1;
    #10;
    if (G !== 1'b1) $display("FAIL: Test case 6 failed (1, 1, 1) -> G = %b", G);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule