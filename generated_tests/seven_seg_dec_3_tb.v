`timescale 1ns/1ps

module tb_seven_seg_dec;
    reg [3:0] bcd;
    wire SSa, SSb, SSc, SSd, SSe, SSf, SSg;

    // Instantiate the module under test (uut)
    seven_seg_dec uut (
        .SSa(SSa),
        .SSb(SSb),
        .SSc(SSc),
        .SSd(SSd),
        .SSe(SSe),
        .SSf(SSf),
        .SSg(SSg),
        .bcd(bcd)
    );

    initial begin
        // Test all BCD inputs from 0 to 9
        bcd = 4'd0; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b111_1110) $display("FAIL: Test for BCD 0 failed");

        bcd = 4'd1; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b011_0000) $display("FAIL: Test for BCD 1 failed");

        bcd = 4'd2; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b110_1101) $display("FAIL: Test for BCD 2 failed");

        bcd = 4'd3; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b111_1001) $display("FAIL: Test for BCD 3 failed");

        bcd = 4'd4; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b011_0011) $display("FAIL: Test for BCD 4 failed");

        bcd = 4'd5; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b101_1011) $display("FAIL: Test for BCD 5 failed");

        bcd = 4'd6; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b101_1111) $display("FAIL: Test for BCD 6 failed");

        bcd = 4'd7; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b111_0000) $display("FAIL: Test for BCD 7 failed");

        bcd = 4'd8; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b111_1111) $display("FAIL: Test for BCD 8 failed");

        bcd = 4'd9; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b111_1011) $display("FAIL: Test for BCD 9 failed");

        // Test for default case (invalid BCD)
        bcd = 4'd10; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b000_0001) $display("FAIL: Test for invalid BCD 10 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule