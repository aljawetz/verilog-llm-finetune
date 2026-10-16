`timescale 1ns/1ps

module tb_reduced_multiplier_2_attempt2;

    reg [1:0] A;
    reg [1:0] B;
    wire [3:0] product;

    // Instantiate the module under test (uut)
    reduced_multiplier_2_attempt2 uut (
        .product(product),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: A = 0, B = 0 (0 * 0 = 0)
        A = 2'b00; B = 2'b00; #10;
        if (product !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", product);

        // Test case 2: A = 1, B = 0 (1 * 0 = 0)
        A = 2'b01; B = 2'b00; #10;
        if (product !== 4'b0000) $display("FAIL: Test case 2 failed, expected 0000, got %b", product);

        // Test case 3: A = 0, B = 1 (0 * 1 = 0)
        A = 2'b00; B = 2'b01; #10;
        if (product !== 4'b0000) $display("FAIL: Test case 3 failed, expected 0000, got %b", product);

        // Test case 4: A = 1, B = 1 (1 * 1 = 1)
        A = 2'b01; B = 2'b01; #10;
        if (product !== 4'b0001) $display("FAIL: Test case 4 failed, expected 0001, got %b", product);

        // Test case 5: A = 2, B = 1 (2 * 1 = 2)
        A = 2'b10; B = 2'b01; #10;
        if (product !== 4'b0010) $display("FAIL: Test case 5 failed, expected 0010, got %b", product);

        // Test case 6: A = 1, B = 2 (1 * 2 = 2)
        A = 2'b01; B = 2'b10; #10;
        if (product !== 4'b0010) $display("FAIL: Test case 6 failed, expected 0010, got %b", product);

        // Test case 7: A = 2, B = 2 (2 * 2 = 4)
        A = 2'b10; B = 2'b10; #10;
        if (product !== 4'b0100) $display("FAIL: Test case 7 failed, expected 0100, got %b", product);

        // Test case 8: A = 3, B = 3 (3 * 3 = 9)
        A = 2'b11; B = 2'b11; #10;
        if (product !== 4'b1001) $display("FAIL: Test case 8 failed, expected 1001, got %b", product);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule