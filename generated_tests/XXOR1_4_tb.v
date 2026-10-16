`timescale 1ns/1ps

module tb_XXOR1;

  reg A;
  reg B;
  reg GIN;
  reg PHI;
  wire SUM;

  // Instantiate the module under test (uut)
  XXOR1 uut (
    .A(A),
    .B(B),
    .GIN(GIN),
    .PHI(PHI),
    .SUM(SUM)
  );

  initial begin
    // Test sequence
    // Test case 1: A=0, B=0, GIN=0, PHI=0
    A = 0; B = 0; GIN = 0; PHI = 0;
    #10;
    if (SUM !== 1) $display("FAIL: Test case 1 failed (A=0, B=0, GIN=0, PHI=0)"); 

    // Test case 2: A=0, B=0, GIN=1, PHI=0
    A = 0; B = 0; GIN = 1; PHI = 0;
    #10;
    if (SUM !== 0) $display("FAIL: Test case 2 failed (A=0, B=0, GIN=1, PHI=0)"); 

    // Test case 3: A=0, B=1, GIN=0, PHI=0
    A = 0; B = 1; GIN = 0; PHI = 0;
    #10;
    if (SUM !== 1) $display("FAIL: Test case 3 failed (A=0, B=1, GIN=0, PHI=0)"); 

    // Test case 4: A=0, B=1, GIN=1, PHI=0
    A = 0; B = 1; GIN = 1; PHI = 0;
    #10;
    if (SUM !== 0) $display("FAIL: Test case 4 failed (A=0, B=1, GIN=1, PHI=0)"); 

    // Test case 5: A=1, B=0, GIN=0, PHI=0
    A = 1; B = 0; GIN = 0; PHI = 0;
    #10;
    if (SUM !== 1) $display("FAIL: Test case 5 failed (A=1, B=0, GIN=0, PHI=0)"); 

    // Test case 6: A=1, B=0, GIN=1, PHI=0
    A = 1; B = 0; GIN = 1; PHI = 0;
    #10;
    if (SUM !== 0) $display("FAIL: Test case 6 failed (A=1, B=0, GIN=1, PHI=0)"); 

    // Test case 7: A=1, B=1, GIN=0, PHI=0
    A = 1; B = 1; GIN = 0; PHI = 0;
    #10;
    if (SUM !== 0) $display("FAIL: Test case 7 failed (A=1, B=1, GIN=0, PHI=0)"); 

    // Test case 8: A=1, B=1, GIN=1, PHI=0
    A = 1; B = 1; GIN = 1; PHI = 0;
    #10;
    if (SUM !== 1) $display("FAIL: Test case 8 failed (A=1, B=1, GIN=1, PHI=0)"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule