`timescale 1ns/1ps

module tb_russian_peasant_modified_unsigned_multiplier_4_attempt4;

    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] product;

    // Instantiate the Unit Under Test (UUT)
    russian_peasant_modified_unsigned_multiplier_4_attempt4 uut (
        .product(product),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: 0 * 0 = 0
        A = 4'b0000; B = 4'b0000;
        #10;
        if (product !== 8'b00000000) begin
            $display("FAIL: Test case 1 failed, expected 0, got %b", product);
            $finish;
        end

        // Test case 2: 1 * 1 = 1
        A = 4'b0001; B = 4'b0001;
        #10;
        if (product !== 8'b00000001) begin
            $display("FAIL: Test case 2 failed, expected 1, got %b", product);
            $finish;
        end

        // Test case 3: 2 * 3 = 6
        A = 4'b0010; B = 4'b0011;
        #10;
        if (product !== 8'b00000110) begin
            $display("FAIL: Test case 3 failed, expected 6, got %b", product);
            $finish;
        end

        // Test case 4: 3 * 4 = 12
        A = 4'b0011; B = 4'b0100;
        #10;
        if (product !== 8'b00001100) begin
            $display("FAIL: Test case 4 failed, expected 12, got %b", product);
            $finish;
        end

        // Test case 5: 4 * 5 = 20
        A = 4'b0100; B = 4'b0101;
        #10;
        if (product !== 8'b00010100) begin
            $display("FAIL: Test case 5 failed, expected 20, got %b", product);
            $finish;
        end

        // Test case 6: 7 * 7 = 49
        A = 4'b0111; B = 4'b0111;
        #10;
        if (product !== 8'b00110001) begin
            $display("FAIL: Test case 6 failed, expected 49, got %b", product);
            $finish;
        end

        // Test case 7: 15 * 15 = 225
        A = 4'b1111; B = 4'b1111;
        #10;
        if (product !== 8'b11100001) begin
            $display("FAIL: Test case 7 failed, expected 225, got %b", product);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule