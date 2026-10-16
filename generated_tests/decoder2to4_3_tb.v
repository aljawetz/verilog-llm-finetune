`timescale 1ns/1ps

module tb_decoder2to4;

    // Inputs
    reg [1:0] a;
    reg e;

    // Outputs
    wire [3:0] y;

    // Instantiate the Unit Under Test (UUT)
    decoder2to4 uut (
        .a(a),
        .e(e),
        .y(y)
    );

    initial begin
        // Initialize Inputs
        a = 2'b00;
        e = 0;

        // Wait for global reset to finish
        #10;

        // Test case 1: Enable signal low (e = 0)
        e = 0;
        a = 2'b00; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        a = 2'b01; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        a = 2'b10; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        a = 2'b11; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // Test case 2: Enable signal high (e = 1)
        e = 1;

        a = 2'b00; #10;
        if (y !== 4'b0001) begin
            $display("FAIL: Test case 2 failed, expected y = 0001, got y = %b", y);
            $finish;
        end

        a = 2'b01; #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Test case 2 failed, expected y = 0010, got y = %b", y);
            $finish;
        end

        a = 2'b10; #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case 2 failed, expected y = 0100, got y = %b", y);
            $finish;
        end

        a = 2'b11; #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Test case 2 failed, expected y = 1000, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule