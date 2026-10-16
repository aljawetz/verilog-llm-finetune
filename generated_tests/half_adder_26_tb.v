`timescale 1ns/1ps

module tb_half_adder;

  reg A;
  reg B;
  wire S;
  wire C;

  // Instantiate the half_adder module
  half_adder uut (
    .A(A),
    .B(B),
    .S(S),
    .C(C)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 0; B = 0;
    #10;
    if (S !== 0 || C !== 0) $display("FAIL: Test case 1 failed (A=0, B=0)");

    // Test case 2: A = 0, B = 1
    A = 0; B = 1;
    #10;
    if (S !== 1 || C !== 0) $display("FAIL: Test case 2 failed (A=0, B=1)");

    // Test case 3: A = 1, B = 0
    A = 1; B = 0;
    #10;
    if (S !== 1 || C !== 0) $display("FAIL: Test case 3 failed (A=1, B=0)");

    // Test case 4: A = 1, B = 1
    A = 1; B = 1;
    #10;
    if (S !== 0 || C !== 1) $display("FAIL: Test case 4 failed (A=1, B=1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule