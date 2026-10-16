`timescale 1ns/1ps

module tb_alu;

reg [15:0] a, b;
reg [2:0] sel;
reg clk;
reg reset;
wire [15:0] q;

// Instantiate the ALU module
alu uut (
    .a(a),
    .b(b),
    .sel(sel),
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize reset
    reset = 1;
    #10;
    reset = 0;

    // Test addition
    a = 16'h0003; b = 16'h0002; sel = 3'b000; // 3 + 2 = 5
    #10;
    if (q !== 16'h0005) $display("FAIL: Addition test failed");

    // Test subtraction
    a = 16'h0005; b = 16'h0002; sel = 3'b001; // 5 - 2 = 3
    #10;
    if (q !== 16'h0003) $display("FAIL: Subtraction test failed");

    // Test multiplication
    a = 16'h0003; b = 16'h0002; sel = 3'b010; // 3 * 2 = 6
    #10;
    if (q !== 16'h0006) $display("FAIL: Multiplication test failed");

    // Test modulo
    a = 16'h0005; b = 16'h0003; sel = 3'b011; // 5 % 3 = 2
    #10;
    if (q !== 16'h0002) $display("FAIL: Modulo test failed");

    // Test bitwise AND
    a = 16'h0F0F; b = 16'h00FF; sel = 3'b100; // 0F0F & 00FF = 00FF
    #10;
    if (q !== 16'h00FF) $display("FAIL: Bitwise AND test failed");

    // Test bitwise OR
    a = 16'h0F0F; b = 16'h00FF; sel = 3'b101; // 0F0F | 00FF = 0FFF
    #10;
    if (q !== 16'h0FFF) $display("FAIL: Bitwise OR test failed");

    // Test bitwise XOR
    a = 16'h0F0F; b = 16'h00FF; sel = 3'b110; // 0F0F ^ 00FF = 0F00
    #10;
    if (q !== 16'h0F00) $display("FAIL: Bitwise XOR test failed");

    // Test logical AND
    a = 16'h0001; b = 16'h0001; sel = 3'b111; // 1 && 1 = 1
    #10;
    if (q !== 16'h0001) $display("FAIL: Logical AND test failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule