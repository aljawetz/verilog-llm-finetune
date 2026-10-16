`timescale 1ns/1ps

module tb_alu;

reg [3:0] a;
reg [3:0] b;
reg [2:0] mode;
wire [3:0] out;

// Instantiate the ALU module
alu uut (
    .a(a),
    .b(b),
    .mode(mode),
    .out(out)
);

initial begin
    // Test addition
    a = 4'b0011; // 3
    b = 4'b0001; // 1
    mode = 3'b000; // Add
    #10;
    if (out !== 4'b0100) $display("FAIL: Addition failed, expected 4'b0100, got %b", out);

    // Test subtraction
    a = 4'b0100; // 4
    b = 4'b0001; // 1
    mode = 3'b001; // Subtract
    #10;
    if (out !== 4'b0011) $display("FAIL: Subtraction failed, expected 4'b0011, got %b", out);

    // Test bitwise AND
    a = 4'b1100; // 12
    b = 4'b1010; // 10
    mode = 3'b010; // AND
    #10;
    if (out !== 4'b1000) $display("FAIL: AND failed, expected 4'b1000, got %b", out);

    // Test bitwise OR
    a = 4'b1100; // 12
    b = 4'b1010; // 10
    mode = 3'b011; // OR
    #10;
    if (out !== 4'b1110) $display("FAIL: OR failed, expected 4'b1110, got %b", out);

    // Test NOT
    a = 4'b1100; // 12
    mode = 3'b100; // NOT
    #10;
    if (out !== 4'b0011) $display("FAIL: NOT failed, expected 4'b0011, got %b", out);

    // Test NAND
    a = 4'b1100; // 12
    b = 4'b1010; // 10
    mode = 3'b101; // NAND
    #10;
    if (out !== 4'b0111) $display("FAIL: NAND failed, expected 4'b0111, got %b", out);

    // Test NOR
    a = 4'b1100; // 12
    b = 4'b1010; // 10
    mode = 3'b110; // NOR
    #10;
    if (out !== 4'b0000) $display("FAIL: NOR failed, expected 4'b0000, got %b", out);

    // Test XOR
    a = 4'b1100; // 12
    b = 4'b1010; // 10
    mode = 3'b111; // XOR
    #10;
    if (out !== 4'b0110) $display("FAIL: XOR failed, expected 4'b0110, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule