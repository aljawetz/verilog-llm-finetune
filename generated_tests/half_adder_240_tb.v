`timescale 1ns/1ps

module tb_half_adder;

  // Inputs
  reg A;
  reg B;

  // Outputs
  wire S;
  wire carry;

  // Instantiate the half_adder module
  half_adder uut (
    .A(A),
    .B(B),
    .S(S),
    .carry(carry)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 0; B = 0;
    #10;
    if (S !== 0 || carry !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: A = 0, B = 1
    A = 0; B = 1;
    #10;
    if (S !== 1 || carry !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: A = 1, B = 0
    A = 1; B = 0;
    #10;
    if (S !== 1 || carry !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: A = 1, B = 1
    A = 1; B = 1;
    #10;
    if (S !== 0 || carry !== 1) $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule