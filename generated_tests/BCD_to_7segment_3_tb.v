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
        // Test cases for BCD inputs
        // Expected outputs are based on the BCD to 7-segment mapping
        // BCD 0 -> 0b1111110 (segments a, b, c, d, e, f)
        BCD = 4'b0000; #10;
        if (segment7 !== 7'b1111110) $display("FAIL: BCD 0 failed");

        // BCD 1 -> 0b0110000 (segments b, c)
        BCD = 4'b0001; #10;
        if (segment7 !== 7'b0110000) $display("FAIL: BCD 1 failed");

        // BCD 2 -> 0b1101101 (segments a, b, d, e, g)
        BCD = 4'b0010; #10;
        if (segment7 !== 7'b1101101) $display("FAIL: BCD 2 failed");

        // BCD 3 -> 0b1111001 (segments a, b, c, d, g)
        BCD = 4'b0011; #10;
        if (segment7 !== 7'b1111001) $display("FAIL: BCD 3 failed");

        // BCD 4 -> 0b0110011 (segments b, c, f, g)
        BCD = 4'b0100; #10;
        if (segment7 !== 7'b0110011) $display("FAIL: BCD 4 failed");

        // BCD 5 -> 0b1011011 (segments a, c, d, f, g)
        BCD = 4'b0101; #10;
        if (segment7 !== 7'b1011011) $display("FAIL: BCD 5 failed");

        // BCD 6 -> 0b1011111 (segments a, c, d, e, f, g)
        BCD = 4'b0110; #10;
        if (segment7 !== 7'b1011111) $display("FAIL: BCD 6 failed");

        // BCD 7 -> 0b1110000 (segments a, b, c)
        BCD = 4'b0111; #10;
        if (segment7 !== 7'b1110000) $display("FAIL: BCD 7 failed");

        // BCD 8 -> 0b1111111 (all segments)
        BCD = 4'b1000; #10;
        if (segment7 !== 7'b1111111) $display("FAIL: BCD 8 failed");

        // BCD 9 -> 0b1111011 (segments a, b, c, d, f, g)
        BCD = 4'b1001; #10;
        if (segment7 !== 7'b1111011) $display("FAIL: BCD 9 failed");

        // Invalid BCD 10 -> should not be defined, expect undefined behavior
        BCD = 4'b1010; #10;
        if (segment7 !== 7'bxxxxxxx) $display("FAIL: BCD 10 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule