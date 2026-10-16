`timescale 1ns/1ps

module tb_Bcd_to_Dec;

    reg [3:0] a;
    wire [9:0] y;

    // Instantiate the module under test (uut)
    Bcd_to_Dec uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test cases for BCD to Decimal conversion
        // BCD 0000 -> Decimal 0
        a = 4'b0000; #10;
        if (y !== 10'b0000000000) $display("FAIL: Test case BCD 0000 failed");

        // BCD 0001 -> Decimal 1
        a = 4'b0001; #10;
        if (y !== 10'b0000000001) $display("FAIL: Test case BCD 0001 failed");

        // BCD 0010 -> Decimal 2
        a = 4'b0010; #10;
        if (y !== 10'b0000000010) $display("FAIL: Test case BCD 0010 failed");

        // BCD 0011 -> Decimal 3
        a = 4'b0011; #10;
        if (y !== 10'b0000000011) $display("FAIL: Test case BCD 0011 failed");

        // BCD 0100 -> Decimal 4
        a = 4'b0100; #10;
        if (y !== 10'b0000000100) $display("FAIL: Test case BCD 0100 failed");

        // BCD 0101 -> Decimal 5
        a = 4'b0101; #10;
        if (y !== 10'b0000000101) $display("FAIL: Test case BCD 0101 failed");

        // BCD 0110 -> Decimal 6
        a = 4'b0110; #10;
        if (y !== 10'b0000000110) $display("FAIL: Test case BCD 0110 failed");

        // BCD 0111 -> Decimal 7
        a = 4'b0111; #10;
        if (y !== 10'b0000000111) $display("FAIL: Test case BCD 0111 failed");

        // BCD 1000 -> Decimal 8
        a = 4'b1000; #10;
        if (y !== 10'b0000001000) $display("FAIL: Test case BCD 1000 failed");

        // BCD 1001 -> Decimal 9
        a = 4'b1001; #10;
        if (y !== 10'b0000001001) $display("FAIL: Test case BCD 1001 failed");

        // BCD 1010 -> Invalid BCD
        a = 4'b1010; #10;
        if (y !== 10'b0000000000) $display("FAIL: Test case BCD 1010 failed");

        // BCD 1111 -> Invalid BCD
        a = 4'b1111; #10;
        if (y !== 10'b0000000000) $display("FAIL: Test case BCD 1111 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule