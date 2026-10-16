`timescale 1ns/1ps

module tb_or_gate;

  // Inputs
  reg a;
  reg b;

  // Output
  wire c;

  // Instantiate the Unit Under Test (UUT)
  or_gate uut (
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test Case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (c !== 1'b0) $display("FAIL: Test Case 1 failed (a=0, b=0)"); 

    // Test Case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (c !== 1'b1) $display("FAIL: Test Case 2 failed (a=0, b=1)"); 

    // Test Case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (c !== 1'b1) $display("FAIL: Test Case 3 failed (a=1, b=0)"); 

    // Test Case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (c !== 1'b1) $display("FAIL: Test Case 4 failed (a=1, b=1)"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule