`timescale 1ns/1ps

module tb_b2xs3;
    reg [3:0] bin;
    wire [3:0] xs3;
    wire invalid;

    // Instantiate the module under test
    b2xs3 uut (
        .bin(bin),
        .xs3(xs3),
        .invalid(invalid)
    );

    initial begin
        // Test valid BCD inputs
        bin = 4'b0000; #10; // 0 in BCD
        if (xs3 !== 4'b0011 || invalid !== 1'b0) $display("FAIL: Test case 0 failed");

        bin = 4'b0001; #10; // 1 in BCD
        if (xs3 !== 4'b0100 || invalid !== 1'b0) $display("FAIL: Test case 1 failed");

        bin = 4'b0010; #10; // 2 in BCD
        if (xs3 !== 4'b0101 || invalid !== 1'b0) $display("FAIL: Test case 2 failed");

        bin = 4'b0011; #10; // 3 in BCD
        if (xs3 !== 4'b0110 || invalid !== 1'b0) $display("FAIL: Test case 3 failed");

        bin = 4'b0100; #10; // 4 in BCD
        if (xs3 !== 4'b0111 || invalid !== 1'b0) $display("FAIL: Test case 4 failed");

        bin = 4'b0101; #10; // 5 in BCD
        if (xs3 !== 4'b1000 || invalid !== 1'b0) $display("FAIL: Test case 5 failed");

        bin = 4'b0110; #10; // 6 in BCD
        if (xs3 !== 4'b1001 || invalid !== 1'b0) $display("FAIL: Test case 6 failed");

        bin = 4'b0111; #10; // 7 in BCD
        if (xs3 !== 4'b1010 || invalid !== 1'b0) $display("FAIL: Test case 7 failed");

        bin = 4'b1000; #10; // 8 in BCD
        if (xs3 !== 4'b1011 || invalid !== 1'b0) $display("FAIL: Test case 8 failed");

        bin = 4'b1001; #10; // 9 in BCD
        if (xs3 !== 4'b1100 || invalid !== 1'b0) $display("FAIL: Test case 9 failed");

        // Test invalid BCD inputs
        bin = 4'b1010; #10; // 10 in BCD
        if (xs3 !== 4'bxxxx || invalid !== 1'b1) $display("FAIL: Test case 10 failed");

        bin = 4'b1111; #10; // 15 in BCD
        if (xs3 !== 4'bxxxx || invalid !== 1'b1) $display("FAIL: Test case 11 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule