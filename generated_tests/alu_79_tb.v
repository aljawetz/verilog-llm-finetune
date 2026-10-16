`timescale 1ns/1ps

module tb_alu;

reg [7:0] a, b;
reg [2:0] sel;
wire [8:0] c;

alu uut (
    .a(a),
    .b(b),
    .sel(sel),
    .c(c)
);

initial begin
    // Test Addition
    a = 8'b00001111; // 15
    b = 8'b00000001; // 1
    sel = 3'd0; // Addition
    #10;
    if (c !== 9'b000000100) $display("FAIL: Addition test failed");

    // Test Subtraction
    a = 8'b00001111; // 15
    b = 8'b00000010; // 2
    sel = 3'd1; // Subtraction
    #10;
    if (c !== 9'b000000111) $display("FAIL: Subtraction test failed");

    // Test Multiplication
    a = 8'b00000011; // 3
    b = 8'b00000010; // 2
    sel = 3'd2; // Multiplication
    #10;
    if (c !== 9'b000000110) $display("FAIL: Multiplication test failed");

    // Test Division
    a = 8'b00000100; // 4
    b = 8'b00000010; // 2
    sel = 3'd3; // Division
    #10;
    if (c !== 9'b00000010) $display("FAIL: Division test failed");

    // Test Left Shift
    a = 8'b00000001; // 1
    b = 8'b00000000; // Not used
    sel = 3'd4; // Left Shift
    #10;
    if (c !== 9'b00000010) $display("FAIL: Left Shift test failed");

    // Test Right Shift
    a = 8'b00000010; // 2
    b = 8'b00000000; // Not used
    sel = 3'd5; // Right Shift
    #10;
    if (c !== 9'b00000001) $display("FAIL: Right Shift test failed");

    // Test with negative numbers
    a = 8'b11111111; // -1
    b = 8'b00000001; // 1
    sel = 3'd0; // Addition
    #10;
    if (c !== 9'b00000000) $display("FAIL: Negative Addition test failed");

    // Test with larger negative result
    a = 8'b11111110; // -2
    b = 8'b00000001; // 1
    sel = 3'd1; // Subtraction
    #10;
    if (c !== 9'b00000001) $display("FAIL: Negative Subtraction test failed");

    $display("PASS");
    $finish;
end

endmodule