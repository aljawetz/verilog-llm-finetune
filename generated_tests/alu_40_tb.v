`timescale 1ns/1ps

module tb_alu;

reg [3:0] opA;
reg [3:0] opB;
reg [2:0] opcode;
wire [7:0] result;

// Instantiate the ALU module
alu uut (
    .opA(opA),
    .opB(opB),
    .opcode(opcode),
    .result(result)
);

initial begin
    // Test addition
    opA = 4'd5; opB = 4'd3; opcode = 3'b000; #10;
    if (result !== 8'd8) $display("FAIL: Addition failed");

    // Test subtraction
    opA = 4'd5; opB = 4'd3; opcode = 3'b001; #10;
    if (result !== 8'd2) $display("FAIL: Subtraction failed");

    // Test multiplication
    opA = 4'd3; opB = 4'd4; opcode = 3'b010; #10;
    if (result !== 8'd12) $display("FAIL: Multiplication failed");

    // Test AND
    opA = 4'b1100; opB = 4'b1010; opcode = 3'b011; #10;
    if (result !== 8'b1000) $display("FAIL: AND operation failed");

    // Test OR
    opA = 4'b1100; opB = 4'b1010; opcode = 3'b100; #10;
    if (result !== 8'b1110) $display("FAIL: OR operation failed");

    // Test NOT
    opA = 4'b1100; opcode = 3'b101; #10;
    if (result !== 8'b0011) $display("FAIL: NOT operation failed");

    // Test XOR
    opA = 4'b1100; opB = 4'b1010; opcode = 3'b110; #10;
    if (result !== 8'b0110) $display("FAIL: XOR operation failed");

    // Test XNOR
    opA = 4'b1100; opB = 4'b1010; opcode = 3'b111; #10;
    if (result !== 8'b1001) $display("FAIL: XNOR operation failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule