`timescale 1ns/1ps

module tb_ALU_4bits;

  reg [3:0] operand_A;
  reg [3:0] operand_B;
  reg [1:0] operation;
  wire [3:0] result;

  // Instantiate the ALU module
  ALU_4bits uut (
    .operand_A(operand_A),
    .operand_B(operand_B),
    .operation(operation),
    .result(result)
  );

  initial begin
    // Test Addition
    operand_A = 4'b0011; // 3
    operand_B = 4'b0001; // 1
    operation = 2'b00;   // Add
    #10;
    if (result !== 4'b0100) $display("FAIL: Addition test failed"); // 3 + 1 = 4

    // Test Subtraction
    operand_A = 4'b0100; // 4
    operand_B = 4'b0010; // 2
    operation = 2'b01;   // Subtract
    #10;
    if (result !== 4'b0010) $display("FAIL: Subtraction test failed"); // 4 - 2 = 2

    // Test Bitwise AND
    operand_A = 4'b1100; // 12
    operand_B = 4'b1010; // 10
    operation = 2'b10;   // AND
    #10;
    if (result !== 4'b1000) $display("FAIL: Bitwise AND test failed"); // 12 & 10 = 8

    // Test Bitwise OR
    operand_A = 4'b1100; // 12
    operand_B = 4'b1010; // 10
    operation = 2'b11;   // OR
    #10;
    if (result !== 4'b1110) $display("FAIL: Bitwise OR test failed"); // 12 | 10 = 14

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule