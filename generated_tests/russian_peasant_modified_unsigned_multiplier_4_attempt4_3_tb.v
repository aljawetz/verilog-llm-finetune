`timescale 1ns/1ps

module tb_russian_peasant_modified_unsigned_multiplier_4_attempt4;

    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] product;

    russian_peasant_modified_unsigned_multiplier_4_attempt4 uut (
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
            $display("FAIL: Test case 1 failed, expected 6 but got %d", product);
            $finish;
        end

        // Test case 2: 4 * 5 = 20
        A = 4'b0100; // 4
        B = 4'b0101; // 5
        #10;
        if (product !== 8'b00010100) begin
            $display("FAIL: Test case 2 failed, expected 20 but got %d", product);
            $finish;
        end

        // Test case 3: 7 * 3 = 21
        A = 4'b0111; // 7
        B = 4'b0011; // 3
        #10;
        if (product !== 8'b00010101) begin
            $display("FAIL: Test case 3 failed, expected 21 but got %d", product);
            $finish;
        end

        // Test case 4: 0 * 15 = 0
        A = 4'b0000; // 0
        B = 4'b1111; // 15
        #10;
        if (product !== 8'b00000000) begin
            $display("FAIL: Test case 4 failed, expected 0 but got %d", product);
            $finish;
        end

        // Test case 5: 15 * 15 = 225
        A = 4'b1111; // 15
        B = 4'b1111; // 15
        #10;
        if (product !== 8'b11100001) begin
            $display("FAIL: Test case 5 failed, expected 225 but got %d", product);
            $finish;
        end

        // Test case 6: 1 * 1 = 1
        A = 4'b0001; // 1
        B = 4'b0001; // 1
        #10;
        if (product !== 8'b00000001) begin
            $display("FAIL: Test case 6 failed, expected 1 but got %d", product);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule