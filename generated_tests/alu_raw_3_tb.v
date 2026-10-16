`timescale 1ns/1ps

module tb_alu_raw;

    // Inputs
    reg [7:0] op_a;
    reg [7:0] op_b;
    reg [2:0] alu_op;

    // Outputs
    wire [7:0] result;

    // Instantiate the Unit Under Test (UUT)
    alu_raw uut (
        .op_a(op_a),
        .op_b(op_b),
        .alu_op(alu_op),
        .result(result)
    );

    initial begin
        // Test Addition
        op_a = 8'd15; op_b = 8'd10; alu_op = 3'b000; // 15 + 10 = 25
        #10;
        if (result !== 8'd25) $display("FAIL: Addition test failed");

        // Test Subtraction
        op_a = 8'd20; op_b = 8'd5; alu_op = 3'b001; // 20 - 5 = 15
        #10;
        if (result !== 8'd15) $display("FAIL: Subtraction test failed");

        // Test Bitwise AND
        op_a = 8'b11001100; op_b = 8'b10101010; alu_op = 3'b010; // 11001100 & 10101010 = 10001000
        #10;
        if (result !== 8'b10001000) $display("FAIL: AND test failed");

        // Test Bitwise OR
        op_a = 8'b11001100; op_b = 8'b10101010; alu_op = 3'b011; // 11001100 | 10101010 = 11101110
        #10;
        if (result !== 8'b11101110) $display("FAIL: OR test failed");

        // Test Bitwise XOR
        op_a = 8'b11001100; op_b = 8'b10101010; alu_op = 3'b100; // 11001100 ^ 10101010 = 01100110
        #10;
        if (result !== 8'b01100110) $display("FAIL: XOR test failed");

        // Test Bitwise NOT
        op_a = 8'b00001111; alu_op = 3'b101; // ~00001111 = 11110000
        #10;
        if (result !== 8'b11110000) $display("FAIL: NOT test failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule