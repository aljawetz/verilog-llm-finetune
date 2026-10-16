`timescale 1ns/1ps

module tb_bcd2b;

    reg [3:0] bcd;
    wire invalid;
    wire [7:0] bin;

    // Instantiate the module under test
    bcd2b uut (
        .bcd(bcd),
        .invalid(invalid),
        .bin(bin)
    );

    initial begin
        // Test cases for valid BCD inputs
        bcd = 4'd0; #10;
        if (bin !== 8'b00000000 || invalid !== 0) begin
            $display("FAIL: Test case for BCD 0 failed");
            $finish;
        end

        bcd = 4'd1; #10;
        if (bin !== 8'b00000001 || invalid !== 0) begin
            $display("FAIL: Test case for BCD 1 failed");
            $finish;
        end

        bcd = 4'd2; #10;
        if (bin !== 8'b00000010 || invalid !== 0) begin
            $display("FAIL: Test case for BCD 2 failed");
            $finish;
        end

        bcd = 4'd3; #10;
        if (bin !== 8'b00000011 || invalid !== 0) begin
            $display("FAIL: Test case for BCD 3 failed");
            $finish;
        end

        bcd = 4'd4; #10;
        if (bin !== 8'b00000100 || invalid !== 0) begin
            $display("FAIL: Test case for BCD 4 failed");
            $finish;
        end

        bcd = 4'd5; #10;
        if (bin !== 8'b00000101 || invalid !== 0) begin
            $display("FAIL: Test case for BCD 5 failed");
            $finish;
        end

        bcd = 4'd6; #10;
        if (bin !== 8'b00000110 || invalid !== 0) begin
            $display("FAIL: Test case for BCD 6 failed");
            $finish;
        end

        bcd = 4'd7; #10;
        if (bin !== 8'b00000111 || invalid !== 0) begin
            $display("FAIL: Test case for BCD 7 failed");
            $finish;
        end

        bcd = 4'd8; #10;
        if (bin !== 8'b00001000 || invalid !== 0) begin
            $display("FAIL: Test case for BCD 8 failed");
            $finish;
        end

        bcd = 4'd9; #10;
        if (bin !== 8'b00001001 || invalid !== 0) begin
            $display("FAIL: Test case for BCD 9 failed");
            $finish;
        end

        // Test cases for invalid BCD inputs
        bcd = 4'd10; #10;
        if (bin !== 8'bx || invalid !== 1) begin
            $display("FAIL: Test case for invalid BCD 10 failed");
            $finish;
        end

        bcd = 4'd15; #10;
        if (bin !== 8'bx || invalid !== 1) begin
            $display("FAIL: Test case for invalid BCD 15 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule