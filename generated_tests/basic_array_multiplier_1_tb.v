`timescale 1ns/1ps

module tb_basic_array_multiplier;

    // Inputs
    reg [7:0] multiplicand;
    reg [7:0] multiplier;

    // Output
    wire [15:0] product;

    // Instantiate the Unit Under Test (UUT)
    basic_array_multiplier uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    initial begin
        // Test case 1: 3 * 4 = 12
        multiplicand = 8'd3;
        multiplier = 8'd4;
        #10;
        if (product !== 16'd12) begin
            $display("FAIL: Expected product 12, got %d", product);
            $finish;
        end

        // Test case 2: 5 * 6 = 30
        multiplicand = 8'd5;
        multiplier = 8'd6;
        #10;
        if (product !== 16'd30) begin
            $display("FAIL: Expected product 30, got %d", product);
            $finish;
        end

        // Test case 3: 255 * 255 = 65025
        multiplicand = 8'd255;
        multiplier = 8'd255;
        #10;
        if (product !== 16'd65025) begin
            $display("FAIL: Expected product 65025, got %d", product);
            $finish;
        end

        // Test case 4: 0 * 100 = 0
        multiplicand = 8'd0;
        multiplier = 8'd100;
        #10;
        if (product !== 16'd0) begin
            $display("FAIL: Expected product 0, got %d", product);
            $finish;
        end

        // Test case 5: 1 * 1 = 1
        multiplicand = 8'd1;
        multiplier = 8'd1;
        #10;
        if (product !== 16'd1) begin
            $display("FAIL: Expected product 1, got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule