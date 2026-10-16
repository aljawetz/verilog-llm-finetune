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

  // Instantiate the module under test (uut)
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
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    arth_enable = 0;
    rest = 0;
    #10;
    rest = 1; // Release reset
    #10;

    // Test addition
    A = 16'h0003; // 3
    B = 16'h0002; // 2
    ALU_FUN = 4'b0000; // Addition
    arth_enable = 1;
    #10;
    if (Arthmtic_out !== 5 || arth_flag !== 1 || carry_out !== 0) begin
      $display("FAIL: Addition test failed");
      $finish;
    end

    // Test subtraction
    A = 16'h0005; // 5
    B = 16'h0003; // 3
    ALU_FUN = 4'b0001; // Subtraction
    #10;
    if (Arthmtic_out !== 2 || arth_flag !== 1 || carry_out !== 0) begin
      $display("FAIL: Subtraction test failed");
      $finish;
    end

    // Test multiplication
    A = 16'h0002; // 2
    B = 16'h0003; // 3
    ALU_FUN = 4'b0010; // Multiplication
    #10;
    if (Arthmtic_out !== 6 || arth_flag !== 1 || carry_out !== 0) begin
      $display("FAIL: Multiplication test failed");
      $finish;
    end

    // Test division
    A = 16'h0006; // 6
    B = 16'h0002; // 2
    ALU_FUN = 4'b0011; // Division
    #10;
    if (Arthmtic_out !== 3 || arth_flag !== 1 || carry_out !== 0) begin
      $display("FAIL: Division test failed");
      $finish;
    end

    // Test with arth_enable = 0
    arth_enable = 0;
    #10;
    if (Arthmtic_out !== 0 || arth_flag !== 0 || carry_out !== 0) begin
      $display("FAIL: Disable arithmetic test failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule