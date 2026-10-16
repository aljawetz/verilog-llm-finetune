`timescale 1ns/1ps

module tb_Even_Parity_Generator;

  // Inputs
  reg A;
  reg B;
  reg C;

  // Outputs
  wire P;

  // Instantiate the Unit Under Test (UUT)
  Even_Parity_Generator uut (
    .A(A),
    .B(B),
    .C(C),
    .P(P)
  );

  initial begin
    // Test case 1: A=0, B=0, C=0 -> P should be 0
    A = 0; B = 0; C = 0;
    #10;
    if (P !== 0) $display("FAIL: Test case 1 failed (A=0, B=0, C=0)");

    // Test case 2: A=0, B=0, C=1 -> P should be 1
    A = 0; B = 0; C = 1;
    #10;
    if (P !== 1) $display("FAIL: Test case 2 failed (A=0, B=0, C=1)");

    // Test case 3: A=0, B=1, C=0 -> P should be 1
    A = 0; B = 1; C = 0;
    #10;
    if (P !== 1) $display("FAIL: Test case 3 failed (A=0, B=1, C=0)");

    // Test case 4: A=0, B=1, C=1 -> P should be 0
    A = 0; B = 1; C = 1;
    #10;
    if (P !== 0) $display("FAIL: Test case 4 failed (A=0, B=1, C=1)");

    // Test case 5: A=1, B=0, C=0 -> P should be 1
    A = 1; B = 0; C = 0;
    #10;
    if (P !== 1) $display("FAIL: Test case 5 failed (A=1, B=0, C=0)");

    // Test case 6: A=1, B=0, C=1 -> P should be 0
    A = 1; B = 0; C = 1;
    #10;
    if (P !== 0) $display("FAIL: Test case 6 failed (A=1, B=0, C=1)");

    // Test case 7: A=1, B=1, C=0 -> P should be 0
    A = 1; B = 1; C = 0;
    #10;
    if (P !== 0) $display("FAIL: Test case 7 failed (A=1, B=1, C=0)");

    // Test case 8: A=1, B=1, C=1 -> P should be 1
    A = 1; B = 1; C = 1;
    #10;
    if (P !== 1) $display("FAIL: Test case 8 failed (A=1, B=1, C=1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule