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
        if (binary_out !== 4'b0000) $display("FAIL: gray_in=0000, binary_out=%b", binary_out);

        // Gray code 0001 -> Binary 0001
        gray_in = 4'b0001; #10;
        if (binary_out !== 4'b0001) $display("FAIL: gray_in=0001, binary_out=%b", binary_out);

        // Gray code 0011 -> Binary 0010
        gray_in = 4'b0011; #10;
        if (binary_out !== 4'b0010) $display("FAIL: gray_in=0011, binary_out=%b", binary_out);

        // Gray code 0010 -> Binary 0011
        gray_in = 4'b0010; #10;
        if (binary_out !== 4'b0011) $display("FAIL: gray_in=0010, binary_out=%b", binary_out);

        // Gray code 0111 -> Binary 0100
        gray_in = 4'b0111; #10;
        if (binary_out !== 4'b0100) $display("FAIL: gray_in=0111, binary_out=%b", binary_out);

        // Gray code 0110 -> Binary 0101
        gray_in = 4'b0110; #10;
        if (binary_out !== 4'b0101) $display("FAIL: gray_in=0110, binary_out=%b", binary_out);

        // Gray code 0101 -> Binary 0111
        gray_in = 4'b0101; #10;
        if (binary_out !== 4'b0111) $display("FAIL: gray_in=0101, binary_out=%b", binary_out);

        // Gray code 0100 -> Binary 0110
        gray_in = 4'b0100; #10;
        if (binary_out !== 4'b0110) $display("FAIL: gray_in=0100, binary_out=%b", binary_out);

        // Gray code 1111 -> Binary 1000
        gray_in = 4'b1111; #10;
        if (binary_out !== 4'b1000) $display("FAIL: gray_in=1111, binary_out=%b", binary_out);

        // Gray code 1110 -> Binary 1001
        gray_in = 4'b1110; #10;
        if (binary_out !== 4'b1001) $display("FAIL: gray_in=1110, binary_out=%b", binary_out);

        // Gray code 1100 -> Binary 1100
        gray_in = 4'b1100; #10;
        if (binary_out !== 4'b1100) $display("FAIL: gray_in=1100, binary_out=%b", binary_out);

        // Gray code 1101 -> Binary 1101
        gray_in = 4'b1101; #10;
        if (binary_out !== 4'b1101) $display("FAIL: gray_in=1101, binary_out=%b", binary_out);

        // Gray code 1011 -> Binary 1010
        gray_in = 4'b1011; #10;
        if (binary_out !== 4'b1010) $display("FAIL: gray_in=1011, binary_out=%b", binary_out);

        // Gray code 1010 -> Binary 1011
        gray_in = 4'b1010; #10;
        if (binary_out !== 4'b1011) $display("FAIL: gray_in=1010, binary_out=%b", binary_out);

        // Gray code 1000 -> Binary 1000
        gray_in = 4'b1000; #10;
        if (binary_out !== 4'b1000) $display("FAIL: gray_in=1000, binary_out=%b", binary_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule