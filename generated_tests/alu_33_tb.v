`timescale 1ns/1ps

module tb_alu;
  // Inputs
  reg [3:0] a;
  reg [3:0] b;
  reg [2:0] opcode;
  
  // Output
  wire [7:0] rslt;
  
  // Instantiate the ALU
  alu uut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .rslt(rslt)
  );

  // Test procedure
  initial begin
    // Test addition
    a = 4'd5; b = 4'd3; opcode = 3'b000; // 5 + 3 = 8
    #10;
    if (rslt !== 8'd8) $display("FAIL: Addition failed");

    // Test subtraction
    a = 4'd5; b = 4'd3; opcode = 3'b001; // 5 - 3 = 2
    #10;
    if (rslt !== 8'd2) $display("FAIL: Subtraction failed");

    // Test multiplication
    a = 4'd2; b = 4'd3; opcode = 3'b010; // 2 * 3 = 6
    #10;
    if (rslt !== 8'd6) $display("FAIL: Multiplication failed");

    // Test AND
    a = 4'b1100; b = 4'b1010; opcode = 3'b011; // 1100 & 1010 = 1000
    #10;
    if (rslt !== 8'b00001000) $display("FAIL: AND operation failed");

    // Test OR
    a = 4'b1100; b = 4'b1010; opcode = 3'b100; // 1100 | 1010 = 1110
    #10;
    if (rslt !== 8'b00001110) $display("FAIL: OR operation failed");

    // Test NOT
    a = 4'b1100; opcode = 3'b101; // ~1100 = 0011
    #10;
    if (rslt !== 8'b00000011) $display("FAIL: NOT operation failed");

    // Test XOR
    a = 4'b1100; b = 4'b1010; opcode = 3'b110; // 1100 ^ 1010 = 0110
    #10;
    if (rslt !== 8'b00000110) $display("FAIL: XOR operation failed");

    // Test XNOR
    a = 4'b1100; b = 4'b1010; opcode = 3'b111; // ~(1100 ^ 1010) = 1001
    #10;
    if (rslt !== 8'b00001001) $display("FAIL: XNOR operation failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule