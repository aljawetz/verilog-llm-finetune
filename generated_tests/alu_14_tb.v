`timescale 1ns/1ps

module tb_alu;
    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] opcode;
    wire [3:0] y;
    wire v;

    // Instantiate the ALU module
    alu uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .v(v),
        .y(y)
    );

    initial begin
        // Test cases
        // Test AND operation
        a = 4'b1010; b = 4'b1100; opcode = 4'b0000; #10;
        if (y !== 4'b1000) $display("FAIL: AND operation failed");

        // Test OR operation
        a = 4'b1010; b = 4'b1100; opcode = 4'b0001; #10;
        if (y !== 4'b1110) $display("FAIL: OR operation failed");

        // Test NOT operation
        a = 4'b1010; opcode = 4'b0010; #10;
        if (y !== 4'b0101) $display("FAIL: NOT operation failed");

        // Test NAND operation
        a = 4'b1010; b = 4'b1100; opcode = 4'b0011; #10;
        if (y !== 4'b0111) $display("FAIL: NAND operation failed");

        // Test NOR operation
        a = 4'b1010; b = 4'b1100; opcode = 4'b0100; #10;
        if (y !== 4'b0001) $display("FAIL: NOR operation failed");

        // Test XOR operation
        a = 4'b1010; b = 4'b1100; opcode = 4'b0101; #10;
        if (y !== 4'b0110) $display("FAIL: XOR operation failed");

        // Test XNOR operation
        a = 4'b1010; b = 4'b1100; opcode = 4'b0110; #10;
        if (y !== 4'b1001) $display("FAIL: XNOR operation failed");

        // Test addition with overflow
        a = 4'b1111; b = 4'b0001; opcode = 4'b1000; #10;
        if (y !== 4'b0000 || v !== 1'b1) $display("FAIL: Addition with overflow failed");

        // Test subtraction without overflow
        a = 4'b1000; b = 4'b0010; opcode = 4'b1001; #10;
        if (y !== 4'b0110 || v !== 1'b0) $display("FAIL: Subtraction failed");

        // Test modulo operation
        a = 4'b0100; b = 4'b0011; opcode = 4'b1010; #10;
        if (y !== 4'b0001) $display("FAIL: Modulo operation failed");

        // Test left shift operation
        a = 4'b0011; opcode = 4'b1011; #10;
        if (y !== 4'b0110) $display("FAIL: Left shift operation failed");

        // Test right shift operation
        b = 4'b1100; opcode = 4'b1100; #10;
        if (y !== 4'b0110) $display("FAIL: Right shift operation failed");

        // Test logical AND
        a = 4'b0001; b = 4'b0001; opcode = 4'b1101; #10;
        if (y !== 4'b0001) $display("FAIL: Logical AND operation failed");

        // Test logical OR
        a = 4'b0000; b = 4'b0001; opcode = 4'b1110; #10;
        if (y !== 4'b0001) $display("FAIL: Logical OR operation failed");

        // Test AND reduction
        a = 4'b1111; opcode = 4'b1111; #10;
        if (y !== 4'b0001) $display("FAIL: AND reduction operation failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule