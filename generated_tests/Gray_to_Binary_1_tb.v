`timescale 1ns/1ps

module tb_Gray_to_Binary;

    reg [3:0] g;          // Gray code input
    wire [3:0] b;        // Binary output

    // Instantiate the module under test (uut)
    Gray_to_Binary uut (
        .g(g),
        .b(b)
    );

    initial begin
        // Test cases
        // Test case 1: Gray code 0000 -> Binary 0000
        g = 4'b0000; #10;
        if (b !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", b);

        // Test case 2: Gray code 0001 -> Binary 0001
        g = 4'b0001; #10;
        if (b !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", b);

        // Test case 3: Gray code 0011 -> Binary 0010
        g = 4'b0011; #10;
        if (b !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", b);

        // Test case 4: Gray code 0010 -> Binary 0011
        g = 4'b0010; #10;
        if (b !== 4'b0011) $display("FAIL: Test case 4 failed, expected 0011, got %b", b);

        // Test case 5: Gray code 0111 -> Binary 0110
        g = 4'b0111; #10;
        if (b !== 4'b0110) $display("FAIL: Test case 5 failed, expected 0110, got %b", b);

        // Test case 6: Gray code 0100 -> Binary 0101
        g = 4'b0100; #10;
        if (b !== 4'b0101) $display("FAIL: Test case 6 failed, expected 0101, got %b", b);

        // Test case 7: Gray code 1111 -> Binary 1000
        g = 4'b1111; #10;
        if (b !== 4'b1000) $display("FAIL: Test case 7 failed, expected 1000, got %b", b);

        // Test case 8: Gray code 1000 -> Binary 1001
        g = 4'b1000; #10;
        if (b !== 4'b1001) $display("FAIL: Test case 8 failed, expected 1001, got %b", b);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule