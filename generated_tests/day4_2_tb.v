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
    // Test case 1: Addition
    a_i = 8'd15; b_i = 8'd10; op_i = 3'b000; // 15 + 10
    #10;
    if (alu_o !== 8'd25) $display("FAIL: Addition failed, expected 25 but got %d", alu_o);

    // Test case 2: Subtraction
    a_i = 8'd20; b_i = 8'd5; op_i = 3'b001; // 20 - 5
    #10;
    if (alu_o !== 8'd15) $display("FAIL: Subtraction failed, expected 15 but got %d", alu_o);

    // Test case 3: Shift Left
    a_i = 8'b00001111; b_i = 8'd2; op_i = 3'b010; // 15 << 2
    #10;
    if (alu_o !== 8'b00111100) $display("FAIL: Shift Left failed, expected 60 but got %b", alu_o);

    // Test case 4: Shift Right
    a_i = 8'b00001111; b_i = 8'd2; op_i = 3'b011; // 15 >> 2
    #10;
    if (alu_o !== 8'b00000011) $display("FAIL: Shift Right failed, expected 3 but got %b", alu_o);

    // Test case 5: Bitwise AND
    a_i = 8'b10101010; b_i = 8'b11001100; op_i = 3'b100; // 0xAA & 0xCC
    #10;
    if (alu_o !== 8'b10001000) $display("FAIL: AND failed, expected 0x88 but got %b", alu_o);

    // Test case 6: Bitwise OR
    a_i = 8'b10101010; b_i = 8'b11001100; op_i = 3'b101; // 0xAA | 0xCC
    #10;
    if (alu_o !== 8'b11101110) $display("FAIL: OR failed, expected 0xEE but got %b", alu_o);

    // Test case 7: Bitwise XOR
    a_i = 8'b10101010; b_i = 8'b11001100; op_i = 3'b110; // 0xAA ^ 0xCC
    #10;
    if (alu_o !== 8'b01100110) $display("FAIL: XOR failed, expected 0x66 but got %b", alu_o);

    // Test case 8: Equality Check
    a_i = 8'd10; b_i = 8'd10; op_i = 3'b111; // 10 == 10
    #10;
    if (alu_o !== 8'b00000001) $display("FAIL: Equality Check failed, expected 1 but got %b", alu_o);

    a_i = 8'd10; b_i = 8'd5; op_i = 3'b111; // 10 == 5
    #10;
    if (alu_o !== 8'b00000000) $display("FAIL: Equality Check failed, expected 0 but got %b", alu_o);

    $display("PASS");
    $finish;
  end

endmodule