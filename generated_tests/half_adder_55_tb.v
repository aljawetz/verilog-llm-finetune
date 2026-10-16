`timescale 1ns/1ps

module tb_half_adder;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire s;
  wire Cout;

  // Instantiate the Unit Under Test (UUT)
  half_adder uut (
    .a(a), 
    .b(b), 
    .s(s), 
    .Cout(Cout)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (s !== 0 || Cout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (s !== 1 || Cout !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (s !== 1 || Cout !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (s !== 0 || Cout !== 1) $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule