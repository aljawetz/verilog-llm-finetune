`timescale 1ns/1ps

module tb_BCD_TO_DECIMAL;

    reg [3:0] b;
    wire [9:0] d;

    // Instantiate the module under test (uut)
    BCD_TO_DECIMAL uut (
        .b(b),
        .d(d)
    );

    initial begin
        // Test all BCD values from 0 to 9
        b = 4'b0000; #10; // BCD 0
        if (d !== 10'b0000000000) $display("FAIL: BCD 0 output incorrect");

        b = 4'b0001; #10; // BCD 1
        if (d !== 10'b0000000001) $display("FAIL: BCD 1 output incorrect");

        b = 4'b0010; #10; // BCD 2
        if (d !== 10'b0000000010) $display("FAIL: BCD 2 output incorrect");

        b = 4'b0011; #10; // BCD 3
        if (d !== 10'b0000000100) $display("FAIL: BCD 3 output incorrect");

        b = 4'b0100; #10; // BCD 4
        if (d !== 10'b0000001000) $display("FAIL: BCD 4 output incorrect");

        b = 4'b0101; #10; // BCD 5
        if (d !== 10'b0000010000) $display("FAIL: BCD 5 output incorrect");

        b = 4'b0110; #10; // BCD 6
        if (d !== 10'b0000100000) $display("FAIL: BCD 6 output incorrect");

        b = 4'b0111; #10; // BCD 7
        if (d !== 10'b0001000000) $display("FAIL: BCD 7 output incorrect");

        b = 4'b1000; #10; // BCD 8
        if (d !== 10'b0010000000) $display("FAIL: BCD 8 output incorrect");

        b = 4'b1001; #10; // BCD 9
        if (d !== 10'b0100000000) $display("FAIL: BCD 9 output incorrect");

        // Check invalid BCD values (10-15)
        b = 4'b1010; #10; // BCD 10
        if (d !== 10'b0000000000) $display("FAIL: BCD 10 output incorrect");

        b = 4'b1011; #10; // BCD 11
        if (d !== 10'b0000000000) $display("FAIL: BCD 11 output incorrect");

        b = 4'b1100; #10; // BCD 12
        if (d !== 10'b0000000000) $display("FAIL: BCD 12 output incorrect");

        b = 4'b1101; #10; // BCD 13
        if (d !== 10'b0000000000) $display("FAIL: BCD 13 output incorrect");

        b = 4'b1110; #10; // BCD 14
        if (d !== 10'b0000000000) $display("FAIL: BCD 14 output incorrect");

        b = 4'b1111; #10; // BCD 15
        if (d !== 10'b0000000000) $display("FAIL: BCD 15 output incorrect");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule