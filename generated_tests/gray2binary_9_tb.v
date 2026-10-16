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
        // Test sequence
        // Test case 1: Gray code 0000 -> Binary 0000
        gray_in = 4'b0000; #10;
        if (binary_out !== 4'b0000) $display("FAIL: Expected 0000, got %b", binary_out);

        // Test case 2: Gray code 0001 -> Binary 0001
        gray_in = 4'b0001; #10;
        if (binary_out !== 4'b0001) $display("FAIL: Expected 0001, got %b", binary_out);

        // Test case 3: Gray code 0011 -> Binary 0010
        gray_in = 4'b0011; #10;
        if (binary_out !== 4'b0010) $display("FAIL: Expected 0010, got %b", binary_out);

        // Test case 4: Gray code 0010 -> Binary 0011
        gray_in = 4'b0010; #10;
        if (binary_out !== 4'b0011) $display("FAIL: Expected 0011, got %b", binary_out);

        // Test case 5: Gray code 0111 -> Binary 0100
        gray_in = 4'b0111; #10;
        if (binary_out !== 4'b0100) $display("FAIL: Expected 0100, got %b", binary_out);

        // Test case 6: Gray code 0100 -> Binary 0111
        gray_in = 4'b0100; #10;
        if (binary_out !== 4'b0111) $display("FAIL: Expected 0111, got %b", binary_out);

        // Test case 7: Gray code 1111 -> Binary 1000
        gray_in = 4'b1111; #10;
        if (binary_out !== 4'b1000) $display("FAIL: Expected 1000, got %b", binary_out);

        // Test case 8: Gray code 1000 -> Binary 1111
        gray_in = 4'b1000; #10;
        if (binary_out !== 4'b1111) $display("FAIL: Expected 1111, got %b", binary_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule