`timescale 1ns/1ps

module tb_FourBitALU;

  // Inputs
  reg [3:0] A;
  reg [3:0] B;
  reg [3:0] ShiftAmount;
  reg [3:0] RotateAmount;
  reg [3:0] OpCode;

  // Outputs
  wire [3:0] Result;
  wire Cout;
  wire Bout;
  wire Overflow;
  wire Zero;
  wire Sign;
  wire Parity;

  // Instantiate the Unit Under Test (UUT)
  FourBitALU uut (
    .A(A),
    .B(B),
    .ShiftAmount(ShiftAmount),
    .RotateAmount(RotateAmount),
    .OpCode(OpCode),
    .Result(Result),
    .Cout(Cout),
    .Bout(Bout),
    .Overflow(Overflow),
    .Zero(Zero),
    .Sign(Sign),
    .Parity(Parity)
  );

  initial begin
    // Test Addition
    A = 4'b0011; B = 4'b0001; OpCode = 4'b0000; // 3 + 1 = 4
    #10;
    if (Result !== 4'b0100 || Cout !== 1'b0 || Overflow !== 1'b0 || Zero !== 1'b0 || Sign !== 1'b0 || Parity !== 1'b0) 
      $display("FAIL: Addition test failed");
    
    // Test Subtraction
    A = 4'b0100; B = 4'b0011; OpCode = 4'b0001; // 4 - 3 = 1
    #10;
    if (Result !== 4'b0001 || Bout !== 1'b0 || Overflow !== 1'b0 || Zero !== 1'b0 || Sign !== 1'b0 || Parity !== 1'b0) 
      $display("FAIL: Subtraction test failed");
    
    // Test Bitwise AND
    A = 4'b1100; B = 4'b1010; OpCode = 4'b0010; // 12 & 10 = 8
    #10;
    if (Result !== 4'b1000 || Cout !== 1'b0 || Bout !== 1'b0 || Overflow !== 1'b0 || Zero !== 1'b0 || Sign !== 1'b0 || Parity !== 1'b0) 
      $display("FAIL: Bitwise AND test failed");
    
    // Test Bitwise OR
    A = 4'b1100; B = 4'b1010; OpCode = 4'b0011; // 12 | 10 = 14
    #10;
    if (Result !== 4'b1110 || Cout !== 1'b0 || Bout !== 1'b0 || Overflow !== 1'b0 || Zero !== 1'b0 || Sign !== 1'b1 || Parity !== 1'b0) 
      $display("FAIL: Bitwise OR test failed");
    
    // Test Bitwise XOR
    A = 4'b1100; B = 4'b1010; OpCode = 4'b0100; // 12 ^ 10 = 6
    #10;
    if (Result !== 4'b0110 || Cout !== 1'b0 || Bout !== 1'b0 || Overflow !== 1'b0 || Zero !== 1'b0 || Sign !== 1'b0 || Parity !== 1'b1) 
      $display("FAIL: Bitwise XOR test failed");
    
    // Test Logical Shift Left
    A = 4'b0001; ShiftAmount = 4'b0001; OpCode = 4'b0101; // 1 << 1 = 2
    #10;
    if (Result !== 4'b0010 || Cout !== 1'b0 || Bout !== 1'b0 || Overflow !== 1'b0 || Zero !== 1'b0 || Sign !== 1'b0 || Parity !== 1'b0) 
      $display("FAIL: Logical Shift Left test failed");
    
    // Test Logical Shift Right
    A = 4'b0010; ShiftAmount = 4'b0001; OpCode = 4'b0110; // 2 >> 1 = 1
    #10;
    if (Result !== 4'b0001 || Cout !== 1'b0 || Bout !== 1'b0 || Overflow !== 1'b0 || Zero !== 1'b0 || Sign !== 1'b0 || Parity !== 1'b0) 
      $display("FAIL: Logical Shift Right test failed");
    
    // Test Rotate Right
    A = 4'b1001; RotateAmount = 4'b0001; OpCode = 4'b0111; // Rotate 1001 right by 1 = 1100
    #10;
    if (Result !== 4'b1100 || Cout !== 1'b0 || Bout !== 1'b0 || Overflow !== 1'b0 || Zero !== 1'b0 || Sign !== 1'b1 || Parity !== 1'b0) 
      $display("FAIL: Rotate Right test failed");
    
    // Test Rotate Left
    A = 4'b1001; RotateAmount = 4'b0001; OpCode = 4'b1000; // Rotate 1001 left by 1 = 0011
    #10;
    if (Result !== 4'b0011 || Cout !== 1'b0 || Bout !== 1'b0 || Overflow !== 1'b0 || Zero !== 1'b0 || Sign !== 1'b0 || Parity !== 1'b1) 
      $display("FAIL: Rotate Left test failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule