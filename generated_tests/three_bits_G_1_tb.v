`timescale 1ns/1ps

module tb_three_bits_G;

  reg a, b, c;
  wire G;

  // Instantiate the module under test
  three_bits_G uut (
    .G(G),
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: a=0, b=0, c=0
    a = 0; b = 0; c = 0;
    #10;
    if (G !== 0) $display("FAIL: Test case 1 failed, expected G=0, got G=%b", G);

    // Test case 2: a=0, b=0, c=1
    a = 0; b = 0; c = 1;
    #10;
    if (G !== 0) $display("FAIL: Test case 2 failed, expected G=0, got G=%b", G);

    // Test case 3: a=0, b=1, c=1
    a = 0; b = 1; c = 1;
    #10;
    if (G !== 0) $display("FAIL: Test case 3 failed, expected G=0, got G=%b", G);

    // Test case 4: a=1, b=0, c=1
    a = 1; b = 0; c = 1;
    #10;
    if (G !== 0) $display("FAIL: Test case 4 failed, expected G=0, got G=%b", G);

    // Test case 5: a=1, b=1, c=0
    a = 1; b = 1; c = 0;
    #10;
    if (G !== 0) $display("FAIL: Test case 5 failed, expected G=0, got G=%b", G);

    // Test case 6: a=1, b=1, c=1
    a = 1; b = 1; c = 1;
    #10;
    if (G !== 1) $display("FAIL: Test case 6 failed, expected G=1, got G=%b", G);

    // Test case 7: a=1, b=0, c=0
    a = 1; b = 0; c = 0;
    #10;
    if (G !== 0) $display("FAIL: Test case 7 failed, expected G=0, got G=%b", G);

    // Test case 8: a=0, b=1, c=0
    a = 0; b = 1; c = 0;
    #10;
    if (G !== 0) $display("FAIL: Test case 8 failed, expected G=0, got G=%b", G);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule