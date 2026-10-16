`timescale 1ns/1ps

module tb_gray_bin;

reg [3:0] g;
wire [3:0] b;

// Instantiate the module under test
gray_bin uut (
    .g(g),
    .b(b)
);

initial begin
    // Test cases
    // Gray code 0000 -> Binary 0000
    g = 4'b0000; #10;
    if (b !== 4'b0000) $display("FAIL: Expected 0000 for Gray 0000, got %b", b);

    // Gray code 0001 -> Binary 0001
    g = 4'b0001; #10;
    if (b !== 4'b0001) $display("FAIL: Expected 0001 for Gray 0001, got %b", b);

    // Gray code 0011 -> Binary 0010
    g = 4'b0011; #10;
    if (b !== 4'b0010) $display("FAIL: Expected 0010 for Gray 0011, got %b", b);

    // Gray code 0010 -> Binary 0011
    g = 4'b0010; #10;
    if (b !== 4'b0011) $display("FAIL: Expected 0011 for Gray 0010, got %b", b);

    // Gray code 0111 -> Binary 0100
    g = 4'b0111; #10;
    if (b !== 4'b0100) $display("FAIL: Expected 0100 for Gray 0111, got %b", b);

    // Gray code 0100 -> Binary 0101
    g = 4'b0100; #10;
    if (b !== 4'b0101) $display("FAIL: Expected 0101 for Gray 0100, got %b", b);

    // Gray code 1111 -> Binary 1000
    g = 4'b1111; #10;
    if (b !== 4'b1000) $display("FAIL: Expected 1000 for Gray 1111, got %b", b);

    // Gray code 1000 -> Binary 1001
    g = 4'b1000; #10;
    if (b !== 4'b1001) $display("FAIL: Expected 1001 for Gray 1000, got %b", b);

    // Gray code 1100 -> Binary 1101
    g = 4'b1100; #10;
    if (b !== 4'b1101) $display("FAIL: Expected 1101 for Gray 1100, got %b", b);

    // Gray code 1010 -> Binary 1011
    g = 4'b1010; #10;
    if (b !== 4'b1011) $display("FAIL: Expected 1011 for Gray 1010, got %b", b);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule