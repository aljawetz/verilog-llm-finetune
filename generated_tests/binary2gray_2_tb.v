`timescale 1ns/1ps

module tb_binary2gray;

reg b1, b2, b3, b4;
wire g1, g2, g3, g4;

// Instantiate the module under test (uut)
binary2gray uut (
    .b1(b1),
    .b2(b2),
    .b3(b3),
    .b4(b4),
    .g1(g1),
    .g2(g2),
    .g3(g3),
    .g4(g4)
);

initial begin
    // Test cases
    // Test case 0: 0000 -> 0000
    b1 = 0; b2 = 0; b3 = 0; b4 = 0; #10;
    if ({g1, g2, g3, g4} !== 4'b0000) $display("FAIL: Test case 0 failed, expected 0000, got %b", {g1, g2, g3, g4});

    // Test case 1: 0001 -> 0001
    b1 = 0; b2 = 0; b3 = 0; b4 = 1; #10;
    if ({g1, g2, g3, g4} !== 4'b0001) $display("FAIL: Test case 1 failed, expected 0001, got %b", {g1, g2, g3, g4});

    // Test case 2: 0010 -> 0001
    b1 = 0; b2 = 0; b3 = 1; b4 = 0; #10;
    if ({g1, g2, g3, g4} !== 4'b0010) $display("FAIL: Test case 2 failed, expected 0010, got %b", {g1, g2, g3, g4});

    // Test case 3: 0011 -> 0010
    b1 = 0; b2 = 0; b3 = 1; b4 = 1; #10;
    if ({g1, g2, g3, g4} !== 4'b0011) $display("FAIL: Test case 3 failed, expected 0011, got %b", {g1, g2, g3, g4});

    // Test case 4: 0100 -> 0011
    b1 = 0; b2 = 1; b3 = 0; b4 = 0; #10;
    if ({g1, g2, g3, g4} !== 4'b0011) $display("FAIL: Test case 4 failed, expected 0011, got %b", {g1, g2, g3, g4});

    // Test case 5: 0101 -> 0010
    b1 = 0; b2 = 1; b3 = 0; b4 = 1; #10;
    if ({g1, g2, g3, g4} !== 4'b0010) $display("FAIL: Test case 5 failed, expected 0010, got %b", {g1, g2, g3, g4});

    // Test case 6: 0110 -> 0001
    b1 = 0; b2 = 1; b3 = 1; b4 = 0; #10;
    if ({g1, g2, g3, g4} !== 4'b0001) $display("FAIL: Test case 6 failed, expected 0001, got %b", {g1, g2, g3, g4});

    // Test case 7: 0111 -> 0000
    b1 = 0; b2 = 1; b3 = 1; b4 = 1; #10;
    if ({g1, g2, g3, g4} !== 4'b0000) $display("FAIL: Test case 7 failed, expected 0000, got %b", {g1, g2, g3, g4});

    // Test case 8: 1000 -> 1000
    b1 = 1; b2 = 0; b3 = 0; b4 = 0; #10;
    if ({g1, g2, g3, g4} !== 4'b1000) $display("FAIL: Test case 8 failed, expected 1000, got %b", {g1, g2, g3, g4});

    // Test case 9: 1001 -> 1001
    b1 = 1; b2 = 0; b3 = 0; b4 = 1; #10;
    if ({g1, g2, g3, g4} !== 4'b1001) $display("FAIL: Test case 9 failed, expected 1001, got %b", {g1, g2, g3, g4});

    // Test case 10: 1010 -> 1011
    b1 = 1; b2 = 0; b3 = 1; b4 = 0; #10;
    if ({g1, g2, g3, g4} !== 4'b1010) $display("FAIL: Test case 10 failed, expected 1010, got %b", {g1, g2, g3, g4});

    // Test case 11: 1011 -> 1010
    b1 = 1; b2 = 0; b3 = 1; b4 = 1; #10;
    if ({g1, g2, g3, g4} !== 4'b1011) $display("FAIL: Test case 11 failed, expected 1011, got %b", {g1, g2, g3, g4});

    // Test case 12: 1100 -> 1110
    b1 = 1; b2 = 1; b3 = 0; b4 = 0; #10;
    if ({g1, g2, g3, g4} !== 4'b1110) $display("FAIL: Test case 12 failed, expected 1110, got %b", {g1, g2, g3, g4});

    // Test case 13: 1101 -> 1111
    b1 = 1; b2 = 1; b3 = 0; b4 = 1; #10;
    if ({g1, g2, g3, g4} !== 4'b1111) $display("FAIL: Test case 13 failed, expected 1111, got %b", {g1, g2, g3, g4});

    // Test case 14: 1110 -> 1101
    b1 = 1; b2 = 1; b3 = 1; b4 = 0; #10;
    if ({g1, g2, g3, g4} !== 4'b1101) $display("FAIL: Test case 14 failed, expected 1101, got %b", {g1, g2, g3, g4});

    // Test case 15: 1111 -> 1100
    b1 = 1; b2 = 1; b3 = 1; b4 = 1; #10;
    if ({g1, g2, g3, g4} !== 4'b1100) $display("FAIL: Test case 15 failed, expected 1100, got %b", {g1, g2, g3, g4});

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule