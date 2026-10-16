`timescale 1ns/1ps

module tb_alu;

reg [7:0] a;
reg [7:0] b;
reg [2:0] opcode;
wire [15:0] result;

alu uut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .result(result)
);

initial begin
    // Test addition
    a = 8'd15; b = 8'd10; opcode = 3'b000; #10;
    if (result !== 16'd25) $display("FAIL: Addition failed");

    // Test multiplication
    a = 8'd5; b = 8'd3; opcode = 3'b001; #10;
    if (result !== 16'd15) $display("FAIL: Multiplication failed");

    // Test subtraction
    a = 8'd20; b = 8'd5; opcode = 3'b010; #10;
    if (result !== 16'd15) $display("FAIL: Subtraction failed");

    // Test bitwise AND
    a = 8'b11001100; b = 8'b10101010; opcode = 3'b011; #10;
    if (result !== 16'b10001000) $display("FAIL: Bitwise AND failed");

    // Test bitwise OR
    a = 8'b11001100; b = 8'b10101010; opcode = 3'b100; #10;
    if (result !== 16'b11101110) $display("FAIL: Bitwise OR failed");

    // Test bitwise XOR
    a = 8'b11001100; b = 8'b10101010; opcode = 3'b101; #10;
    if (result !== 16'b01100110) $display("FAIL: Bitwise XOR failed");

    // Test division
    a = 8'd20; b = 8'd5; opcode = 3'b110; #10;
    if (result !== 16'd4) $display("FAIL: Division failed");

    $display("PASS");
    $finish;
end

endmodule