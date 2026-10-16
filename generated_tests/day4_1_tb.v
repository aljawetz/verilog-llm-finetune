`timescale 1ns/1ps

module tb_day4;

  reg [7:0] a;
  reg [7:0] b;
  reg [2:0] op;
  wire [7:0] alu;

  // Instantiate the ALU module
  day4 uut (
    .a(a),
    .b(b),
    .op(op),
    .alu(alu)
  );

  initial begin
    // Test addition
    a = 8'd15; b = 8'd10; op = 3'b000; #10;
    if (alu !== 8'd25) $display("FAIL: Addition failed");

    // Test subtraction
    a = 8'd20; b = 8'd5; op = 3'b001; #10;
    if (alu !== 8'd15) $display("FAIL: Subtraction failed");

    // Test logical shift left
    a = 8'b00001111; b = 8'd2; op = 3'b010; #10;
    if (alu !== 8'b00111100) $display("FAIL: Shift left failed");

    // Test logical shift right
    a = 8'b11110000; b = 8'd2; op = 3'b011; #10;
    if (alu !== 8'b00111100) $display("FAIL: Shift right failed");

    // Test bitwise AND
    a = 8'b10101010; b = 8'b11001100; op = 3'b100; #10;
    if (alu !== 8'b10001000) $display("FAIL: AND operation failed");

    // Test bitwise OR
    a = 8'b10101010; b = 8'b11001100; op = 3'b101; #10;
    if (alu !== 8'b11101110) $display("FAIL: OR operation failed");

    // Test bitwise XOR
    a = 8'b10101010; b = 8'b11001100; op = 3'b110; #10;
    if (alu !== 8'b01100110) $display("FAIL: XOR operation failed");

    // Test equality check
    a = 8'd100; b = 8'd100; op = 3'b111; #10;
    if (alu !== 8'd1) $display("FAIL: Equality check failed");

    a = 8'd100; b = 8'd101; op = 3'b111; #10;
    if (alu !== 8'd0) $display("FAIL: Equality check failed");

    $display("PASS");
    $finish;
  end

endmodule