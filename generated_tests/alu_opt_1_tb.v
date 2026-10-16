`timescale 1ns/1ps

module tb_alu_opt;

    // Inputs
    reg [7:0] op_a;
    reg [7:0] op_b;
    reg [2:0] alu_op;

    // Outputs
    wire [7:0] result;

    // Instantiate the Unit Under Test (UUT)
    alu_opt uut (
        .op_a(op_a),
        .op_b(op_b),
        .alu_op(alu_op),
        .result(result)
    );

    initial begin
        // Test Addition
        op_a = 8'd15; op_b = 8'd10; alu_op = 3'b000; // 15 + 10 = 25
        #10;
        if (result !== 8'd25) begin
            $display("FAIL: Addition test failed");
            $finish;
        end

        // Test Subtraction
        op_a = 8'd20; op_b = 8'd5; alu_op = 3'b001; // 20 - 5 = 15
        #10;
        if (result !== 8'd15) begin
            $display("FAIL: Subtraction test failed");
            $finish;
        end

        // Test AND
        op_a = 8'b11001100; op_b = 8'b10101010; alu_op = 3'b010; // 11001100 & 10101010 = 10001000
        #10;
        if (result !== 8'b10001000) begin
            $display("FAIL: AND test failed");
            $finish;
        end

        // Test OR
        op_a = 8'b11001100; op_b = 8'b10101010; alu_op = 3'b011; // 11001100 | 10101010 = 11101110
        #10;
        if (result !== 8'b11101110) begin
            $display("FAIL: OR test failed");
            $finish;
        end

        // Test XOR
        op_a = 8'b11001100; op_b = 8'b10101010; alu_op = 3'b100; // 11001100 ^ 10101010 = 01100110
        #10;
        if (result !== 8'b01100110) begin
            $display("FAIL: XOR test failed");
            $finish;
        end

        // Test NOT
        op_a = 8'b00001111; alu_op = 3'b101; // ~00001111 = 11110000
        #10;
        if (result !== 8'b11110000) begin
            $display("FAIL: NOT test failed");
            $finish;
        end

        // Test default case
        op_a = 8'b00000000; op_b = 8'b00000000; alu_op = 3'b111; // Invalid operation
        #10;
        if (result !== 8'b00000000) begin
            $display("FAIL: Default case test failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule