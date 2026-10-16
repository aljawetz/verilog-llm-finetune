`timescale 1ns/1ps

module tb_alu4bit;

    reg [3:0] in_a, in_b;
    reg [3:0] opcode;
    wire [4:0] alu_out;
    wire a_in_zero;

    alu4bit uut (
        .in_a(in_a),
        .in_b(in_b),
        .opcode(opcode),
        .alu_out(alu_out),
        .a_in_zero(a_in_zero)
    );

    initial begin
        // Test ADD
        in_a = 4'b0011; // 3
        in_b = 4'b0001; // 1
        opcode = 4'b0011; // ADD
        #10;
        if (alu_out !== 5'b00010) $display("FAIL: ADD operation failed");

        // Test SUB
        in_a = 4'b0100; // 4
        in_b = 4'b0001; // 1
        opcode = 4'b0100; // SUB
        #10;
        if (alu_out !== 5'b00011) $display("FAIL: SUB operation failed");

        // Test AND
        in_a = 4'b1100; // 12
        in_b = 4'b1010; // 10
        opcode = 4'b0101; // AND
        #10;
        if (alu_out !== 5'b10000) $display("FAIL: AND operation failed");

        // Test NAND
        in_a = 4'b1100; // 12
        in_b = 4'b1010; // 10
        opcode = 4'b0110; // NAND
        #10;
        if (alu_out !== 5'b01111) $display("FAIL: NAND operation failed");

        // Test OR
        in_a = 4'b1100; // 12
        in_b = 4'b1010; // 10
        opcode = 4'b0111; // OR
        #10;
        if (alu_out !== 5'b11110) $display("FAIL: OR operation failed");

        // Test NOR
        in_a = 4'b1100; // 12
        in_b = 4'b1010; // 10
        opcode = 4'b1000; // NOR
        #10;
        if (alu_out !== 5'b00000) $display("FAIL: NOR operation failed");

        // Test XOR
        in_a = 4'b1100; // 12
        in_b = 4'b1010; // 10
        opcode = 4'b1001; // XOR
        #10;
        if (alu_out !== 5'b01110) $display("FAIL: XOR operation failed");

        // Test XNOR
        in_a = 4'b1100; // 12
        in_b = 4'b1010; // 10
        opcode = 4'b1010; // XNOR
        #10;
        if (alu_out !== 5'b00001) $display("FAIL: XNOR operation failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule