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
    a = 8'd15; b = 8'd10; opcode = 3'b000; // 15 + 10
    #10;
    if (result !== 16'd25) $display("FAIL: Addition test failed");

    // Test multiplication
    a = 8'd5; b = 8'd3; opcode = 3'b001; // 5 * 3
    #10;
    if (result !== 16'd15) $display("FAIL: Multiplication test failed");

    // Test subtraction
    a = 8'd20; b = 8'd5; opcode = 3'b010; // 20 - 5
    #10;
    if (result !== 16'd15) $display("FAIL: Subtraction test failed");

    // Test bitwise AND
    a = 8'b11001100; b = 8'b10101010; opcode = 3'b011; // 11001100 & 10101010
    #10;
    if (result !== 16'b10001000) $display("FAIL: Bitwise AND test failed");

    // Test bitwise OR
    a = 8'b11001100; b = 8'b10101010; opcode = 3'b100; // 11001100 | 10101010
    #10;
    if (result !== 16'b11101110) $display("FAIL: Bitwise OR test failed");

    // Test bitwise XOR
    a = 8'b11001100; b = 8'b10101010; opcode = 3'b101; // 11001100 ^ 10101010
    #10;
    if (result !== 16'b01100110) $display("FAIL: Bitwise XOR test failed");

    // Test division
    a = 8'd20; b = 8'd4; opcode = 3'b110; // 20 / 4
    #10;
    if (result !== 16'd5) $display("FAIL: Division test failed");

    // If all tests passed
    $display("PASS");
    $finish;
end

endmodule