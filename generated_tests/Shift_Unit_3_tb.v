`timescale 1ns/1ps

module tb_Shift_Unit;

  reg [15:0] A;
  reg [15:0] B;
  reg [3:0] ALU_FUN;
  reg clock;
  reg shift_enable;
  reg rest;
  wire shift_flag;
  wire [15:0] shift_out;

  // Instantiate the Unit Under Test (UUT)
  Shift_Unit uut (
    .A(A),
    .B(B),
    .ALU_FUN(ALU_FUN),
    .clock(clock),
    .shift_enable(shift_enable),
    .rest(rest),
    .shift_flag(shift_flag),
    .shift_out(shift_out)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    A = 16'b0000000000000001; // A = 1
    B = 16'b0000000000000010; // B = 2
    ALU_FUN = 4'b0000; // Shift A right
    shift_enable = 0;
    rest = 0;

    // Apply reset
    #10;
    rest = 1; // Release reset
    #10;

    // Test shifting A right
    shift_enable = 1;
    ALU_FUN = 4'b0000; // Shift A right
    #10;
    if (shift_flag !== 1'b1 || shift_out !== 16'b0000000000000000) begin
      $display("FAIL: Expected shift_out = 0, got %b", shift_out);
      $finish;
    end

    // Test shifting A left
    ALU_FUN = 4'b0001; // Shift A left
    #10;
    if (shift_flag !== 1'b1 || shift_out !== 16'b0000000000000010) begin
      $display("FAIL: Expected shift_out = 2, got %b", shift_out);
      $finish;
    end

    // Test shifting B right
    ALU_FUN = 4'b0010; // Shift B right
    #10;
    if (shift_flag !== 1'b1 || shift_out !== 16'b0000000000000001) begin
      $display("FAIL: Expected shift_out = 1, got %b", shift_out);
      $finish;
    end

    // Test shifting B left
    ALU_FUN = 4'b0011; // Shift B left
    #10;
    if (shift_flag !== 1'b1 || shift_out !== 16'b0000000000000100) begin
      $display("FAIL: Expected shift_out = 4, got %b", shift_out);
      $finish;
    end

    // Test disable shift
    shift_enable = 0;
    #10;
    if (shift_flag !== 1'b0 || shift_out !== 16'b0000000000000000) begin
      $display("FAIL: Expected shift_out = 0, got %b", shift_out);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule