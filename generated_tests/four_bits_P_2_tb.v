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
    // Test sequence
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (P !== 0) $display("FAIL: Test case 1 failed, expected P=0, got P=%b", P);

    // Test case 2: One input is 1
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (P !== 1) $display("FAIL: Test case 2 failed, expected P=1, got P=%b", P);

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (P !== 0) $display("FAIL: Test case 3 failed, expected P=0, got P=%b", P);

    // Test case 4: Three inputs are 1
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (P !== 1) $display("FAIL: Test case 4 failed, expected P=1, got P=%b", P);

    // Test case 5: All inputs are 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (P !== 0) $display("FAIL: Test case 5 failed, expected P=0, got P=%b", P);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule