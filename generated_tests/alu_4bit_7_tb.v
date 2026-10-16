`timescale 1ns/1ps

module tb_alu_4bit;

reg [3:0] a, b;
reg [1:0] op;
wire [3:0] f;

alu_4bit uut (
    .f(f),
    .a(a),
    .b(b),
    .op(op)
);

initial begin
    // Test addition
    a = 4'b0011; // 3
    b = 4'b0001; // 1
    op = 2'b00;  // ADD
    #10;
    if (f !== 4'b0100) $display("FAIL: ADD test failed, expected 4'b0100, got %b", f);

    // Test subtraction
    a = 4'b0100; // 4
    b = 4'b0001; // 1
    op = 2'b01;  // SUB
    #10;
    if (f !== 4'b0011) $display("FAIL: SUB test failed, expected 4'b0011, got %b", f);

    // Test multiplication
    a = 4'b0010; // 2
    b = 4'b0011; // 3
    op = 2'b10;  // MUL
    #10;
    if (f !== 4'b0110) $display("FAIL: MUL test failed, expected 4'b0110, got %b", f);

    // Test division
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 2'b11;  // DIV
    #10;
    if (f !== 4'b0001) $display("FAIL: DIV test failed, expected 4'b0001, got %b", f);

    // Test division by zero
    a = 4'b0010; // 2
    b = 4'b0000; // 0
    op = 2'b11;  // DIV
    #10;
    if (f !== 4'bxxxx) $display("FAIL: DIV by zero test failed, expected undefined, got %b", f);

    $display("PASS");
    $finish;
end

endmodule