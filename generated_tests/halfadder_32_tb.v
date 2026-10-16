`timescale 1ns/1ps

module tb_halfadder;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire sum;
  wire carry;

  // Instantiate the Unit Under Test (UUT)
  halfadder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    // Test Case 1: a=0, b=0
    a = 0; b = 0;
    #10;
    if (sum !== 0 || carry !== 0) begin
      $display("FAIL: Test Case 1 failed (a=0, b=0)");
      $finish;
    end

    // Test Case 2: a=0, b=1
    a = 0; b = 1;
    #10;
    if (sum !== 1 || carry !== 0) begin
      $display("FAIL: Test Case 2 failed (a=0, b=1)");
      $finish;
    end

    // Test Case 3: a=1, b=0
    a = 1; b = 0;
    #10;
    if (sum !== 1 || carry !== 0) begin
      $display("FAIL: Test Case 3 failed (a=1, b=0)");
      $finish;
    end

    // Test Case 4: a=1, b=1
    a = 1; b = 1;
    #10;
    if (sum !== 0 || carry !== 1) begin
      $display("FAIL: Test Case 4 failed (a=1, b=1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule