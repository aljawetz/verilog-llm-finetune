`timescale 1ns/1ps

module tb_AND_4Input;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg d;

  // Output
  wire y;

  // Instantiate the Unit Under Test (UUT)
  AND_4Input uut (
    .a(a), 
    .b(b), 
    .c(c), 
    .d(d), 
    .y(y)
  );

  initial begin
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);

    // Test case 2: One input is 1
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 2 failed, expected y=0, got y=%b", y);

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 3 failed, expected y=0, got y=%b", y);

    // Test case 4: Three inputs are 1
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);

    // Test case 5: All inputs are 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule