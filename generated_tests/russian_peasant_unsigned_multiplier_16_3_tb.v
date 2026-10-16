`timescale 1ns/1ps

module tb_russian_peasant_unsigned_multiplier_16;

    reg [15:0] A;
    reg [15:0] B;
    wire [31:0] product;

    // Instantiate the module under test
    russian_peasant_unsigned_multiplier_16 uut (
        .A(A),
        .B(B),
        .product(product)
    );

    initial begin
        // Test case 1: 3 * 5 = 15
        A = 16'd3; B = 16'd5;
        #10;
        if (product !== 32'd15) begin
            $display("FAIL: Test case 1 failed, expected 15 but got %d", product);
            $finish;
        end

        // Test case 2: 7 * 6 = 42
        A = 16'd7; B = 16'd6;
        #10;
        if (product !== 32'd42) begin
            $display("FAIL: Test case 2 failed, expected 42 but got %d", product);
            $finish;
        end

        // Test case 3: 0 * 10 = 0
        A = 16'd0; B = 16'd10;
        #10;
        if (product !== 32'd0) begin
            $display("FAIL: Test case 3 failed, expected 0 but got %d", product);
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

        // Test case 6: 32767 * 2 = 65534
        A = 16'd32767; B = 16'd2;
        #10;
        if (product !== 32'd65534) begin
            $display("FAIL: Test case 6 failed, expected 65534 but got %d", product);
            $finish;
        end

        // Test case 7: 12345 * 54321 = 670592745
        A = 16'd12345; B = 16'd54321;
        #10;
        if (product !== 32'd670592745) begin
            $display("FAIL: Test case 7 failed, expected 670592745 but got %d", product);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule