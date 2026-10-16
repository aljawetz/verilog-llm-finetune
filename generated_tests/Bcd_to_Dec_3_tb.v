`timescale 1ns/1ps

module tb_Bcd_to_Dec;

    reg [3:0] a;
    wire [9:0] y;

    // Instantiate the module under test
    Bcd_to_Dec uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test all BCD inputs from 0 to 9
        // Expected outputs for BCD inputs
        // 0 -> 0000000001
        // 1 -> 0000000010
        // 2 -> 0000000100
        // 3 -> 0000001000
        // 4 -> 0000010000
        // 5 -> 0000100000
        // 6 -> 0001000000
        // 7 -> 0010000000
        // 8 -> 0100000000
        // 9 -> 1000000000

        a = 4'b0000; #10;
        if (y !== 10'b0000000001) $display("FAIL: Input 0, Expected 0000000001, Got %b", y);

        a = 4'b0001; #10;
        if (y !== 10'b0000000010) $display("FAIL: Input 1, Expected 0000000010, Got %b", y);

        a = 4'b0010; #10;
        if (y !== 10'b0000000100) $display("FAIL: Input 2, Expected 0000000100, Got %b", y);

        a = 4'b0011; #10;
        if (y !== 10'b0000001000) $display("FAIL: Input 3, Expected 0000001000, Got %b", y);

        a = 4'b0100; #10;
        if (y !== 10'b0000010000) $display("FAIL: Input 4, Expected 0000010000, Got %b", y);

        a = 4'b0101; #10;
        if (y !== 10'b0000100000) $display("FAIL: Input 5, Expected 0000100000, Got %b", y);

        a = 4'b0110; #10;
        if (y !== 10'b0001000000) $display("FAIL: Input 6, Expected 0001000000, Got %b", y);

        a = 4'b0111; #10;
        if (y !== 10'b0010000000) $display("FAIL: Input 7, Expected 0010000000, Got %b", y);

        a = 4'b1000; #10;
        if (y !== 10'b0100000000) $display("FAIL: Input 8, Expected 0100000000, Got %b", y);

        a = 4'b1001; #10;
        if (y !== 10'b1000000000) $display("FAIL: Input 9, Expected 1000000000, Got %b", y);

        // Test invalid BCD input (10-15)
        a = 4'b1010; #10;
        if (y !== 10'b0000000000) $display("FAIL: Input 10, Expected 0000000000, Got %b", y);

        a = 4'b1011; #10;
        if (y !== 10'b0000000000) $display("FAIL: Input 11, Expected 0000000000, Got %b", y);

        a = 4'b1100; #10;
        if (y !== 10'b0000000000) $display("FAIL: Input 12, Expected 0000000000, Got %b", y);

        a = 4'b1101; #10;
        if (y !== 10'b0000000000) $display("FAIL: Input 13, Expected 0000000000, Got %b", y);

        a = 4'b1110; #10;
        if (y !== 10'b0000000000) $display("FAIL: Input 14, Expected 0000000000, Got %b", y);

        a = 4'b1111; #10;
        if (y !== 10'b0000000000) $display("FAIL: Input 15, Expected 0000000000, Got %b", y);

        $display("PASS");
        $finish;
    end

endmodule