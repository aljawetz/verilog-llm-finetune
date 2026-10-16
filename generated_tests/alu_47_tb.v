`timescale 1ns/1ps

module tb_alu;

    reg [7:0] operand_a;
    reg [7:0] operand_b;
    reg [3:0] operation;
    wire [7:0] result;
    wire carry_out;

    alu uut (
        .result(result),
        .carry_out(carry_out),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .operation(operation)
    );

    initial begin
        // Test Addition
        operand_a = 8'd15; operand_b = 8'd10; operation = 4'b0000; #10;
        if (result !== 8'd25 || carry_out !== 1'b0) $display("FAIL: Addition test failed");

        // Test Subtraction
        operand_a = 8'd20; operand_b = 8'd5; operation = 4'b0001; #10;
        if (result !== 8'd15 || carry_out !== 1'b0) $display("FAIL: Subtraction test failed");

        // Test Multiplication
        operand_a = 8'd3; operand_b = 8'd4; operation = 4'b0010; #10;
        if (result !== 8'd12 || carry_out !== 1'b0) $display("FAIL: Multiplication test failed");

        // Test Division
        operand_a = 8'd20; operand_b = 8'd4; operation = 4'b0011; #10;
        if (result !== 8'd5 || carry_out !== 1'b0) $display("FAIL: Division test failed");

        // Test Logical Shift Left
        operand_a = 8'b00001111; operation = 4'b0100; #10;
        if (result !== 8'b00011110) $display("FAIL: Logical Shift Left test failed");

        // Test Logical Shift Right
        operand_a = 8'b00001111; operation = 4'b0101; #10;
        if (result !== 8'b00000111) $display("FAIL: Logical Shift Right test failed");

        // Test Rotate Left
        operand_a = 8'b00001111; operation = 4'b0110; #10;
        if (result !== 8'b00011110) $display("FAIL: Rotate Left test failed");

        // Test Rotate Right
        operand_a = 8'b00001111; operation = 4'b0111; #10;
        if (result !== 8'b10000111) $display("FAIL: Rotate Right test failed");

        // Test Logical AND
        operand_a = 8'b10101010; operand_b = 8'b11001100; operation = 4'b1000; #10;
        if (result !== 8'b10001000) $display("FAIL: Logical AND test failed");

        // Test Logical OR
        operand_a = 8'b10101010; operand_b = 8'b11001100; operation = 4'b1001; #10;
        if (result !== 8'b11101110) $display("FAIL: Logical OR test failed");

        // Test Logical XOR
        operand_a = 8'b10101010; operand_b = 8'b11001100; operation = 4'b1010; #10;
        if (result !== 8'b01100110) $display("FAIL: Logical XOR test failed");

        // Test Logical NOR
        operand_a = 8'b10101010; operand_b = 8'b11001100; operation = 4'b1011; #10;
        if (result !== 8'b00000001) $display("FAIL: Logical NOR test failed");

        // Test Logical NAND
        operand_a = 8'b10101010; operand_b = 8'b11001100; operation = 4'b1100; #10;
        if (result !== 8'b00000000) $display("FAIL: Logical NAND test failed");

        // Test Logical XNOR
        operand_a = 8'b10101010; operand_b = 8'b11001100; operation = 4'b1101; #10;
        if (result !== 8'b00111111) $display("FAIL: Logical XNOR test failed");

        // Test Greater Comparison
        operand_a = 8'd10; operand_b = 8'd5; operation = 4'b1110; #10;
        if (result !== 8'd1) $display("FAIL: Greater Comparison test failed");

        // Test Equal Comparison
        operand_a = 8'd10; operand_b = 8'd10; operation = 4'b1111; #10;
        if (result !== 8'd1) $display("FAIL: Equal Comparison test failed");

        $display("PASS");
        $finish;
    end

endmodule