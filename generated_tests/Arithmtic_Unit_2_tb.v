`timescale 1ns/1ps

module tb_Arithmtic_Unit;

  reg signed [15:0] A;
  reg signed [15:0] B;
  reg [3:0] ALU_FUN;
  reg clock;
  reg arth_enable;
  reg rest;
  wire arth_flag;
  wire carry_out;
  wire signed [31:0] Arthmtic_out;

  // Instantiate the Unit Under Test (UUT)
  Arithmtic_Unit uut (
    .A(A),
    .B(B),
    .ALU_FUN(ALU_FUN),
    .clock(clock),
    .arth_enable(arth_enable),
    .rest(rest),
    .arth_flag(arth_flag),
    .carry_out(carry_out),
    .Arthmtic_out(Arthmtic_out)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    arth_enable = 0;
    rest = 0;
    #10; // Wait for reset to stabilize

    // Release reset
    rest = 1;
    #10;

    // Test Addition
    A = 16'd10; B = 16'd5; ALU_FUN = 4'b0000; arth_enable = 1;
    #10;
    if (Arthmtic_out !== 15'd15 || arth_flag !== 1 || carry_out !== 0) 
      $display("FAIL: Addition test failed");

    // Test Subtraction
    A = 16'd10; B = 16'd5; ALU_FUN = 4'b0001; arth_enable = 1;
    #10;
    if (Arthmtic_out !== 15'd5 || arth_flag !== 1 || carry_out !== 0) 
      $display("FAIL: Subtraction test failed");

    // Test Multiplication
    A = 16'd10; B = 16'd5; ALU_FUN = 4'b0010; arth_enable = 1;
    #10;
    if (Arthmtic_out !== 15'd50 || arth_flag !== 1 || carry_out !== 0) 
      $display("FAIL: Multiplication test failed");

    // Test Division
    A = 16'd10; B = 16'd5; ALU_FUN = 4'b0011; arth_enable = 1;
    #10;
    if (Arthmtic_out !== 15'd2 || arth_flag !== 1 || carry_out !== 0) 
      $display("FAIL: Division test failed");

    // Test with arth_enable = 0
    arth_enable = 0;
    A = 16'd10; B = 16'd5; ALU_FUN = 4'b0000; // Addition
    #10;
    if (Arthmtic_out !== 32'b0 || arth_flag !== 0 || carry_out !== 0) 
      $display("FAIL: Disable test failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule