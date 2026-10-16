`timescale 1ns/1ps

module tb_nor_3;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Outputs
  wire y;

  // Instantiate the Unit Under Test (UUT)
  nor_3 uut (
    .a(a),
    .b(b),
    .c(c),
    .y(y)
  );

  initial begin
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 1 failed (a=0, b=0, c=0)"); 

    // Test case 2: One input is 1
    a = 1; b = 0; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 2 failed (a=1, b=0, c=0)"); 

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 3 failed (a=1, b=1, c=0)"); 

    // Test case 4: All inputs are 1
    a = 1; b = 1; c = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 4 failed (a=1, b=1, c=1)"); 

    // Test case 5: Two inputs are 1, one is 0
    a = 0; b = 1; c = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 5 failed (a=0, b=1, c=1)"); 

    // Test case 6: All inputs are 0 (again to check consistency)
    a = 0; b = 0; c = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 6 failed (a=0, b=0, c=0)"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule