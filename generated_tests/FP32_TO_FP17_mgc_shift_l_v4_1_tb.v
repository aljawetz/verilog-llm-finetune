`timescale 1ns/1ps

module tb_FP32_TO_FP17_mgc_shift_l_v4;

  // Parameters
  parameter width_a = 4;
  parameter width_s = 2;
  parameter width_z = 8;

  // Inputs
  reg [width_a-1:0] a;
  reg [width_s-1:0] s;
  reg sbit;

  // Outputs
  wire [width_z-1:0] z;

  // Instantiate the Unit Under Test (UUT)
  FP32_TO_FP17_mgc_shift_l_v4 uut (
    .a(a),
    .s(s),
    .z(z)
  );

  initial begin
    // Test Case 1: Shift left with sign bit
    a = 4'b1010; // -6 in signed
    s = 2'b01;   // Shift left by 1
    sbit = 1'b1; // Sign bit is 1
    #10;
    if (z !== 8'b11101000) $display("FAIL: Test Case 1 failed, expected 11101000, got %b", z);

    // Test Case 2: Shift left without sign bit
    a = 4'b0011; // 3 in unsigned
    s = 2'b10;   // Shift left by 2
    sbit = 1'b0; // Sign bit is 0
    #10;
    if (z !== 8'b00001100) $display("FAIL: Test Case 2 failed, expected 00001100, got %b", z);

    // Test Case 3: Shift left with zero input
    a = 4'b0000; // 0 in unsigned
    s = 2'b11;   // Shift left by 3
    sbit = 1'b0; // Sign bit is 0
    #10;
    if (z !== 8'b00000000) $display("FAIL: Test Case 3 failed, expected 00000000, got %b", z);

    // Test Case 4: Shift left with maximum input
    a = 4'b1111; // 15 in unsigned
    s = 2'b01;   // Shift left by 1
    sbit = 1'b0; // Sign bit is 0
    #10;
    if (z !== 8'b00001110) $display("FAIL: Test Case 4 failed, expected 00001110, got %b", z);

    // Test Case 5: Shift left with sign bit and maximum negative input
    a = 4'b1000; // -8 in signed
    s = 2'b01;   // Shift left by 1
    sbit = 1'b1; // Sign bit is 1
    #10;
    if (z !== 8'b11111000) $display("FAIL: Test Case 5 failed, expected 11111000, got %b", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule