`timescale 1ns/1ps

module tb_gray_to_binary;

    reg [3:0] g;
    wire [3:0] b;

    // Instantiate the module under test
    gray_to_binary uut (
        .g(g),
        .b(b)
    );

    initial begin
        // Test cases
        // Gray code: 0000 -> Binary: 0000
        g = 4'b0000; #10;
        if (b !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", b);

        // Gray code: 0001 -> Binary: 0001
        g = 4'b0001; #10;
        if (b !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", b);

        // Gray code: 0011 -> Binary: 0010
        g = 4'b0011; #10;
        if (b !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", b);

        // Gray code: 0111 -> Binary: 0011
        g = 4'b0111; #10;
        if (b !== 4'b0011) $display("FAIL: Test case 4 failed, expected 0011, got %b", b);

        // Gray code: 0100 -> Binary: 0010
        g = 4'b0100; #10;
        if (b !== 4'b0010) $display("FAIL: Test case 5 failed, expected 0010, got %b", b);

        // Gray code: 1111 -> Binary: 1000
        g = 4'b1111; #10;
        if (b !== 4'b1000) $display("FAIL: Test case 6 failed, expected 1000, got %b", b);

        // Gray code: 1000 -> Binary: 1100
        g = 4'b1000; #10;
        if (b !== 4'b1100) $display("FAIL: Test case 7 failed, expected 1100, got %b", b);

        // Gray code: 1010 -> Binary: 1110
        g = 4'b1010; #10;
        if (b !== 4'b1110) $display("FAIL: Test case 8 failed, expected 1110, got %b", b);

        // Gray code: 1100 -> Binary: 1010
        g = 4'b1100; #10;
        if (b !== 4'b1010) $display("FAIL: Test case 9 failed, expected 1010, got %b", b);

        // Gray code: 1110 -> Binary: 1001
        g = 4'b1110; #10;
        if (b !== 4'b1001) $display("FAIL: Test case 10 failed, expected 1001, got %b", b);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule