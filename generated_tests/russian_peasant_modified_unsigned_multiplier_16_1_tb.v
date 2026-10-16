`timescale 1ns/1ps

module tb_russian_peasant_modified_unsigned_multiplier_16;

    reg [15:0] A;
    reg [15:0] B;
    wire [31:0] product;

    russian_peasant_modified_unsigned_multiplier_16 uut (
        .product(product),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: 0 * 0 = 0
        A = 16'd0; B = 16'd0;
        #10;
        if (product !== 32'd0) begin
            $display("FAIL: Test case 1 failed (0 * 0)");
            $finish;
        end

        // Test case 2: 1 * 1 = 1
        A = 16'd1; B = 16'd1;
        #10;
        if (product !== 32'd1) begin
            $display("FAIL: Test case 2 failed (1 * 1)");
            $finish;
        end

        // Test case 3: 2 * 3 = 6
        A = 16'd2; B = 16'd3;
        #10;
        if (product !== 32'd6) begin
            $display("FAIL: Test case 3 failed (2 * 3)");
            $finish;
        end

        // Test case 4: 15 * 15 = 225
        A = 16'd15; B = 16'd15;
        #10;
        if (product !== 32'd225) begin
            $display("FAIL: Test case 4 failed (15 * 15)");
            $finish;
        end

        // Test case 5: 16 * 16 = 256
        A = 16'd16; B = 16'd16;
        #10;
        if (product !== 32'd256) begin
            $display("FAIL: Test case 5 failed (16 * 16)");
            $finish;
        end

        // Test case 6: 32767 * 32767 = 1073676289
        A = 16'd32767; B = 16'd32767;
        #10;
        if (product !== 32'd1073676289) begin
            $display("FAIL: Test case 6 failed (32767 * 32767)");
            $finish;
        end

        // Test case 7: 12345 * 54321 = 670592745
        A = 16'd12345; B = 16'd54321;
        #10;
        if (product !== 32'd670592745) begin
            $display("FAIL: Test case 7 failed (12345 * 54321)");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule