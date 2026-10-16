`timescale 1ns/1ps

module tb_russian_peasant_unsigned_multiplier_4;

    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] product;

    // Instantiate the module under test (uut)
    russian_peasant_unsigned_multiplier_4 uut (
        .product(product),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: 3 * 2 = 6
        A = 4'b0011; // 3
        B = 4'b0010; // 2
        #10;
        if (product !== 8'b00000110) begin
            $display("FAIL: Expected product 6, got %d", product);
            $finish;
        end

        // Test case 2: 4 * 5 = 20
        A = 4'b0100; // 4
        B = 4'b0101; // 5
        #10;
        if (product !== 8'b00010100) begin
            $display("FAIL: Expected product 20, got %d", product);
            $finish;
        end

        // Test case 3: 7 * 3 = 21
        A = 4'b0111; // 7
        B = 4'b0011; // 3
        #10;
        if (product !== 8'b00010101) begin
            $display("FAIL: Expected product 21, got %d", product);
            $finish;
        end

        // Test case 4: 0 * 15 = 0
        A = 4'b0000; // 0
        B = 4'b1111; // 15
        #10;
        if (product !== 8'b00000000) begin
            $display("FAIL: Expected product 0, got %d", product);
            $finish;
        end

        // Test case 5: 15 * 15 = 225
        A = 4'b1111; // 15
        B = 4'b1111; // 15
        #10;
        if (product !== 8'b11100001) begin
            $display("FAIL: Expected product 225, got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule