`timescale 1ns/1ps

module tb_russian_peasant_unsigned_multiplier_16;

    reg [15:0] A;
    reg [15:0] B;
    wire [31:0] product;

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
            $display("FAIL: Expected product 15, got %d", product);
            $finish;
        end

        // Test case 2: 0 * 10 = 0
        A = 16'd0; B = 16'd10;
        #10;
        if (product !== 32'd0) begin
            $display("FAIL: Expected product 0, got %d", product);
            $finish;
        end

        // Test case 3: 1 * 1 = 1
        A = 16'd1; B = 16'd1;
        #10;
        if (product !== 32'd1) begin
            $display("FAIL: Expected product 1, got %d", product);
            $finish;
        end

        // Test case 4: 15 * 15 = 225
        A = 16'd15; B = 16'd15;
        #10;
        if (product !== 32'd225) begin
            $display("FAIL: Expected product 225, got %d", product);
            $finish;
        end

        // Test case 5: 16 * 16 = 256
        A = 16'd16; B = 16'd16;
        #10;
        if (product !== 32'd256) begin
            $display("FAIL: Expected product 256, got %d", product);
            $finish;
        end

        // Test case 6: 32767 * 2 = 65534
        A = 16'd32767; B = 16'd2;
        #10;
        if (product !== 32'd65534) begin
            $display("FAIL: Expected product 65534, got %d", product);
            $finish;
        end

        // Test case 7: 12345 * 6789 = 83810205
        A = 16'd12345; B = 16'd6789;
        #10;
        if (product !== 32'd83810205) begin
            $display("FAIL: Expected product 83810205, got %d", product);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule