`timescale 1ns/1ps

module tb_alu_4bit;
    reg [3:0] a, b;
    reg [1:0] op;
    wire [3:0] f;

    // Instantiate the ALU module
    alu_4bit uut (
        .f(f),
        .a(a),
        .b(b),
        .op(op)
    );

    initial begin
        // Test Addition
        a = 4'b0011; // 3
        b = 4'b0001; // 1
        op = 2'b00;  // ADD
        #10;
        if (f !== 4'b0100) $display("FAIL: Addition test failed, expected 4, got %b", f);

        // Test Subtraction
        a = 4'b0100; // 4
        b = 4'b0001; // 1
        op = 2'b01;  // SUB
        #10;
        if (f !== 4'b0011) $display("FAIL: Subtraction test failed, expected 3, got %b", f);

        // Test Multiplication
        a = 4'b0010; // 2
        b = 4'b0011; // 3
        op = 2'b10;  // MUL
        #10;
        if (f !== 4'b0110) $display("FAIL: Multiplication test failed, expected 6, got %b", f);

        // Test Division
        a = 4'b0110; // 6
        b = 4'b0011; // 3
        op = 2'b11;  // DIV
        #10;
        if (f !== 4'b0001) $display("FAIL: Division test failed, expected 2, got %b", f);

        // Test Division by Zero
        a = 4'b0000; // 0
        b = 4'b0000; // 0
        op = 2'b11;  // DIV
        #10;
        if (f !== 4'bxxxx) $display("FAIL: Division by zero test failed, expected undefined, got %b", f);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule