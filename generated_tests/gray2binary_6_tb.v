`timescale 1ns/1ps

module tb_gray2binary;

    reg [3:0] gray_in;
    wire [3:0] binary_out;

    // Instantiate the module under test (uut)
    gray2binary uut (
        .gray_in(gray_in),
        .binary_out(binary_out)
    );

    initial begin
        // Test cases
        // Gray code 0000 -> Binary 0000
        gray_in = 4'b0000; #10;
        if (binary_out !== 4'b0000) $display("FAIL: gray_in=0000, expected binary_out=0000, got binary_out=%b", binary_out);

        // Gray code 0001 -> Binary 0001
        gray_in = 4'b0001; #10;
        if (binary_out !== 4'b0001) $display("FAIL: gray_in=0001, expected binary_out=0001, got binary_out=%b", binary_out);

        // Gray code 0011 -> Binary 0010
        gray_in = 4'b0011; #10;
        if (binary_out !== 4'b0010) $display("FAIL: gray_in=0011, expected binary_out=0010, got binary_out=%b", binary_out);

        // Gray code 0010 -> Binary 0011
        gray_in = 4'b0010; #10;
        if (binary_out !== 4'b0011) $display("FAIL: gray_in=0010, expected binary_out=0011, got binary_out=%b", binary_out);

        // Gray code 0111 -> Binary 0100
        gray_in = 4'b0111; #10;
        if (binary_out !== 4'b0100) $display("FAIL: gray_in=0111, expected binary_out=0100, got binary_out=%b", binary_out);

        // Gray code 0100 -> Binary 0101
        gray_in = 4'b0100; #10;
        if (binary_out !== 4'b0101) $display("FAIL: gray_in=0100, expected binary_out=0101, got binary_out=%b", binary_out);

        // Gray code 1111 -> Binary 1000
        gray_in = 4'b1111; #10;
        if (binary_out !== 4'b1000) $display("FAIL: gray_in=1111, expected binary_out=1000, got binary_out=%b", binary_out);

        // Gray code 1000 -> Binary 1001
        gray_in = 4'b1000; #10;
        if (binary_out !== 4'b1001) $display("FAIL: gray_in=1000, expected binary_out=1001, got binary_out=%b", binary_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule