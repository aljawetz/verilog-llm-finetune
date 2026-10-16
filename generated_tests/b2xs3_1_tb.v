`timescale 1ns/1ps

module tb_b2xs3;

    reg [3:0] bin;
    wire [3:0] xs3;
    wire invalid;

    // Instantiate the module under test (uut)
    b2xs3 uut (
        .bin(bin),
        .xs3(xs3),
        .invalid(invalid)
    );

    initial begin
        // Test cases for valid inputs (0-9)
        bin = 4'b0000; #10; // 0
        if (xs3 !== 4'b0011 || invalid !== 1'b0) $display("FAIL: Test case for bin=0 failed");

        bin = 4'b0001; #10; // 1
        if (xs3 !== 4'b0100 || invalid !== 1'b0) $display("FAIL: Test case for bin=1 failed");

        bin = 4'b0010; #10; // 2
        if (xs3 !== 4'b0101 || invalid !== 1'b0) $display("FAIL: Test case for bin=2 failed");

        bin = 4'b0011; #10; // 3
        if (xs3 !== 4'b0110 || invalid !== 1'b0) $display("FAIL: Test case for bin=3 failed");

        bin = 4'b0100; #10; // 4
        if (xs3 !== 4'b0111 || invalid !== 1'b0) $display("FAIL: Test case for bin=4 failed");

        bin = 4'b0101; #10; // 5
        if (xs3 !== 4'b1000 || invalid !== 1'b0) $display("FAIL: Test case for bin=5 failed");

        bin = 4'b0110; #10; // 6
        if (xs3 !== 4'b1001 || invalid !== 1'b0) $display("FAIL: Test case for bin=6 failed");

        bin = 4'b0111; #10; // 7
        if (xs3 !== 4'b1010 || invalid !== 1'b0) $display("FAIL: Test case for bin=7 failed");

        bin = 4'b1000; #10; // 8
        if (xs3 !== 4'b1011 || invalid !== 1'b0) $display("FAIL: Test case for bin=8 failed");

        bin = 4'b1001; #10; // 9
        if (xs3 !== 4'b1100 || invalid !== 1'b0) $display("FAIL: Test case for bin=9 failed");

        // Test cases for invalid inputs (10-15)
        bin = 4'b1010; #10; // 10
        if (invalid !== 1'b1) $display("FAIL: Test case for bin=10 failed");

        bin = 4'b1111; #10; // 15
        if (invalid !== 1'b1) $display("FAIL: Test case for bin=15 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule