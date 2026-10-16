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
        // Test cases
        // Test case 1: 0 * 0 = 0
        A = 4'b0000; B = 4'b0000; #10;
        if (product !== 8'b00000000) begin
            $display("FAIL: Expected 0, got %b", product);
            $finish;
        end

        // Test case 2: 1 * 1 = 1
        A = 4'b0001; B = 4'b0001; #10;
        if (product !== 8'b00000001) begin
            $display("FAIL: Expected 1, got %b", product);
            $finish;
        end

        // Test case 3: 2 * 2 = 4
        A = 4'b0010; B = 4'b0010; #10;
        if (product !== 8'b00000100) begin
            $display("FAIL: Expected 4, got %b", product);
            $finish;
        end

        // Test case 4: 3 * 3 = 9
        A = 4'b0011; B = 4'b0011; #10;
        if (product !== 8'b00001001) begin
            $display("FAIL: Expected 9, got %b", product);
            $finish;
        end

        // Test case 5: 4 * 4 = 16
        A = 4'b0100; B = 4'b0100; #10;
        if (product !== 8'b00010000) begin
            $display("FAIL: Expected 16, got %b", product);
            $finish;
        end

        // Test case 6: 5 * 5 = 25
        A = 4'b0101; B = 4'b0101; #10;
        if (product !== 8'b00011001) begin
            $display("FAIL: Expected 25, got %b", product);
            $finish;
        end

        // Test case 7: 6 * 6 = 36
        A = 4'b0110; B = 4'b0110; #10;
        if (product !== 8'b00100100) begin
            $display("FAIL: Expected 36, got %b", product);
            $finish;
        end

        // Test case 8: 7 * 7 = 49
        A = 4'b0111; B = 4'b0111; #10;
        if (product !== 8'b00110001) begin
            $display("FAIL: Expected 49, got %b", product);
            $finish;
        end

        // Test case 9: 8 * 8 = 64
        A = 4'b1000; B = 4'b1000; #10;
        if (product !== 8'b01000000) begin
            $display("FAIL: Expected 64, got %b", product);
            $finish;
        end

        // Test case 10: 9 * 9 = 81
        A = 4'b1001; B = 4'b1001; #10;
        if (product !== 8'b01010001) begin
            $display("FAIL: Expected 81, got %b", product);
            $finish;
        end

        // Test case 11: 10 * 10 = 100
        A = 4'b1010; B = 4'b1010; #10;
        if (product !== 8'b01100100) begin
            $display("FAIL: Expected 100, got %b", product);
            $finish;
        end

        // Test case 12: 15 * 15 = 225
        A = 4'b1111; B = 4'b1111; #10;
        if (product !== 8'b11100001) begin
            $display("FAIL: Expected 225, got %b", product);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule