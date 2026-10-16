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
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 1 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 2: One input is 1
    a = 1; b = 0; c = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 2 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 3 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 4: All inputs are 1
    a = 1; b = 1; c = 1;
    #10;
    if (E !== 1) begin
      $display("FAIL: Test case 4 failed, expected E=1, got E=%b", E);
      $finish;
    end

    // Test case 5: Mixed inputs
    a = 1; b = 0; c = 1;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 5 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // Test case 6: Mixed inputs
    a = 0; b = 1; c = 1;
    #10;
    if (E !== 0) begin
      $display("FAIL: Test case 6 failed, expected E=0, got E=%b", E);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule