`timescale 1ns/1ps

module tb_alu;
  reg [7:0] a;
  reg [7:0] b;
  reg [2:0] opcode;
  wire [15:0] result;

  // Instantiate the ALU module
  alu uut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .result(result)
  );

  initial begin
    // Test case 1: Addition
    a = 8'd15; b = 8'd10; opcode = 3'b000; // 15 + 10 = 25
    #10;
    if (result !== 16'd25) $display("FAIL: Addition failed");

    // Test case 2: Multiplication
    a = 8'd5; b = 8'd6; opcode = 3'b001; // 5 * 6 = 30
    #10;
    if (result !== 16'd30) $display("FAIL: Multiplication failed");

    // Test case 3: Subtraction
    a = 8'd20; b = 8'd5; opcode = 3'b010; // 20 - 5 = 15
    #10;
    if (result !== 16'd15) $display("FAIL: Subtraction failed");

    // Test case 4: Bitwise AND
    a = 8'b11001100; b = 8'b10101010; opcode = 3'b011; // 11001100 & 10101010 = 10001000
    #10;
    if (result !== 16'b00000000000010001000) $display("FAIL: Bitwise AND failed");

    // Test case 5: Bitwise OR
    a = 8'b11001100; b = 8'b10101010; opcode = 3'b100; // 11001100 | 10101010 = 11101110
    #10;
    if (result !== 16'b00000000000011101110) $display("FAIL: Bitwise OR failed");

    // Test case 6: Bitwise XOR
    a = 8'b11001100; b = 8'b10101010; opcode = 3'b101; // 11001100 ^ 10101010 = 01100110
    #10;
    if (result !== 16'b00000000000001100110) $display("FAIL: Bitwise XOR failed");

    // Test case 7: Division
    a = 8'd20; b = 8'd4; opcode = 3'b110; // 20 / 4 = 5
    #10;
    if (result !== 16'd5) $display("FAIL: Division failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule