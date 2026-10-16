`timescale 1ns/1ps

module tb_three_bits_P;

  reg a;
  reg b;
  reg c;
  wire P;
  wire G;
  wire E;

  // Instantiate the module under test
  three_bits_P uut (
    .P(P),
    .G(G),
    .E(E),
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: a=0, b=0, c=0
    a = 0; b = 0; c = 0;
    #10;
    if (P !== 0 || G !== 0 || E !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a=0, b=0, c=1
    a = 0; b = 0; c = 1;
    #10;
    if (P !== 1 || G !== 0 || E !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: a=0, b=1, c=0
    a = 0; b = 1; c = 0;
    #10;
    if (P !== 1 || G !== 0 || E !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: a=0, b=1, c=1
    a = 0; b = 1; c = 1;
    #10;
    if (P !== 0 || G !== 1 || E !== 0) $display("FAIL: Test case 4 failed");

    // Test case 5: a=1, b=0, c=0
    a = 1; b = 0; c = 0;
    #10;
    if (P !== 1 || G !== 0 || E !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: a=1, b=0, c=1
    a = 1; b = 0; c = 1;
    #10;
    if (P !== 0 || G !== 1 || E !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: a=1, b=1, c=0
    a = 1; b = 1; c = 0;
    #10;
    if (P !== 0 || G !== 1 || E !== 0) $display("FAIL: Test case 7 failed");

    // Test case 8: a=1, b=1, c=1
    a = 1; b = 1; c = 1;
    #10;
    if (P !== 0 || G !== 0 || E !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule