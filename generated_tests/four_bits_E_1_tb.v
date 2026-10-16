`timescale 1ns/1ps

module tb_four_bits_E;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg d;

  // Output
  wire E;

  // Instantiate the module under test (uut)
  four_bits_E uut (
    .E(E),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );

  initial begin
    // Test sequence
    // Test case 1: a=0, b=0, c=0, d=0 -> E should be 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (E !== 0) $display("FAIL: Test case 1 failed, expected E=0, got E=%b", E);

    // Test case 2: a=0, b=0, c=0, d=1 -> E should be 0
    a = 0; b = 0; c = 0; d = 1;
    #10;
    if (E !== 0) $display("FAIL: Test case 2 failed, expected E=0, got E=%b", E);

    // Test case 3: a=0, b=0, c=1, d=1 -> E should be 0
    a = 0; b = 0; c = 1; d = 1;
    #10;
    if (E !== 0) $display("FAIL: Test case 3 failed, expected E=0, got E=%b", E);

    // Test case 4: a=0, b=1, c=1, d=1 -> E should be 0
    a = 0; b = 1; c = 1; d = 1;
    #10;
    if (E !== 0) $display("FAIL: Test case 4 failed, expected E=0, got E=%b", E);

    // Test case 5: a=1, b=1, c=1, d=1 -> E should be 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (E !== 1) $display("FAIL: Test case 5 failed, expected E=1, got E=%b", E);

    // Test case 6: a=1, b=1, c=1, d=0 -> E should be 1
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (E !== 1) $display("FAIL: Test case 6 failed, expected E=1, got E=%b", E);

    // Test case 7: a=1, b=1, c=0, d=0 -> E should be 0
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (E !== 0) $display("FAIL: Test case 7 failed, expected E=0, got E=%b", E);

    // Test case 8: a=1, b=0, c=0, d=0 -> E should be 0
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (E !== 0) $display("FAIL: Test case 8 failed, expected E=0, got E=%b", E);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule