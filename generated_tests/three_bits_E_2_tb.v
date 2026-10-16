`timescale 1ns/1ps

module tb_three_bits_E;

  reg a;
  reg b;
  reg c;
  wire E;

  // Instantiate the module under test (uut)
  three_bits_E uut (
    .E(E),
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: All inputs low
    a = 0; b = 0; c = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 1 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 2: One input high
    a = 1; b = 0; c = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 2 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 3: Two inputs high
    a = 1; b = 1; c = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 3 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 4: All inputs high
    a = 1; b = 1; c = 1;
    #10;
    if (E !== 1) begin
      $display("FAIL: Test case 4 failed, expected E=1, got E=%b", E);
      $finish;
    end

    // Test case 5: Two inputs high, one low
    a = 1; b = 1; c = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 5 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 6: One input high, two low
    a = 0; b = 1; c = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 6 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 7: All inputs low again
    a = 0; b = 0; c = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 7 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule