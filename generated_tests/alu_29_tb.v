`timescale 1ns/1ps

module tb_alu;

reg [7:0] a;
reg [7:0] b;
reg [3:0] opcode;
reg enable;
wire [15:0] out;

alu uut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .enable(enable),
    .out(out)
);

initial begin
    // Test case 1: Addition
    a = 8'd15; b = 8'd10; opcode = 4'b0000; enable = 1;
    #10;
    if (out !== 16'd25) $display("FAIL: Addition failed");

    // Test case 2: Subtraction
    a = 8'd20; b = 8'd5; opcode = 4'b0010; enable = 1;
    #10;
    if (out !== 16'd15) $display("FAIL: Subtraction failed");

    // Test case 3: Increment
    a = 8'd7; opcode = 4'b0001; enable = 1;
    #10;
    if (out !== 16'd8) $display("FAIL: Increment failed");

    // Test case 4: Decrement
    a = 8'd10; opcode = 4'b0011; enable = 1;
    #10;
    if (out !== 16'd9) $display("FAIL: Decrement failed");

    // Test case 5: Multiplication
    a = 8'd3; b = 8'd4; opcode = 4'b0100; enable = 1;
    #10;
    if (out !== 16'd12) $display("FAIL: Multiplication failed");

    // Test case 6: Division
    a = 8'd20; b = 8'd4; opcode = 4'b0101; enable = 1;
    #10;
    if (out !== 16'd5) $display("FAIL: Division failed");

    // Test case 7: AND
    a = 8'b11001100; b = 8'b10101010; opcode = 4'b1000; enable = 1;
    #10;
    if (out !== 16'b10001000) $display("FAIL: AND failed");

    // Test case 8: OR
    a = 8'b11001100; b = 8'b10101010; opcode = 4'b1001; enable = 1;
    #10;
    if (out !== 16'b11101110) $display("FAIL: OR failed");

    // Test case 9: NOT
    a = 8'b00001111; opcode = 4'b1010; enable = 1;
    #10;
    if (out !== 16'b11110000) $display("FAIL: NOT failed");

    // Test case 10: Shift Left
    a = 8'b00001111; opcode = 4'b0110; enable = 1;
    #10;
    if (out !== 16'b00011110) $display("FAIL: Shift Left failed");

    // Test case 11: Shift Right
    a = 8'b00001111; opcode = 4'b0111; enable = 1;
    #10;
    if (out !== 16'b00000111) $display("FAIL: Shift Right failed");

    // Test case 12: Buffer
    a = 8'd42; opcode = 4'b1111; enable = 1;
    #10;
    if (out !== 16'd42) $display("FAIL: Buffer failed");

    // Test case 13: High Impedance
    enable = 0;
    #10;
    if (out !== 16'hzzzz) $display("FAIL: High Impedance failed");

    $display("PASS");
    $finish;
end

endmodule