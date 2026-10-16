`timescale 1ns/1ps

module tb_reduced_multiplier_4;

    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] product;

    // Instantiate the module under test
    reduced_multiplier_4 uut (
        .product(product),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: 0 * 0 = 0
        A = 4'b0000; B = 4'b0000; #10;
        if (product !== 8'b00000000) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 * 1 = 1
        A = 4'b0001; B = 4'b0001; #10;
        if (product !== 8'b00000001) $display("FAIL: Test case 2 failed");

        // Test case 3: 2 * 2 = 4
        A = 4'b0010; B = 4'b0010; #10;
        if (product !== 8'b00000100) $display("FAIL: Test case 3 failed");

        // Test case 4: 3 * 3 = 9
        A = 4'b0011; B = 4'b0011; #10;
        if (product !== 8'b00001001) $display("FAIL: Test case 4 failed");

        // Test case 5: 4 * 4 = 16
        A = 4'b0100; B = 4'b0100; #10;
        if (product !== 8'b00010000) $display("FAIL: Test case 5 failed");

        // Test case 6: 5 * 5 = 25
        A = 4'b0101; B = 4'b0101; #10;
        if (product !== 8'b00011001) $display("FAIL: Test case 6 failed");

        // Test case 7: 6 * 6 = 36
        A = 4'b0110; B = 4'b0110; #10;
        if (product !== 8'b00100100) $display("FAIL: Test case 7 failed");

        // Test case 8: 7 * 7 = 49
        A = 4'b0111; B = 4'b0111; #10;
        if (product !== 8'b00110001) $display("FAIL: Test case 8 failed");

        // Test case 9: 8 * 8 = 64
        A = 4'b1000; B = 4'b1000; #10;
        if (product !== 8'b01000000) $display("FAIL: Test case 9 failed");

        // Test case 10: 9 * 9 = 81
        A = 4'b1001; B = 4'b1001; #10;
        if (product !== 8'b01010001) $display("FAIL: Test case 10 failed");

        // Test case 11: 10 * 10 = 100
        A = 4'b1010; B = 4'b1010; #10;
        if (product !== 8'b01100100) $display("FAIL: Test case 11 failed");

        // Test case 12: 11 * 11 = 121
        A = 4'b1011; B = 4'b1011; #10;
        if (product !== 8'b01111001) $display("FAIL: Test case 12 failed");

        // Test case 13: 12 * 12 = 144
        A = 4'b1100; B = 4'b1100; #10;
        if (product !== 8'b10010000) $display("FAIL: Test case 13 failed");

        // Test case 14: 13 * 13 = 169
        A = 4'b1101; B = 4'b1101; #10;
        if (product !== 8'b10101001) $display("FAIL: Test case 14 failed");

        // Test case 15: 14 * 14 = 196
        A = 4'b1110; B = 4'b1110; #10;
        if (product !== 8'b11000100) $display("FAIL: Test case 15 failed");

        // Test case 16: 15 * 15 = 225
        A = 4'b1111; B = 4'b1111; #10;
        if (product !== 8'b11100001) $display("FAIL: Test case 16 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule