`timescale 1ns/1ps

module tb_reduced_multiplier_2;

    reg [1:0] A;
    reg [1:0] B;
    wire [3:0] product;

    // Instantiate the module under test
    reduced_multiplier_2 uut (
        .product(product),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: A = 00, B = 00
        A = 2'b00; B = 2'b00; #10;
        if (product !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", product);

        // Test case 2: A = 01, B = 01
        A = 2'b01; B = 2'b01; #10;
        if (product !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", product);

        // Test case 3: A = 10, B = 10
        A = 2'b10; B = 2'b10; #10;
        if (product !== 4'b0000) $display("FAIL: Test case 3 failed, expected 0000, got %b", product);

        // Test case 4: A = 11, B = 11
        A = 2'b11; B = 2'b11; #10;
        if (product !== 4'b1111) $display("FAIL: Test case 4 failed, expected 1111, got %b", product);

        // Test case 5: A = 01, B = 10
        A = 2'b01; B = 2'b10; #10;
        if (product !== 4'b0010) $display("FAIL: Test case 5 failed, expected 0010, got %b", product);

        // Test case 6: A = 10, B = 01
        A = 2'b10; B = 2'b01; #10;
        if (product !== 4'b0010) $display("FAIL: Test case 6 failed, expected 0010, got %b", product);

        // Test case 7: A = 01, B = 11
        A = 2'b01; B = 2'b11; #10;
        if (product !== 4'b0011) $display("FAIL: Test case 7 failed, expected 0011, got %b", product);

        // Test case 8: A = 11, B = 01
        A = 2'b11; B = 2'b01; #10;
        if (product !== 4'b0011) $display("FAIL: Test case 8 failed, expected 0011, got %b", product);

        // Test case 9: A = 10, B = 11
        A = 2'b10; B = 2'b11; #10;
        if (product !== 4'b0110) $display("FAIL: Test case 9 failed, expected 0110, got %b", product);

        // Test case 10: A = 11, B = 10
        A = 2'b11; B = 2'b10; #10;
        if (product !== 4'b0110) $display("FAIL: Test case 10 failed, expected 0110, got %b", product);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule