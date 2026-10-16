`timescale 1ns/1ps

module tb_Mag_comp_1bit;

  reg A;
  reg B;
  wire L;
  wire G;
  wire E;

  // Instantiate the module under test (uut)
  Mag_comp_1bit uut (
    .A(A),
    .B(B),
    .L(L),
    .G(G),
    .E(E)
  );

  initial begin
    // Test case 1: A = 0, B = 0 (Expect E = 1, L = 0, G = 0)
    A = 0; B = 0;
    #10;
    if (L !== 0 || G !== 0 || E !== 1) $display("FAIL: Test case 1 failed");
    
    // Test case 2: A = 0, B = 1 (Expect E = 0, L = 1, G = 0)
    A = 0; B = 1;
    #10;
    if (L !== 1 || G !== 0 || E !== 0) $display("FAIL: Test case 2 failed");
    
    // Test case 3: A = 1, B = 0 (Expect E = 0, L = 0, G = 1)
    A = 1; B = 0;
    #10;
    if (L !== 0 || G !== 1 || E !== 0) $display("FAIL: Test case 3 failed");
    
    // Test case 4: A = 1, B = 1 (Expect E = 1, L = 0, G = 0)
    A = 1; B = 1;
    #10;
    if (L !== 0 || G !== 0 || E !== 1) $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule