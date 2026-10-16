`timescale 1ns/1ps

module tb_ARITHMETIC_UNIT;

  reg [15:0] A;
  reg [15:0] B;
  reg [1:0] ALU_FUN;
  reg CLK;
  reg RST;
  reg Arith_Enable;
  wire [15:0] Arith_OUT;
  wire Carry_OUT;
  wire Arith_Flag;

  // Instantiate the Unit Under Test (UUT)
  ARITHMETIC_UNIT uut (
    .A(A),
    .B(B),
    .ALU_FUN(ALU_FUN),
    .CLK(CLK),
    .RST(RST),
    .Arith_Enable(Arith_Enable),
    .Arith_OUT(Arith_OUT),
    .Carry_OUT(Carry_OUT),
    .Arith_Flag(Arith_Flag)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10 ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    RST = 0;
    A = 0;
    B = 0;
    ALU_FUN = 0;
    Arith_Enable = 0;

    // Apply reset
    #10 RST = 1;

    // Test Addition
    A = 16'h0001; B = 16'h0001; ALU_FUN = 2'b00; Arith_Enable = 1;
    #10;
    if (Arith_OUT !== 16'h0002 || Carry_OUT !== 1'b0 || Arith_Flag !== 1'b1) 
      $display("FAIL: Addition test failed");

    // Test Subtraction
    A = 16'h0002; B = 16'h0001; ALU_FUN = 2'b01; Arith_Enable = 1;
    #10;
    if (Arith_OUT !== 16'h0001 || Carry_OUT !== 1'b0 || Arith_Flag !== 1'b1) 
      $display("FAIL: Subtraction test failed");

    // Test Multiplication
    A = 16'h0002; B = 16'h0002; ALU_FUN = 2'b10; Arith_Enable = 1;
    #10;
    if (Arith_OUT !== 16'h0004 || Carry_OUT !== 1'b0 || Arith_Flag !== 1'b1) 
      $display("FAIL: Multiplication test failed");

    // Test Division
    A = 16'h0004; B = 16'h0002; ALU_FUN = 2'b11; Arith_Enable = 1;
    #10;
    if (Arith_OUT !== 16'h0002 || Carry_OUT !== 1'b0 || Arith_Flag !== 1'b1) 
      $display("FAIL: Division test failed");

    // Test Reset functionality
    Arith_Enable = 0; 
    #10;
    if (Arith_OUT !== 16'h0000 || Carry_OUT !== 1'b0 || Arith_Flag !== 1'b0) 
      $display("FAIL: Reset test failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule