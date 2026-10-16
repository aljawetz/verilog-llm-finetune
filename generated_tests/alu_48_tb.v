`timescale 1ns/1ps

module tb_alu;
  reg [3:0] a;
  reg [3:0] b;
  reg [2:0] opcode;
  wire [7:0] result;

  // Instantiate the ALU module
  alu uut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .result(result)
  );

  initial begin
    // Test addition
    a = 4'd5; b = 4'd3; opcode = 3'd0; #10;
    if (result !== 8'd8) $display("FAIL: Addition failed");

    // Test subtraction
    a = 4'd5; b = 4'd3; opcode = 3'd1; #10;
    if (result !== 8'd2) $display("FAIL: Subtraction failed");

    // Test multiplication
    a = 4'd2; b = 4'd3; opcode = 3'd2; #10;
    if (result !== 8'd6) $display("FAIL: Multiplication failed");

    // Test bitwise AND
    a = 4'd6; b = 4'd3; opcode = 3'd3; #10;
    if (result !== 8'd2) $display("FAIL: Bitwise AND failed");

    // Test bitwise OR
    a = 4'd6; b = 4'd3; opcode = 3'd4; #10;
    if (result !== 8'd7) $display("FAIL: Bitwise OR failed");

    // Test bitwise XOR
    a = 4'd6; b = 4'd3; opcode = 3'd5; #10;
    if (result !== 8'd5) $display("FAIL: Bitwise XOR failed");

    // Test bitwise XNOR
    a = 4'd6; b = 4'd3; opcode = 3'd6; #10;
    if (result !== 8'd0) $display("FAIL: Bitwise XNOR failed");

    // Test NOT operation
    a = 4'd5; opcode = 3'd7; #10;
    if (result !== 8'd0) $display("FAIL: NOT operation failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule