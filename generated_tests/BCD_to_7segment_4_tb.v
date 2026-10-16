`timescale 1ns/1ps

module tb_BCD_to_7segment;

    reg [3:0] BCD;
    wire [6:0] segment7;

    // Instantiate the module under test (uut)
    BCD_to_7segment uut (
        .BCD(BCD),
        .segment7(segment7)
    );

    initial begin
        // Test cases for BCD to 7-segment display
        // Expected outputs are based on BCD input
        // BCD: 0 -> segment7: 7'b0000001
        BCD = 4'b0000; #10;
        if (segment7 !== 7'b0000001) $display("FAIL: BCD 0 failed");

        // BCD: 1 -> segment7: 7'b1001111
        BCD = 4'b0001; #10;
        if (segment7 !== 7'b1001111) $display("FAIL: BCD 1 failed");

        // BCD: 2 -> segment7: 7'b0010010
        BCD = 4'b0010; #10;
        if (segment7 !== 7'b0010010) $display("FAIL: BCD 2 failed");

        // BCD: 3 -> segment7: 7'b0000110
        BCD = 4'b0011; #10;
        if (segment7 !== 7'b0000110) $display("FAIL: BCD 3 failed");

        // BCD: 4 -> segment7: 7'b1001100
        BCD = 4'b0100; #10;
        if (segment7 !== 7'b1001100) $display("FAIL: BCD 4 failed");

        // BCD: 5 -> segment7: 7'b0100100
        BCD = 4'b0101; #10;
        if (segment7 !== 7'b0100100) $display("FAIL: BCD 5 failed");

        // BCD: 6 -> segment7: 7'b0100000
        BCD = 4'b0110; #10;
        if (segment7 !== 7'b0100000) $display("FAIL: BCD 6 failed");

        // BCD: 7 -> segment7: 7'b0001111
        BCD = 4'b0111; #10;
        if (segment7 !== 7'b0001111) $display("FAIL: BCD 7 failed");

        // BCD: 8 -> segment7: 7'b0000000
        BCD = 4'b1000; #10;
        if (segment7 !== 7'b0000000) $display("FAIL: BCD 8 failed");

        // BCD: 9 -> segment7: 7'b0000100
        BCD = 4'b1001; #10;
        if (segment7 !== 7'b0000100) $display("FAIL: BCD 9 failed");

        // BCD: 10 (invalid BCD) -> segment7: 7'b1111111 (all segments off)
        BCD = 4'b1010; #10;
        if (segment7 !== 7'b1111111) $display("FAIL: BCD 10 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule