`timescale 1ns/1ps

module tb_four_bits_P;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg d;

  // Outputs
  wire P;
  wire G;
  wire E;
  wire F;

  // Instantiate the Unit Under Test (UUT)
  four_bits_P uut (
    .P(P),
    .G(G),
    .E(E),
    .F(F),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );

  initial begin
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (P !== 0 || G !== 0 || E !== 0 || F !== 0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: One input is 1
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (P !== 1 || G !== 0 || E !== 0 || F !== 0) 
      $display("FAIL: Test case 2 failed");

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (P !== 0 || G !== 1 || E !== 0 || F !== 0) 
      $display("FAIL: Test case 3 failed");

    // Test case 4: Three inputs are 1
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (P !== 1 || G !== 1 || E !== 1 || F !== 0) 
      $display("FAIL: Test case 4 failed");

    // Test case 5: All inputs are 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (P !== 0 || G !== 1 || E !== 1 || F !== 1) 
      $display("FAIL: Test case 5 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule