`timescale 1ns/1ps

module tb_BCD_to_7seg;

    reg [3:0] bcd;
    wire [6:0] seg;

    // Instantiate the Unit Under Test (UUT)
    BCD_to_7seg uut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        // Test all BCD values from 0 to 9
        bcd = 4'b0000; #10;
        if (seg !== 7'b0000001) $display("FAIL: BCD 0 failed");

        bcd = 4'b0001; #10;
        if (seg !== 7'b1001111) $display("FAIL: BCD 1 failed");

        bcd = 4'b0010; #10;
        if (seg !== 7'b0010010) $display("FAIL: BCD 2 failed");

        bcd = 4'b0011; #10;
        if (seg !== 7'b0000110) $display("FAIL: BCD 3 failed");

        bcd = 4'b0100; #10;
        if (seg !== 7'b1001100) $display("FAIL: BCD 4 failed");

        bcd = 4'b0101; #10;
        if (seg !== 7'b0100100) $display("FAIL: BCD 5 failed");

        bcd = 4'b0110; #10;
        if (seg !== 7'b0100000) $display("FAIL: BCD 6 failed");

        bcd = 4'b0111; #10;
        if (seg !== 7'b0001111) $display("FAIL: BCD 7 failed");

        // Test invalid BCD values (8 and 9)
        bcd = 4'b1000; #10;
        if (seg !== 7'b0000000) $display("FAIL: BCD 8 failed");

        bcd = 4'b1001; #10;
        if (seg !== 7'b0000000) $display("FAIL: BCD 9 failed");

        // Test out of range BCD values
        bcd = 4'b1010; #10;
        if (seg !== 7'b0000000) $display("FAIL: BCD 10 failed");

        bcd = 4'b1111; #10;
        if (seg !== 7'b0000000) $display("FAIL: BCD 15 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule