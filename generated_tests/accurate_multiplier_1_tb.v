`timescale 1ns/1ps

module tb_accurate_multiplier;

    // Parameters
    parameter a_BW = 4;
    parameter b_BW = 4;
    parameter product_BW = a_BW + b_BW;

    // Inputs
    reg [a_BW-1:0] a;
    reg [b_BW-1:0] b;

    // Output
    wire [product_BW-1:0] product;

    // Instantiate the Unit Under Test (UUT)
    accurate_multiplier #(
        .a_BW(a_BW), 
        .b_BW(b_BW)
    ) uut (
        .a(a), 
        .b(b), 
        .product(product)
    );

    initial begin
        // Test case 1: 2 * 3 = 6
        a = 4'b0010; // 2
        b = 4'b0011; // 3
        #10;
        if (product !== 6) begin
            $display("FAIL: Expected product 6, got %d", product);
            $finish;
        end

        // Test case 2: 4 * 4 = 16
        a = 4'b0100; // 4
        b = 4'b0100; // 4
        #10;
        if (product !== 16) begin
            $display("FAIL: Expected product 16, got %d", product);
            $finish;
        end

        // Test case 3: 1 * 15 = 15
        a = 4'b0001; // 1
        b = 4'b1111; // 15
        #10;
        if (product !== 15) begin
            $display("FAIL: Expected product 15, got %d", product);
            $finish;
        end

        // Test case 4: 0 * 5 = 0
        a = 4'b0000; // 0
        b = 4'b0101; // 5
        #10;
        if (product !== 0) begin
            $display("FAIL: Expected product 0, got %d", product);
            $finish;
        end

        // Test case 5: 7 * 7 = 49
        a = 4'b0111; // 7
        b = 4'b0111; // 7
        #10;
        if (product !== 49) begin
            $display("FAIL: Expected product 49, got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule