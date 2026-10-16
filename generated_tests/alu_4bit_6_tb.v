`timescale 1ns/1ps

module tb_alu_4bit;

reg [3:0] a;
reg [3:0] b;
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
    // Test case 1: Addition
    a = 4'b0011; // 3
    b = 4'b0001; // 1
    op = 2'b00;  // ADD
    #10;
    if (f !== 4'b0100) $display("FAIL: Addition failed, expected 4, got %b", f);

    // Test case 2: Subtraction
    a = 4'b0100; // 4
    b = 4'b0001; // 1
    op = 2'b01;  // SUB
    #10;
    if (f !== 4'b0011) $display("FAIL: Subtraction failed, expected 3, got %b", f);

    // Test case 3: Multiplication
    a = 4'b0010; // 2
    b = 4'b0011; // 3
    op = 2'b10;  // MUL
    #10;
    if (f !== 4'b0110) $display("FAIL: Multiplication failed, expected 6, got %b", f);

    // Test case 4: Division
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    op = 2'b11;  // DIV
    #10;
    if (f !== 4'b0001) $display("FAIL: Division failed, expected 1, got %b", f);

    // Test case 5: Division by zero
    a = 4'b0110; // 6
    b = 4'b0000; // 0
    op = 2'b11;  // DIV
    #10;
    if (f !== 4'bxxxx) $display("FAIL: Division by zero did not produce undefined output, got %b", f);

    $display("PASS");
    $finish;
end

endmodule