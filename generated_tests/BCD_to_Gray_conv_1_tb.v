`timescale 1ns/1ps

module tb_BCD_to_Gray_conv;

reg [3:0] BC;
wire [3:0] G;

// Instantiate the module under test (uut)
BCD_to_Gray_conv uut (
    .BC(BC),
    .G(G)
);

initial begin
    // Test case 1: BCD 0000 -> Gray 0000
    BC = 4'b0000; #10;
    if (G !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", G);

    // Test case 2: BCD 0001 -> Gray 0001
    BC = 4'b0001; #10;
    if (G !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", G);

    // Test case 3: BCD 0010 -> Gray 0011
    BC = 4'b0010; #10;
    if (G !== 4'b0011) $display("FAIL: Test case 3 failed, expected 0011, got %b", G);

    // Test case 4: BCD 0011 -> Gray 0010
    BC = 4'b0011; #10;
    if (G !== 4'b0010) $display("FAIL: Test case 4 failed, expected 0010, got %b", G);

    // Test case 5: BCD 0100 -> Gray 0110
    BC = 4'b0100; #10;
    if (G !== 4'b0110) $display("FAIL: Test case 5 failed, expected 0110, got %b", G);

    // Test case 6: BCD 0101 -> Gray 0111
    BC = 4'b0101; #10;
    if (G !== 4'b0111) $display("FAIL: Test case 6 failed, expected 0111, got %b", G);

    // Test case 7: BCD 0110 -> Gray 0101
    BC = 4'b0110; #10;
    if (G !== 4'b0101) $display("FAIL: Test case 7 failed, expected 0101, got %b", G);

    // Test case 8: BCD 0111 -> Gray 0100
    BC = 4'b0111; #10;
    if (G !== 4'b0100) $display("FAIL: Test case 8 failed, expected 0100, got %b", G);

    // Test case 9: BCD 1000 -> Gray 1100
    BC = 4'b1000; #10;
    if (G !== 4'b1100) $display("FAIL: Test case 9 failed, expected 1100, got %b", G);

    // Test case 10: BCD 1001 -> Gray 1101
    BC = 4'b1001; #10;
    if (G !== 4'b1101) $display("FAIL: Test case 10 failed, expected 1101, got %b", G);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule