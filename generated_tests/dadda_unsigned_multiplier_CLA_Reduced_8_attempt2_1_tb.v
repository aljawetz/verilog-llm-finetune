`timescale 1ns/1ps

module tb_dadda_unsigned_multiplier_CLA_Reduced_8_attempt2;

    reg [7:0] A;
    reg [7:0] B;
    wire [15:0] product;

    // Instantiate the module under test
    dadda_unsigned_multiplier_CLA_Reduced_8_attempt2 uut (
        .product(product),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: 0 * 0 = 0
        A = 8'd0; B = 8'd0;
        #10;
        if (product !== 16'd0) begin
            $display("FAIL: Test case 1 failed, expected 0, got %d", product);
            $finish;
        end

        // Test case 2: 1 * 1 = 1
        A = 8'd1; B = 8'd1;
        #10;
        if (product !== 16'd1) begin
            $display("FAIL: Test case 2 failed, expected 1, got %d", product);
            $finish;
        end

        // Test case 3: 2 * 3 = 6
        A = 8'd2; B = 8'd3;
        #10;
        if (product !== 16'd6) begin
            $display("FAIL: Test case 3 failed, expected 6, got %d", product);
            $finish;
        end

        // Test case 4: 15 * 15 = 225
        A = 8'd15; B = 8'd15;
        #10;
        if (product !== 16'd225) begin
            $display("FAIL: Test case 4 failed, expected 225, got %d", product);
            $finish;
        end

        // Test case 5: 255 * 255 = 65025
        A = 8'd255; B = 8'd255;
        #10;
        if (product !== 16'd65025) begin
            $display("FAIL: Test case 5 failed, expected 65025, got %d", product);
            $finish;
        end

        // Test case 6: 128 * 64 = 8192
        A = 8'd128; B = 8'd64;
        #10;
        if (product !== 16'd8192) begin
            $display("FAIL: Test case 6 failed, expected 8192, got %d", product);
            $finish;
        end

        // Test case 7: 7 * 9 = 63
        A = 8'd7; B = 8'd9;
        #10;
        if (product !== 16'd63) begin
            $display("FAIL: Test case 7 failed, expected 63, got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule