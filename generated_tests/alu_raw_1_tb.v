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
        op_a = 8'd10; op_b = 8'd20; alu_op = 3'b000; // 10 + 20
        #10;
        if (result !== 8'd30) $display("FAIL: Addition test failed");

        // Test Subtraction
        op_a = 8'd30; op_b = 8'd10; alu_op = 3'b001; // 30 - 10
        #10;
        if (result !== 8'd20) $display("FAIL: Subtraction test failed");

        // Test Bitwise AND
        op_a = 8'b11001100; op_b = 8'b10101010; alu_op = 3'b010; // 11001100 & 10101010
        #10;
        if (result !== 8'b10001000) $display("FAIL: AND test failed");

        // Test Bitwise OR
        op_a = 8'b11001100; op_b = 8'b10101010; alu_op = 3'b011; // 11001100 | 10101010
        #10;
        if (result !== 8'b11101110) $display("FAIL: OR test failed");

        // Test Bitwise XOR
        op_a = 8'b11001100; op_b = 8'b10101010; alu_op = 3'b100; // 11001100 ^ 10101010
        #10;
        if (result !== 8'b01100110) $display("FAIL: XOR test failed");

        // Test Bitwise NOT
        op_a = 8'b00001111; alu_op = 3'b101; // ~00001111
        #10;
        if (result !== 8'b11110000) $display("FAIL: NOT test failed");

        // Test Default case
        op_a = 8'd0; op_b = 8'd0; alu_op = 3'b111; // Invalid operation
        #10;
        if (result !== 8'd0) $display("FAIL: Default case test failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule