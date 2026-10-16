`timescale 1ns/1ps

module tb_russian_peasant_unsigned_multiplier_16;

    reg [15:0] A;
    reg [15:0] B;
    wire [31:0] product;

    // Instantiate the module under test (uut)
    russian_peasant_unsigned_multiplier_16 uut (
        .product(product),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: 3 * 5 = 15
        A = 16'd3; B = 16'd5;
        #10;
        if (product !== 32'd15) begin
            $display("FAIL: Test case 1 failed, expected 15 but got %d", product);
            $finish;
        end

        // Test case 2: 0 * 10 = 0
        A = 16'd0; B = 16'd10;
        #10;
        if (product !== 32'd0) begin
            $display("FAIL: Test case 2 failed, expected 0 but got %d", product);
            $finish;
        end

        // Test case 3: 7 * 8 = 56
        A = 16'd7; B = 16'd8;
        #10;
        if (product !== 32'd56) begin
            $display("FAIL: Test case 3 failed, expected 56 but got %d", product);
            $finish;
        end

        // Test case 4: 15 * 15 = 225
        A = 16'd15; B = 16'd15;
        #10;
        if (product !== 32'd225) begin
            $display("FAIL: Test case 4 failed, expected 225 but got %d", product);
            $finish;
        end

        // Test case 5: 16 * 16 = 256
        A = 16'd16; B = 16'd16;
        #10;
        if (product !== 32'd256) begin
            $display("FAIL: Test case 5 failed, expected 256 but got %d", product);
            $finish;
        end

        // Test case 6: 32767 * 1 = 32767
        A = 16'd32767; B = 16'd1;
        #10;
        if (product !== 32'd32767) begin
            $display("FAIL: Test case 6 failed, expected 32767 but got %d", product);
            $finish;
        end

        // Test case 7: 32767 * 32767 = 1073676289
        A = 16'd32767; B = 16'd32767;
        #10;
        if (product !== 32'd1073676289) begin
            $display("FAIL: Test case 7 failed, expected 1073676289 but got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule