`timescale 1ns/1ps

module tb_three_bits_P;

  reg a, b, c;
  wire P;

  // Instantiate the module under test (uut)
  three_bits_P uut (
    .P(P),
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: 0 ^ 0 ^ 0 = 0
    a = 0; b = 0; c = 0;
    #10;
    if (P !== 0) $display("FAIL: Test case 1 failed, expected P=0, got P=%b", P);

    // Test case 2: 0 ^ 0 ^ 1 = 1
    a = 0; b = 0; c = 1;
    #10;
    if (P !== 1) $display("FAIL: Test case 2 failed, expected P=1, got P=%b", P);

    // Test case 3: 0 ^ 1 ^ 0 = 1
    a = 0; b = 1; c = 0;
    #10;
    if (P !== 1) $display("FAIL: Test case 3 failed, expected P=1, got P=%b", P);

    // Test case 4: 0 ^ 1 ^ 1 = 0
    a = 0; b = 1; c = 1;
    #10;
    if (P !== 0) $display("FAIL: Test case 4 failed, expected P=0, got P=%b", P);

    // Test case 5: 1 ^ 0 ^ 0 = 1
    a = 1; b = 0; c = 0;
    #10;
    if (P !== 1) $display("FAIL: Test case 5 failed, expected P=1, got P=%b", P);

    // Test case 6: 1 ^ 0 ^ 1 = 0
    a = 1; b = 0; c = 1;
    #10;
    if (P !== 0) $display("FAIL: Test case 6 failed, expected P=0, got P=%b", P);

    // Test case 7: 1 ^ 1 ^ 0 = 0
    a = 1; b = 1; c = 0;
    #10;
    if (P !== 0) $display("FAIL: Test case 7 failed, expected P=0, got P=%b", P);

    // Test case 8: 1 ^ 1 ^ 1 = 1
    a = 1; b = 1; c = 1;
    #10;
    if (P !== 1) $display("FAIL: Test case 8 failed, expected P=1, got P=%b", P);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule