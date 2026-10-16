`timescale 1ns/1ps

module tb_BCD_TO_7SEGMENT;

    reg [3:0] b;
    wire [6:0] s;

    // Instantiate the module under test (uut)
    BCD_TO_7SEGMENT uut (
        .b(b),
        .s(s)
    );

    initial begin
        // Test cases for BCD to 7-segment conversion
        // Test for 0
        b = 4'b0000; #10;
        if (s !== 7'b0111111) $display("FAIL: Test case for BCD 0 failed");

        // Test for 1
        b = 4'b0001; #10;
        if (s !== 7'b0000110) $display("FAIL: Test case for BCD 1 failed");

        // Test for 2
        b = 4'b0010; #10;
        if (s !== 7'b1011011) $display("FAIL: Test case for BCD 2 failed");

        // Test for 3
        b = 4'b0011; #10;
        if (s !== 7'b1001111) $display("FAIL: Test case for BCD 3 failed");

        // Test for 4
        b = 4'b0100; #10;
        if (s !== 7'b1100110) $display("FAIL: Test case for BCD 4 failed");

        // Test for 5
        b = 4'b0101; #10;
        if (s !== 7'b1101101) $display("FAIL: Test case for BCD 5 failed");

        // Test for 6
        b = 4'b0110; #10;
        if (s !== 7'b1111101) $display("FAIL: Test case for BCD 6 failed");

        // Test for 7
        b = 4'b0111; #10;
        if (s !== 7'b0000111) $display("FAIL: Test case for BCD 7 failed");

        // Test for 8
        b = 4'b1000; #10;
        if (s !== 7'b1111111) $display("FAIL: Test case for BCD 8 failed");

        // Test for 9
        b = 4'b1001; #10;
        if (s !== 7'b1101111) $display("FAIL: Test case for BCD 9 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule