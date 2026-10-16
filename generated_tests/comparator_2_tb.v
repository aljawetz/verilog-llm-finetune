`timescale 1ns/1ps

module tb_comparator;

  reg a0, a1, b0, b1;
  wire E, L, G;

  // Instantiate the comparator module
  comparator uut (
    .a0(a0),
    .a1(a1),
    .b0(b0),
    .b1(b1),
    .E(E),
    .L(L),
    .G(G)
  );

  initial begin
    // Test case 1: A = 00, B = 00 (Equal)
    a0 = 0; a1 = 0; b0 = 0; b1 = 0;
    #10;
    if (E !== 1 || L !== 0 || G !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: A = 01, B = 00 (Greater)
    a0 = 1; a1 = 0; b0 = 0; b1 = 0;
    #10;
    if (E !== 0 || L !== 0 || G !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: A = 00, B = 01 (Less)
    a0 = 0; a1 = 0; b0 = 1; b1 = 0;
    #10;
    if (E !== 0 || L !== 1 || G !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: A = 10, B = 01 (Greater)
    a0 = 0; a1 = 1; b0 = 1; b1 = 0;
    #10;
    if (E !== 0 || L !== 0 || G !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: A = 01, B = 10 (Less)
    a0 = 1; a1 = 0; b0 = 0; b1 = 1;
    #10;
    if (E !== 0 || L !== 1 || G !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: A = 11, B = 11 (Equal)
    a0 = 1; a1 = 1; b0 = 1; b1 = 1;
    #10;
    if (E !== 1 || L !== 0 || G !== 0) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule