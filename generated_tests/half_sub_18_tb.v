`timescale 1ns/1ps

module tb_half_sub;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire bout;
  wire diff;

  // Instantiate the Unit Under Test (UUT)
  half_sub uut (
    .a(a), 
    .b(b), 
    .bout(bout), 
    .diff(diff)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (bout !== 0 || diff !== 0) $display("FAIL: Test case 1 failed");
    
    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (bout !== 1 || diff !== 1) $display("FAIL: Test case 2 failed");
    
    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (bout !== 0 || diff !== 1) $display("FAIL: Test case 3 failed");
    
    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (bout !== 0 || diff !== 0) $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule