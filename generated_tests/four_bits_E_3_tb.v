`timescale 1ns/1ps

module tb_four_bits_E;
  reg a, b, c, d;
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
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 1 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 2: One input is 1
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 2 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 3 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 4: Three inputs are 1
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (E !== 1) begin
      $display("FAIL: Test case 4 failed, expected E=1, got E=%b", E);
      $finish;
    end

    // Test case 5: All inputs are 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (E !== 1) begin
      $display("FAIL: Test case 5 failed, expected E=1, got E=%b", E);
      $finish;
    end

    // Test case 6: Mixed inputs
    a = 1; b = 0; c = 1; d = 1;
    #10;
    if (E !== 1) begin
      $display("FAIL: Test case 6 failed, expected E=1, got E=%b", E);
      $finish;
    end

    // Test case 7: Another mixed input
    a = 0; b = 1; c = 1; d = 1;
    #10;
    if (E !== 1) begin
      $display("FAIL: Test case 7 failed, expected E=1, got E=%b", E);
      $finish;
    end

    // Test case 8: All combinations
    a = 0; b = 0; c = 1; d = 1;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 8 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule