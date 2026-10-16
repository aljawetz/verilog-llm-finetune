`timescale 1ns/1ps

module tb_partial_full_adder;

  // Inputs
  reg ai;
  reg bi;
  reg ci;

  // Outputs
  wire pi;
  wire si;
  wire gi;

  // Instantiate the Unit Under Test (UUT)
  partial_full_adder uut (
    .pi(pi),
    .si(si),
    .gi(gi),
    .ai(ai),
    .bi(bi),
    .ci(ci)
  );

  initial begin
    // Test case 1: ai = 0, bi = 0, ci = 0
    ai = 0; bi = 0; ci = 0;
    #10;
    if (pi !== 0 || si !== 0 || gi !== 0) 
      $display("FAIL: Test case 1 failed with ai=0, bi=0, ci=0");
    
    // Test case 2: ai = 0, bi = 0, ci = 1
    ai = 0; bi = 0; ci = 1;
    #10;
    if (pi !== 0 || si !== 1 || gi !== 0) 
      $display("FAIL: Test case 2 failed with ai=0, bi=0, ci=1");
    
    // Test case 3: ai = 0, bi = 1, ci = 0
    ai = 0; bi = 1; ci = 0;
    #10;
    if (pi !== 1 || si !== 0 || gi !== 0) 
      $display("FAIL: Test case 3 failed with ai=0, bi=1, ci=0");
    
    // Test case 4: ai = 0, bi = 1, ci = 1
    ai = 0; bi = 1; ci = 1;
    #10;
    if (pi !== 1 || si !== 1 || gi !== 0) 
      $display("FAIL: Test case 4 failed with ai=0, bi=1, ci=1");
    
    // Test case 5: ai = 1, bi = 0, ci = 0
    ai = 1; bi = 0; ci = 0;
    #10;
    if (pi !== 1 || si !== 0 || gi !== 0) 
      $display("FAIL: Test case 5 failed with ai=1, bi=0, ci=0");
    
    // Test case 6: ai = 1, bi = 0, ci = 1
    ai = 1; bi = 0; ci = 1;
    #10;
    if (pi !== 1 || si !== 1 || gi !== 0) 
      $display("FAIL: Test case 6 failed with ai=1, bi=0, ci=1");
    
    // Test case 7: ai = 1, bi = 1, ci = 0
    ai = 1; bi = 1; ci = 0;
    #10;
    if (pi !== 0 || si !== 0 || gi !== 1) 
      $display("FAIL: Test case 7 failed with ai=1, bi=1, ci=0");
    
    // Test case 8: ai = 1, bi = 1, ci = 1
    ai = 1; bi = 1; ci = 1;
    #10;
    if (pi !== 0 || si !== 1 || gi !== 1) 
      $display("FAIL: Test case 8 failed with ai=1, bi=1, ci=1");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule