`timescale 1ns/1ps

module tb_example;

    // Inputs
    reg [7:0] input_a;
    reg [7:0] input_b;
    reg [3:0] opcode;

    // Outputs
    wire [7:0] result;
    wire zero_flag;

    // Instantiate the Unit Under Test (UUT)
    example uut (
        .input_a(input_a),
        .input_b(input_b),
        .opcode(opcode),
        .result(result),
        .zero_flag(zero_flag)
    );

    initial begin
        // Test ADD operation
        input_a = 8'd10; input_b = 8'd5; opcode = 4'b0000; // ADD
        #10;
        if (result !== 8'd15 || zero_flag !== 1'b0) $display("FAIL: ADD operation failed");

        // Test SUB operation
        input_a = 8'd10; input_b = 8'd5; opcode = 4'b0001; // SUB
        #10;
        if (result !== 8'd5 || zero_flag !== 1'b0) $display("FAIL: SUB operation failed");

        // Test AND operation
        input_a = 8'd12; input_b = 8'd5; opcode = 4'b0010; // AND
        #10;
        if (result !== 8'd4 || zero_flag !== 1'b0) $display("FAIL: AND operation failed");

        // Test OR operation
        input_a = 8'd12; input_b = 8'd5; opcode = 4'b0011; // OR
        #10;
        if (result !== 8'd13 || zero_flag !== 1'b0) $display("FAIL: OR operation failed");

        // Test XOR operation
        input_a = 8'd12; input_b = 8'd5; opcode = 4'b0100; // XOR
        #10;
        if (result !== 8'd9 || zero_flag !== 1'b0) $display("FAIL: XOR operation failed");

        // Test NOT operation
        input_a = 8'd12; opcode = 4'b0101; // NOT
        #10;
        if (result !== 8'd243 || zero_flag !== 1'b0) $display("FAIL: NOT operation failed");

        // Test BCD_CORRECTION operation
        input_a = 8'd9; input_b = 8'd1; opcode = 4'b0110; // BCD_CORRECTION
        #10;
        if (result !== 8'd15 || zero_flag !== 1'b0) $display("FAIL: BCD_CORRECTION operation failed");

        // Test BCD_CORRECTION with no correction needed
        input_a = 8'd5; input_b = 8'd3; opcode = 4'b0110; // BCD_CORRECTION
        #10;
        if (result !== 8'd8 || zero_flag !== 1'b0) $display("FAIL: BCD_CORRECTION operation failed");

        // Test zero flag
        input_a = 8'd0; input_b = 8'd0; opcode = 4'b0000; // ADD
        #10;
        if (result !== 8'd0 || zero_flag !== 1'b1) $display("FAIL: Zero flag failed");

        $display("PASS");
        $finish;
    end

endmodule