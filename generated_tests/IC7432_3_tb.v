`timescale 1ns/1ps

module tb_IC7432;

  // Inputs
  reg P1, P2, P4, P5, P7, P9, P10, P12, P13;
  
  // Outputs
  wire P3, P6, P8, P11;

  // Instantiate the Unit Under Test (UUT)
  IC7432 uut (
    .P1(P1), 
    .P2(P2), 
    .P3(P3), 
    .P4(P4), 
    .P5(P5), 
    .P6(P6), 
    .P7(P7), 
    .P8(P8), 
    .P9(P9), 
    .P10(P10), 
    .P11(P11), 
    .P12(P12), 
    .P13(P13), 
    .P14(1'b0) // Connect P14 to ground (not used)
  );

  initial begin
    // Test Case 1: Check all OR gates with various combinations
    // Test 1: P1=0, P2=0 -> P3 should be 0
    P1 = 0; P2 = 0; P4 = 0; P5 = 0; P9 = 0; P10 = 0; P12 = 0; P13 = 0;
    #10;
    if (P3 !== 0) $display("FAIL: Test 1 failed, expected P3=0, got P3=%b", P3);

    // Test 2: P1=1, P2=0 -> P3 should be 1
    P1 = 1; P2 = 0;
    #10;
    if (P3 !== 1) $display("FAIL: Test 2 failed, expected P3=1, got P3=%b", P3);

    // Test 3: P1=0, P2=1 -> P3 should be 1
    P1 = 0; P2 = 1;
    #10;
    if (P3 !== 1) $display("FAIL: Test 3 failed, expected P3=1, got P3=%b", P3);

    // Test 4: P1=1, P2=1 -> P3 should be 1
    P1 = 1; P2 = 1;
    #10;
    if (P3 !== 1) $display("FAIL: Test 4 failed, expected P3=1, got P3=%b", P3);

    // Test 5: Check P6 with P4=0, P5=0 -> P6 should be 0
    P4 = 0; P5 = 0;
    #10;
    if (P6 !== 0) $display("FAIL: Test 5 failed, expected P6=0, got P6=%b", P6);

    // Test 6: Check P6 with P4=1, P5=0 -> P6 should be 1
    P4 = 1; P5 = 0;
    #10;
    if (P6 !== 1) $display("FAIL: Test 6 failed, expected P6=1, got P6=%b", P6);

    // Test 7: Check P8 with P9=0, P10=0 -> P8 should be 0
    P9 = 0; P10 = 0;
    #10;
    if (P8 !== 0) $display("FAIL: Test 7 failed, expected P8=0, got P8=%b", P8);

    // Test 8: Check P8 with P9=1, P10=0 -> P8 should be 1
    P9 = 1; P10 = 0;
    #10;
    if (P8 !== 1) $display("FAIL: Test 8 failed, expected P8=1, got P8=%b", P8);

    // Test 9: Check P11 with P12=0, P13=0 -> P11 should be 0
    P12 = 0; P13 = 0;
    #10;
    if (P11 !== 0) $display("FAIL: Test 9 failed, expected P11=0, got P11=%b", P11);

    // Test 10: Check P11 with P12=1, P13=0 -> P11 should be 1
    P12 = 1; P13 = 0;
    #10;
    if (P11 !== 1) $display("FAIL: Test 10 failed, expected P11=1, got P11=%b", P11);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule