`timescale 1ns/1ps

module tb_xor_gate;

  // Inputs
  reg a;
  reg b;

  // Output
  wire c;

  // Instantiate the Unit Under Test (UUT)
  xor_gate uut (
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (c !== 1'b0) $display("FAIL: Test case 1 failed (a=0, b=0)"); 

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (c !== 1'b1) $display("FAIL: Test case 2 failed (a=0, b=1)"); 

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (c !== 1'b1) $display("FAIL: Test case 3 failed (a=1, b=0)"); 

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (c !== 1'b0) $display("FAIL: Test case 4 failed (a=1, b=1)"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule