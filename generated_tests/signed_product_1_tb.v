`timescale 1ns/1ps

module tb_signed_product;

    reg a_sign;
    reg b_sign;
    reg [7:0] unsigned_product;
    wire [7:0] signed_product;

    // Instantiate the module under test (uut)
    signed_product uut (
        .a_sign(a_sign),
        .b_sign(b_sign),
        .unsigned_product(unsigned_product),
        .signed_product(signed_product)
    );

    initial begin
        // Test case 1: Both inputs are positive
        a_sign = 0; b_sign = 0; unsigned_product = 8'd5; // 5 * 5 = 25
        #10;
        if (signed_product !== 8'd5) begin
            $display("FAIL: Test case 1 failed, expected 5, got %d", signed_product);
            $finish;
        end

        // Test case 2: First input negative, second positive
        a_sign = 1; b_sign = 0; unsigned_product = 8'd5; // -5 * 5 = -25
        #10;
        if (signed_product !== -8'd5) begin
            $display("FAIL: Test case 2 failed, expected -5, got %d", signed_product);
            $finish;
        end

        // Test case 3: First input positive, second negative
        a_sign = 0; b_sign = 1; unsigned_product = 8'd5; // 5 * -5 = -25
        #10;
        if (signed_product !== -8'd5) begin
            $display("FAIL: Test case 3 failed, expected -5, got %d", signed_product);
            $finish;
        end

        // Test case 4: Both inputs negative
        a_sign = 1; b_sign = 1; unsigned_product = 8'd5; // -5 * -5 = 25
        #10;
        if (signed_product !== 8'd5) begin
            $display("FAIL: Test case 4 failed, expected 5, got %d", signed_product);
            $finish;
        end

        // Test case 5: Zero product
        a_sign = 0; b_sign = 0; unsigned_product = 8'd0; // 0 * 0 = 0
        #10;
        if (signed_product !== 8'd0) begin
            $display("FAIL: Test case 5 failed, expected 0, got %d", signed_product);
            $finish;
        end

        // Test case 6: Maximum unsigned product
        a_sign = 1; b_sign = 1; unsigned_product = 8'd255; // -255 * -255 = 255
        #10;
        if (signed_product !== 8'd255) begin
            $display("FAIL: Test case 6 failed, expected 255, got %d", signed_product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule