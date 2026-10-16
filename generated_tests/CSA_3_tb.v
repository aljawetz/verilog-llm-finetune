`timescale 1ns/1ps

module tb_CSA;

  // Inputs
  reg A;
  reg B;
  reg C;

  // Outputs
  wire X;
  wire Y;

  // Instantiate the Unit Under Test (UUT)
  CSA uut (
    .A(A),
    .B(B),
    .C(C),
    .X(X),
    .Y(Y)
  );

  initial begin
    // Test cases
    // Test case 1: A=0, B=0, C=0
    A = 0; B = 0; C = 0;
    #10;
    if (X !== 0 || Y !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: A=0, B=0, C=1
    A = 0; B = 0; C = 1;
    #10;
    if (X !== 1 || Y !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: A=0, B=1, C=0
    A = 0; B = 1; C = 0;
    #10;
    if (X !== 1 || Y !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: A=0, B=1, C=1
    A = 0; B = 1; C = 1;
    #10;
    if (X !== 0 || Y !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: A=1, B=0, C=0
    A = 1; B = 0; C = 0;
    #10;
    if (X !== 1 || Y !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: A=1, B=0, C=1
    A = 1; B = 0; C = 1;
    #10;
    if (X !== 0 || Y !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: A=1, B=1, C=0
    A = 1; B = 1; C = 0;
    #10;
    if (X !== 0 || Y !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: A=1, B=1, C=1
    A = 1; B = 1; C = 1;
    #10;
    if (X !== 1 || Y !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule