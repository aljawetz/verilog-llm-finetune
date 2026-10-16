`timescale 1ns/1ps

module tb_day4;

  // Inputs
  reg [7:0] a_i;
  reg [7:0] b_i;
  reg [2:0] op_i;

  // Outputs
  wire [7:0] alu_o;

  // Instantiate the Unit Under Test (UUT)
  day4 uut (
    .a_i(a_i),
    .b_i(b_i),
    .op_i(op_i),
    .alu_o(alu_o)
  );

  initial begin
    // Test Addition
    a_i = 8'd15; b_i = 8'd10; op_i = 3'b000; // 15 + 10
    #10;
    if (alu_o !== 8'd25) $display("FAIL: Addition failed");

    // Test Subtraction
    a_i = 8'd20; b_i = 8'd5; op_i = 3'b001; // 20 - 5
    #10;
    if (alu_o !== 8'd15) $display("FAIL: Subtraction failed");

    // Test Logical Shift Left
    a_i = 8'b00001111; b_i = 8'b00000001; op_i = 3'b010; // 00001111 << 1
    #10;
    if (alu_o !== 8'b00011110) $display("FAIL: Shift Left failed");

    // Test Logical Shift Right
    a_i = 8'b00001111; b_i = 8'b00000001; op_i = 3'b011; // 00001111 >> 1
    #10;
    if (alu_o !== 8'b00000111) $display("FAIL: Shift Right failed");

    // Test Bitwise AND
    a_i = 8'b10101010; b_i = 8'b11001100; op_i = 3'b100; // 10101010 & 11001100
    #10;
    if (alu_o !== 8'b10001000) $display("FAIL: AND failed");

    // Test Bitwise OR
    a_i = 8'b10101010; b_i = 8'b11001100; op_i = 3'b101; // 10101010 | 11001100
    #10;
    if (alu_o !== 8'b11101110) $display("FAIL: OR failed");

    // Test Bitwise XOR
    a_i = 8'b10101010; b_i = 8'b11001100; op_i = 3'b110; // 10101010 ^ 11001100
    #10;
    if (alu_o !== 8'b01100110) $display("FAIL: XOR failed");

    // Test Equality Check
    a_i = 8'd100; b_i = 8'd100; op_i = 3'b111; // 100 == 100
    #10;
    if (alu_o !== 8'b00000001) $display("FAIL: Equality Check failed");

    a_i = 8'd100; b_i = 8'd99; op_i = 3'b111; // 100 == 99
    #10;
    if (alu_o !== 8'b00000000) $display("FAIL: Equality Check failed");

    $display("PASS");
    $finish;
  end

endmodule