`timescale 1ns/1ps

module tb_alu;

reg [15:0] a;
reg [15:0] b;
reg [2:0] sel;
reg clk;
reg reset;
wire [15:0] q;

alu uut (
    .a(a),
    .b(b),
    .sel(sel),
    .clk(clk),
    .reset(reset),
    .q(q)
);

initial begin
    // Initialize clock and reset
    clk = 0;
    reset = 1;
    #5 reset = 0; // Release reset after 5 ns

    // Test cases
    // Test addition
    a = 16'h0001; b = 16'h0001; sel = 3'b000; #10;
    if (q !== 16'h0002) $display("FAIL: Addition failed");

    // Test subtraction
    a = 16'h0002; b = 16'h0001; sel = 3'b001; #10;
    if (q !== 16'h0001) $display("FAIL: Subtraction failed");

    // Test multiplication
    a = 16'h0002; b = 16'h0003; sel = 3'b010; #10;
    if (q !== 16'h0006) $display("FAIL: Multiplication failed");

    // Test modulus
    a = 16'h0005; b = 16'h0003; sel = 3'b011; #10;
    if (q !== 16'h0002) $display("FAIL: Modulus failed");

    // Test bitwise AND
    a = 16'hF0F0; b = 16'h0F0F; sel = 3'b100; #10;
    if (q !== 16'h0000) $display("FAIL: Bitwise AND failed");

    // Test bitwise OR
    a = 16'hF0F0; b = 16'h0F0F; sel = 3'b101; #10;
    if (q !== 16'hFFFF) $display("FAIL: Bitwise OR failed");

    // Test bitwise XOR
    a = 16'hF0F0; b = 16'h0F0F; sel = 3'b110; #10;
    if (q !== 16'hFFFF) $display("FAIL: Bitwise XOR failed");

    // Test logical AND
    a = 16'h0001; b = 16'h0001; sel = 3'b111; #10;
    if (q !== 16'h0001) $display("FAIL: Logical AND failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule