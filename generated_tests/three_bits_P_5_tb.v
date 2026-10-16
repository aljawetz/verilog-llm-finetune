`timescale 1ns/1ps

module tb_three_bits_P;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Outputs
  wire P;
  wire G;
  wire E;

  // Instantiate the module under test (uut)
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
    if (P !== 0 || G !== 0 || E !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a=0, b=0, c=1
    a = 0; b = 0; c = 1;
    #10;
    if (P !== 1 || G !== 0 || E !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a=0, b=1, c=0
    a = 0; b = 1; c = 0;
    #10;
    if (P !== 1 || G !== 0 || E !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a=0, b=1, c=1
    a = 0; b = 1; c = 1;
    #10;
    if (P !== 0 || G !== 1 || E !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a=1, b=0, c=0
    a = 1; b = 0; c = 0;
    #10;
    if (P !== 1 || G !== 0 || E !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a=1, b=0, c=1
    a = 1; b = 0; c = 1;
    #10;
    if (P !== 0 || G !== 1 || E !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: a=1, b=1, c=0
    a = 1; b = 1; c = 0;
    #10;
    if (P !== 0 || G !== 1 || E !== 0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: a=1, b=1, c=1
    a = 1; b = 1; c = 1;
    #10;
    if (P !== 1 || G !== 1 || E !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule