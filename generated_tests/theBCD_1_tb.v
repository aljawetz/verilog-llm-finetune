`timescale 1ns/1ps

module tb_theBCD;

    reg [3:0] bcd;
    wire [6:0] segment;

    // Instantiate the module under test (uut)
    theBCD uut (
        .bcd(bcd),
        .segment(segment)
    );

    initial begin
        // Test cases
        // Test BCD 0
        bcd = 4'b0000; #10;
        if (segment !== 7'b1111110) $display("FAIL: BCD 0 failed");

        // Test BCD 1
        bcd = 4'b0001; #10;
        if (segment !== 7'b0110000) $display("FAIL: BCD 1 failed");

        // Test BCD 2
        bcd = 4'b0010; #10;
        if (segment !== 7'b1101101) $display("FAIL: BCD 2 failed");

        // Test BCD 3
        bcd = 4'b0011; #10;
        if (segment !== 7'b1111001) $display("FAIL: BCD 3 failed");

        // Test BCD 4
        bcd = 4'b0100; #10;
        if (segment !== 7'b0110011) $display("FAIL: BCD 4 failed");

        // Test BCD 5
        bcd = 4'b0101; #10;
        if (segment !== 7'b1011011) $display("FAIL: BCD 5 failed");

        // Test BCD 6
        bcd = 4'b0110; #10;
        if (segment !== 7'b1011111) $display("FAIL: BCD 6 failed");

        // Test BCD 7
        bcd = 4'b0111; #10;
        if (segment !== 7'b1110000) $display("FAIL: BCD 7 failed");

        // Test BCD 8
        bcd = 4'b1000; #10;
        if (segment !== 7'b1111111) $display("FAIL: BCD 8 failed");

        // Test BCD 9
        bcd = 4'b1001; #10;
        if (segment !== 7'b1111011) $display("FAIL: BCD 9 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule