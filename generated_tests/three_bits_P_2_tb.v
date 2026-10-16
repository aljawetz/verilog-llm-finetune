`timescale 1ns/1ps

module tb_three_bits_P;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Output
  wire P;

  // Instantiate the module under test (uut)
  three_bits_P uut (
    .P(P),
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0;
    #10;
    if (P !== 0) $display("FAIL: Test case 1 failed (0, 0, 0) => P = %b", P);

    // Test case 2: One input is 1
    a = 1; b = 0; c = 0;
    #10;
    if (P !== 1) $display("FAIL: Test case 2 failed (1, 0, 0) => P = %b", P);

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0;
    #10;
    if (P !== 0) $display("FAIL: Test case 3 failed (1, 1, 0) => P = %b", P);

    // Test case 4: All inputs are 1
    a = 1; b = 1; c = 1;
    #10;
    if (P !== 1) $display("FAIL: Test case 4 failed (1, 1, 1) => P = %b", P);

    // Test case 5: Two inputs are 1, one is 0
    a = 0; b = 1; c = 1;
    #10;
    if (P !== 0) $display("FAIL: Test case 5 failed (0, 1, 1) => P = %b", P);

    // Test case 6: Two inputs are 0, one is 1
    a = 1; b = 0; c = 1;
    #10;
    if (P !== 0) $display("FAIL: Test case 6 failed (1, 0, 1) => P = %b", P);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule