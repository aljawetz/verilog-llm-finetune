`timescale 1ns/1ps

module tb_operator_C;

  reg P;
  reg G;
  reg G1;
  wire Go;

  // Instantiate the module under test (uut)
  operator_C uut (
    .P(P),
    .G(G),
    .G1(G1),
    .Go(Go)
  );

  initial begin
    // Test case 1: P=0, G=0, G1=0 -> Go should be 0
    P = 0; G = 0; G1 = 0;
    #10;
    if (Go !== 0) $display("FAIL: Test case 1 failed (P=0, G=0, G1=0)"); 

    // Test case 2: P=0, G=0, G1=1 -> Go should be 0
    P = 0; G = 0; G1 = 1;
    #10;
    if (Go !== 0) $display("FAIL: Test case 2 failed (P=0, G=0, G1=1)"); 

    // Test case 3: P=0, G=1, G1=0 -> Go should be 1
    P = 0; G = 1; G1 = 0;
    #10;
    if (Go !== 1) $display("FAIL: Test case 3 failed (P=0, G=1, G1=0)"); 

    // Test case 4: P=0, G=1, G1=1 -> Go should be 1
    P = 0; G = 1; G1 = 1;
    #10;
    if (Go !== 1) $display("FAIL: Test case 4 failed (P=0, G=1, G1=1)"); 

    // Test case 5: P=1, G=0, G1=0 -> Go should be 0
    P = 1; G = 0; G1 = 0;
    #10;
    if (Go !== 0) $display("FAIL: Test case 5 failed (P=1, G=0, G1=0)"); 

    // Test case 6: P=1, G=0, G1=1 -> Go should be 1
    P = 1; G = 0; G1 = 1;
    #10;
    if (Go !== 1) $display("FAIL: Test case 6 failed (P=1, G=0, G1=1)"); 

    // Test case 7: P=1, G=1, G1=0 -> Go should be 1
    P = 1; G = 1; G1 = 0;
    #10;
    if (Go !== 1) $display("FAIL: Test case 7 failed (P=1, G=1, G1=0)"); 

    // Test case 8: P=1, G=1, G1=1 -> Go should be 1
    P = 1; G = 1; G1 = 1;
    #10;
    if (Go !== 1) $display("FAIL: Test case 8 failed (P=1, G=1, G1=1)"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule