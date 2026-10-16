`timescale 1ns/1ps

module tb_russian_peasant_unsigned_multiplier_8;
    reg [7:0] A;
    reg [7:0] B;
    wire [15:0] product;

    // Instantiate the module under test
    russian_peasant_unsigned_multiplier_8 uut (
        .product(product),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: 3 * 5 = 15
        A = 8'b00000011; // 3
        B = 8'b00000101; // 5
        #10;
        if (product !== 16'b0000000000001111) begin
            $display("FAIL: Test case 1 failed, expected 15 but got %d", product);
            $finish;
        end

        // Test case 2: 0 * 255 = 0
        A = 8'b00000000; // 0
        B = 8'b11111111; // 255
        #10;
        if (product !== 16'b0000000000000000) begin
            $display("FAIL: Test case 2 failed, expected 0 but got %d", product);
            $finish;
        end

        // Test case 3: 255 * 1 = 255
        A = 8'b11111111; // 255
        B = 8'b00000001; // 1
        #10;
        if (product !== 16'b0000000011111111) begin
            $display("FAIL: Test case 3 failed, expected 255 but got %d", product);
            $finish;
        end

        // Test case 4: 12 * 12 = 144
        A = 8'b00001100; // 12
        B = 8'b00001100; // 12
        #10;
        if (product !== 16'b0000000010010000) begin
            $display("FAIL: Test case 4 failed, expected 144 but got %d", product);
            $finish;
        end

        // Test case 5: 15 * 15 = 225
        A = 8'b00001111; // 15
        B = 8'b00001111; // 15
        #10;
        if (product !== 16'b0000000011100001) begin
            $display("FAIL: Test case 5 failed, expected 225 but got %d", product);
            $finish;
        end

        // Test case 6: 1 * 0 = 0
        A = 8'b00000001; // 1
        B = 8'b00000000; // 0
        #10;
        if (product !== 16'b0000000000000000) begin
            $display("FAIL: Test case 6 failed, expected 0 but got %d", product);
            $finish;
        end

        // Test case 7: 100 * 2 = 200
        A = 8'b01100100; // 100
        B = 8'b00000010; // 2
        #10;
        if (product !== 16'b0000000011001000) begin
            $display("FAIL: Test case 7 failed, expected 200 but got %d", product);
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule