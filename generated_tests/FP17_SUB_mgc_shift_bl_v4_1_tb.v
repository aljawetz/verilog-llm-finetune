`timescale 1ns/1ps

module tb_FP17_SUB_mgc_shift_bl_v4;

  // Parameters
  parameter WIDTH_A = 4;
  parameter WIDTH_S = 2;
  parameter WIDTH_Z = 8;

  // Inputs
  reg [WIDTH_A-1:0] a;
  reg [WIDTH_S-1:0] s;
  reg sbit;

  // Outputs
  wire [WIDTH_Z-1:0] z;

  // Instantiate the Unit Under Test (UUT)
  FP17_SUB_mgc_shift_bl_v4 uut (
    .a(a),
    .s(s),
    .z(z)
  );

  initial begin
    // Test cases
    // Test left shift with positive number
    a = 4'b0011; // 3
    s = 2'b01;   // Shift left by 1
    sbit = 1'b0; // Unsigned
    #10;
    if (z !== 8'b00000011) $display("FAIL: Expected 00000011 for a=0011, s=01, sbit=0, got %b", z);

    // Test left shift with sign extension
    a = 4'b1011; // -5
    s = 2'b01;   // Shift left by 1
    sbit = 1'b1; // Signed
    #10;
    if (z !== 8'b11101100) $display("FAIL: Expected 11101100 for a=1011, s=01, sbit=1, got %b", z);

    // Test right shift with positive number
    a = 4'b0011; // 3
    s = 2'b01;   // Shift right by 1
    sbit = 1'b0; // Unsigned
    #10;
    if (z !== 8'b00000001) $display("FAIL: Expected 00000001 for a=0011, s=01, sbit=0, got %b", z);

    // Test right shift with sign extension
    a = 4'b1011; // -5
    s = 2'b01;   // Shift right by 1
    sbit = 1'b1; // Signed
    #10;
    if (z !== 8'b11111011) $display("FAIL: Expected 11111011 for a=1011, s=01, sbit=1, got %b", z);

    // Test edge case: shifting zero
    a = 4'b0000; // 0
    s = 2'b10;   // Shift left by 2
    sbit = 1'b0; // Unsigned
    #10;
    if (z !== 8'b00000000) $display("FAIL: Expected 00000000 for a=0000, s=10, sbit=0, got %b", z);

    // Test edge case: shifting max positive
    a = 4'b0111; // 7
    s = 2'b10;   // Shift left by 2
    sbit = 1'b0; // Unsigned
    #10;
    if (z !== 8'b00000111) $display("FAIL: Expected 00000111 for a=0111, s=10, sbit=0, got %b", z);

    // Test edge case: shifting max negative
    a = 4'b1000; // -8
    s = 2'b10;   // Shift left by 2
    sbit = 1'b1; // Signed
    #10;
    if (z !== 8'b11111000) $display("FAIL: Expected 11111000 for a=1000, s=10, sbit=1, got %b", z);

    $display("PASS");
    $finish;
  end

endmodule