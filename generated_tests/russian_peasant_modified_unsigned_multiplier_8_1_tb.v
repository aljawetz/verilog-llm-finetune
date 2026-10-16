`timescale 1ns/1ps

module tb_russian_peasant_modified_unsigned_multiplier_8;

    reg [7:0] A;
    reg [7:0] B;
    wire [15:0] product;

    russian_peasant_modified_unsigned_multiplier_8 uut (
        .product(product),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: 0 * 0 = 0
        A = 8'b00000000; B = 8'b00000000;
        #10;
        if (product !== 16'b0000000000000000) begin
            $display("FAIL: Test case 1 failed, expected 0, got %b", product);
            $finish;
        end

        // Test case 2: 1 * 1 = 1
        A = 8'b00000001; B = 8'b00000001;
        #10;
        if (product !== 16'b0000000000000001) begin
            $display("FAIL: Test case 2 failed, expected 1, got %b", product);
            $finish;
        end

        // Test case 3: 2 * 3 = 6
        A = 8'b00000010; B = 8'b00000011;
        #10;
        if (product !== 16'b0000000000000110) begin
            $display("FAIL: Test case 3 failed, expected 6, got %b", product);
            $finish;
        end

        // Test case 4: 5 * 5 = 25
        A = 8'b00000101; B = 8'b00000101;
        #10;
        if (product !== 16'b0000000000011001) begin
            $display("FAIL: Test case 4 failed, expected 25, got %b", product);
            $finish;
        end

        // Test case 5: 15 * 15 = 225
        A = 8'b00001111; B = 8'b00001111;
        #10;
        if (product !== 16'b0000000011100001) begin
            $display("FAIL: Test case 5 failed, expected 225, got %b", product);
            $finish;
        end

        // Test case 6: 255 * 255 = 65025
        A = 8'b11111111; B = 8'b11111111;
        #10;
        if (product !== 16'b1111111000000001) begin
            $display("FAIL: Test case 6 failed, expected 65025, got %b", product);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule