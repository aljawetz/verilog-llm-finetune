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
        multiplicand = 8'b00000011; // 3
        multiplier = 8'b00000100;   // 4
        #10;
        if (product !== 16'b0000000000001100) begin
            $display("FAIL: Expected 12, got %d", product);
            $finish;
        end

        // Test case 2: 15 * 15 = 225
        multiplicand = 8'b00001111; // 15
        multiplier = 8'b00001111;   // 15
        #10;
        if (product !== 16'b0000000011100001) begin
            $display("FAIL: Expected 225, got %d", product);
            $finish;
        end

        // Test case 3: 0 * 255 = 0
        multiplicand = 8'b00000000; // 0
        multiplier = 8'b11111111;   // 255
        #10;
        if (product !== 16'b0000000000000000) begin
            $display("FAIL: Expected 0, got %d", product);
            $finish;
        end

        // Test case 4: 255 * 1 = 255
        multiplicand = 8'b11111111; // 255
        multiplier = 8'b00000001;   // 1
        #10;
        if (product !== 16'b0000000011111111) begin
            $display("FAIL: Expected 255, got %d", product);
            $finish;
        end

        // Test case 5: 128 * 2 = 256
        multiplicand = 8'b10000000; // 128
        multiplier = 8'b00000010;   // 2
        #10;
        if (product !== 16'b0000000100000000) begin
            $display("FAIL: Expected 256, got %d", product);
            $finish;
        end

        // Test case 6: 7 * 7 = 49
        multiplicand = 8'b00000111; // 7
        multiplier = 8'b00000111;   // 7
        #10;
        if (product !== 16'b0000000000110001) begin
            $display("FAIL: Expected 49, got %d", product);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule