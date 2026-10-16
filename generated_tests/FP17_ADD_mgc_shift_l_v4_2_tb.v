`timescale 1ns/1ps

module tb_FP17_ADD_mgc_shift_l_v4;

  // Parameters
  parameter width_a = 4;
  parameter signd_a = 1;
  parameter width_s = 2;
  parameter width_z = 8;

  // Inputs
  reg [width_a-1:0] a;
  reg [width_s-1:0] s;

  // Outputs
  wire [width_z-1:0] z;

  // Instantiate the Unit Under Test (UUT)
  FP17_ADD_mgc_shift_l_v4 uut (
    .a(a),
    .s(s),
    .z(z)
  );

  initial begin
    // Test case 1: Shift left with positive number
    a = 4'b0011; // 3 in decimal
    s = 2'b01;   // Shift left by 1
    #10;
    if (z !== 8'b00000011 << 1) begin
      $display("FAIL: Test case 1 failed, expected %b but got %b", 8'b00000011 << 1, z);
      $finish;
    end

    // Test case 2: Shift left with negative number
    a = 4'b1101; // -3 in decimal (signed)
    s = 2'b01;   // Shift left by 1
    #10;
    if (z !== 8'b11111101 << 1) begin
      $display("FAIL: Test case 2 failed, expected %b but got %b", 8'b11111101 << 1, z);
      $finish;
    end

    // Test case 3: Shift left by 2
    a = 4'b0101; // 5 in decimal
    s = 2'b10;   // Shift left by 2
    #10;
    if (z !== 8'b00000101 << 2) begin
      $display("FAIL: Test case 3 failed, expected %b but got %b", 8'b00000101 << 2, z);
      $finish;
    end

    // Test case 4: Shift left with zero
    a = 4'b0000; // 0 in decimal
    s = 2'b11;   // Shift left by 3
    #10;
    if (z !== 8'b00000000) begin
      $display("FAIL: Test case 4 failed, expected %b but got %b", 8'b00000000, z);
      $finish;
    end

    // Test case 5: Shift left with maximum positive value
    a = 4'b0111; // 7 in decimal
    s = 2'b01;   // Shift left by 1
    #10;
    if (z !== 8'b00000111 << 1) begin
      $display("FAIL: Test case 5 failed, expected %b but got %b", 8'b00000111 << 1, z);
      $finish;
    end

    // Test case 6: Shift left with maximum negative value
    a = 4'b1000; // -8 in decimal (signed)
    s = 2'b01;   // Shift left by 1
    #10;
    if (z !== 8'b11111000 << 1) begin
      $display("FAIL: Test case 6 failed, expected %b but got %b", 8'b11111000 << 1, z);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule