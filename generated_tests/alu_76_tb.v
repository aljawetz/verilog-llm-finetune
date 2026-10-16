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
        a = 4'd5; b = 4'd3; opcode = 3'b000; #10;
        if (result !== 8'd8) $display("FAIL: Addition failed");

        // Test subtraction
        a = 4'd5; b = 4'd3; opcode = 3'b001; #10;
        if (result !== 8'd2) $display("FAIL: Subtraction failed");

        // Test multiplication
        a = 4'd3; b = 4'd4; opcode = 3'b010; #10;
        if (result !== 8'd12) $display("FAIL: Multiplication failed");

        // Test bitwise AND
        a = 4'b1100; b = 4'b1010; opcode = 3'b011; #10;
        if (result !== 8'b1000) $display("FAIL: AND operation failed");

        // Test bitwise OR
        a = 4'b1100; b = 4'b1010; opcode = 3'b100; #10;
        if (result !== 8'b1110) $display("FAIL: OR operation failed");

        // Test bitwise XOR
        a = 4'b1100; b = 4'b1010; opcode = 3'b101; #10;
        if (result !== 8'b0110) $display("FAIL: XOR operation failed");

        // Test bitwise XNOR
        a = 4'b1100; b = 4'b1010; opcode = 3'b110; #10;
        if (result !== 8'b1001) $display("FAIL: XNOR operation failed");

        // Test NOT operation
        a = 4'b1100; opcode = 3'b111; #10;
        if (result !== 8'b0000_0011) $display("FAIL: NOT operation failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule