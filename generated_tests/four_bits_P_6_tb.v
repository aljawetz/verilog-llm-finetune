`timescale 1ns/1ps

module tb_four_bits_P;

  reg a, b, c, d;
  wire P;

  // Instantiate the module under test (uut)
  four_bits_P uut (
    .P(P),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );

  initial begin
    // Test case 1: all inputs are 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (P !== 0) $display("FAIL: Test case 1 failed, expected P=0, got P=%b", P);

    // Test case 2: one input is 1
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (P !== 1) $display("FAIL: Test case 2 failed, expected P=1, got P=%b", P);

    // Test case 3: two inputs are 1
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (P !== 0) $display("FAIL: Test case 3 failed, expected P=0, got P=%b", P);

    // Test case 4: three inputs are 1
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (P !== 1) $display("FAIL: Test case 4 failed, expected P=1, got P=%b", P);

    // Test case 5: all inputs are 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (P !== 0) $display("FAIL: Test case 5 failed, expected P=0, got P=%b", P);

    // Test case 6: mixed inputs
    a = 1; b = 0; c = 1; d = 0;
    #10;
    if (P !== 0) $display("FAIL: Test case 6 failed, expected P=0, got P=%b", P);

    a = 1; b = 1; c = 0; d = 1;
    #10;
    if (P !== 1) $display("FAIL: Test case 7 failed, expected P=1, got P=%b", P);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule