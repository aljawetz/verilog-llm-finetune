`timescale 1ns/1ps

module tb_FP32_ADD_mgc_shift_l_v4;

  // Parameters
  parameter WIDTH_A = 4;
  parameter WIDTH_S = 2;
  parameter WIDTH_Z = 8;

  // Inputs
  reg [WIDTH_A-1:0] a;
  reg [WIDTH_S-1:0] s;

  // Outputs
  wire [WIDTH_Z-1:0] z;

  // Instantiate the Unit Under Test (UUT)
  FP32_ADD_mgc_shift_l_v4 uut (
    .a(a),
    .s(s),
    .z(z)
  );

  initial begin
    // Test case 1: Shift left by 0
    a = 4'b1010; // -6 in signed
    s = 2'b00;   // Shift by 0
    #10;
    if (z !== 8'b11111110) $display("FAIL: Test case 1 failed, expected 11111110, got %b", z);

    // Test case 2: Shift left by 1
    a = 4'b1010; // -6 in signed
    s = 2'b01;   // Shift by 1
    #10;
    if (z !== 8'b11111100) $display("FAIL: Test case 2 failed, expected 11111100, got %b", z);

    // Test case 3: Shift left by 2
    a = 4'b1010; // -6 in signed
    s = 2'b10;   // Shift by 2
    #10;
    if (z !== 8'b11111000) $display("FAIL: Test case 3 failed, expected 11111000, got %b", z);

    // Test case 4: Shift left by 3
    a = 4'b1010; // -6 in signed
    s = 2'b11;   // Shift by 3
    #10;
    if (z !== 8'b11110000) $display("FAIL: Test case 4 failed, expected 11110000, got %b", z);

    // Test case 5: Shift left with positive number
    a = 4'b0110; // 6 in signed
    s = 2'b01;   // Shift by 1
    #10;
    if (z !== 8'b00000110) $display("FAIL: Test case 5 failed, expected 00000110, got %b", z);

    // Test case 6: Shift left by 2 with positive number
    a = 4'b0110; // 6 in signed
    s = 2'b10;   // Shift by 2
    #10;
    if (z !== 8'b00001100) $display("FAIL: Test case 6 failed, expected 00001100, got %b", z);

    // Test case 7: Shift left by 3 with positive number
    a = 4'b0110; // 6 in signed
    s = 2'b11;   // Shift by 3
    #10;
    if (z !== 8'b00011000) $display("FAIL: Test case 7 failed, expected 00011000, got %b", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule