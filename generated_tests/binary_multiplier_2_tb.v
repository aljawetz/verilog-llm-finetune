`timescale 1ns/1ps

module tb_binary_multiplier;

    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] product;

    // Instantiate the module under test (uut)
    binary_multiplier uut (
        .a(a),
        .b(b),
        .product(product)
    );

    initial begin
        // Test cases
        // Test case 1: 3 * 2 = 6
        a = 4'b0011; // 3
        b = 4'b0010; // 2
        #10;
        if (product !== 8'b00000110) begin
            $display("FAIL: Test case 1 failed, expected 6, got %d", product);
            $finish;
        end

        // Test case 2: 4 * 5 = 20
        a = 4'b0100; // 4
        b = 4'b0101; // 5
        #10;
        if (product !== 8'b00010100) begin
            $display("FAIL: Test case 2 failed, expected 20, got %d", product);
            $finish;
        end

        // Test case 3: 7 * 3 = 21
        a = 4'b0111; // 7
        b = 4'b0011; // 3
        #10;
        if (product !== 8'b00010101) begin
            $display("FAIL: Test case 3 failed, expected 21, got %d", product);
            $finish;
        end

        // Test case 4: 0 * 15 = 0
        a = 4'b0000; // 0
        b = 4'b1111; // 15
        #10;
        if (product !== 8'b00000000) begin
            $display("FAIL: Test case 4 failed, expected 0, got %d", product);
            $finish;
        end

        // Test case 5: 15 * 15 = 225
        a = 4'b1111; // 15
        b = 4'b1111; // 15
        #10;
        if (product !== 8'b11100001) begin
            $display("FAIL: Test case 5 failed, expected 225, got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule