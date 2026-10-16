`timescale 1ns/1ps

module tb_arith;

reg [15:0] a;
reg [15:0] b;
reg [2:0] opcode;
wire [31:0] outau;

arith uut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .outau(outau)
);

initial begin
    // Test addition
    a = 16'h0001; b = 16'h0002; opcode = 3'b000; #10;
    if (outau !== 32'h00000003) $display("FAIL: Addition test failed");

    // Test multiplication
    a = 16'h0003; b = 16'h0004; opcode = 3'b001; #10;
    if (outau !== 32'h0000000C) $display("FAIL: Multiplication test failed");

    // Test absolute subtraction (a > b)
    a = 16'h0005; b = 16'h0003; opcode = 3'b010; #10;
    if (outau !== 32'h00000002) $display("FAIL: Absolute subtraction test (a > b) failed");

    // Test absolute subtraction (b > a)
    a = 16'h0002; b = 16'h0005; opcode = 3'b010; #10;
    if (outau !== 32'h00000003) $display("FAIL: Absolute subtraction test (b > a) failed");

    // Test division (a > b)
    a = 16'h0006; b = 16'h0002; opcode = 3'b011; #10;
    if (outau !== 32'h00000003) $display("FAIL: Division test (a > b) failed");

    // Test division (b > a)
    a = 16'h0002; b = 16'h0006; opcode = 3'b011; #10;
    if (outau !== 32'h00000003) $display("FAIL: Division test (b > a) failed");

    // Test default case
    a = 16'h0000; b = 16'h0000; opcode = 3'b111; #10;
    if (outau !== 32'h00000000) $display("FAIL: Default case test failed");

    $display("PASS");
    $finish;
end

endmodule