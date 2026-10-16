`timescale 1ns/1ps

module tb_alu_8bit;

    reg [7:0] a, b;
    reg [3:0] f;
    wire [8:0] y;

    alu_8bit uut (
        .a(a),
        .b(b),
        .f(f),
        .y(y)
    );

    initial begin
        // Test AND operation
        a = 8'b10101010; b = 8'b11001100; f = 4'b0000; #10;
        if (y !== 8'b10001000) $display("FAIL: AND operation failed");

        // Test OR operation
        a = 8'b10101010; b = 8'b11001100; f = 4'b0001; #10;
        if (y !== 8'b11101110) $display("FAIL: OR operation failed");

        // Test XOR operation
        a = 8'b10101010; b = 8'b11001100; f = 4'b0010; #10;
        if (y !== 8'b01100110) $display("FAIL: XOR operation failed");

        // Test NAND operation
        a = 8'b10101010; b = 8'b11001100; f = 4'b0011; #10;
        if (y !== 9'b00000111) $display("FAIL: NAND operation failed");

        // Test NOR operation
        a = 8'b10101010; b = 8'b11001100; f = 4'b0100; #10;
        if (y !== 9'b00000001) $display("FAIL: NOR operation failed");

        // Test ADD operation
        a = 8'b00001111; b = 8'b00000001; f = 4'b0101; #10;
        if (y !== 9'b00010000) $display("FAIL: ADD operation failed");

        // Test SUB operation
        a = 8'b00001111; b = 8'b00000001; f = 4'b0110; #10;
        if (y !== 9'b00001110) $display("FAIL: SUB operation failed");

        // Test MUL operation
        a = 8'b00000011; b = 8'b00000010; f = 4'b0111; #10;
        if (y !== 9'b00000010) $display("FAIL: MUL operation failed");

        // Test DIV operation
        a = 8'b00000100; b = 8'b00000010; f = 4'b1000; #10;
        if (y !== 9'b00000010) $display("FAIL: DIV operation failed");

        // Test default case
        a = 8'b00000000; b = 8'b00000000; f = 4'b1111; #10;
        if (y !== 9'b00000000) $display("FAIL: Default case failed");

        $display("PASS");
        $finish;
    end

endmodule