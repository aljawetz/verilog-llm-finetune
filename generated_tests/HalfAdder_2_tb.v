`timescale 1ns/1ps

module tb_HalfAdder;

  reg A;
  reg B;
  wire Sum;
  wire Carry;

  // Instantiate the HalfAdder module
  HalfAdder uut (
    .A(A),
    .B(B),
    .Sum(Sum),
    .Carry(Carry)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 0; B = 0;
    #10;
    if (Sum !== 0 || Carry !== 0) begin
      $display("FAIL: Test case 1 failed (A=0, B=0)");
      $finish;
    end

    // Test case 2: A = 0, B = 1
    A = 0; B = 1;
    #10;
    if (Sum !== 1 || Carry !== 0) begin
      $display("FAIL: Test case 2 failed (A=0, B=1)");
      $finish;
    end

    // Test case 3: A = 1, B = 0
    A = 1; B = 0;
    #10;
    if (Sum !== 1 || Carry !== 0) begin
      $display("FAIL: Test case 3 failed (A=1, B=0)");
      $finish;
    end

    // Test case 4: A = 1, B = 1
    A = 1; B = 1;
    #10;
    if (Sum !== 0 || Carry !== 1) begin
      $display("FAIL: Test case 4 failed (A=1, B=1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule