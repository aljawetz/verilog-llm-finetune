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
        // Test cases
        bcd = 4'd0; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b111_1110) begin
            $display("FAIL: Test case for BCD 0 failed");
            $finish;
        end

        bcd = 4'd1; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b011_0000) begin
            $display("FAIL: Test case for BCD 1 failed");
            $finish;
        end

        bcd = 4'd2; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b110_1101) begin
            $display("FAIL: Test case for BCD 2 failed");
            $finish;
        end

        bcd = 4'd3; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b111_1001) begin
            $display("FAIL: Test case for BCD 3 failed");
            $finish;
        end

        bcd = 4'd4; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b011_0011) begin
            $display("FAIL: Test case for BCD 4 failed");
            $finish;
        end

        bcd = 4'd5; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b101_1011) begin
            $display("FAIL: Test case for BCD 5 failed");
            $finish;
        end

        bcd = 4'd6; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b101_1111) begin
            $display("FAIL: Test case for BCD 6 failed");
            $finish;
        end

        bcd = 4'd7; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b111_0000) begin
            $display("FAIL: Test case for BCD 7 failed");
            $finish;
        end

        bcd = 4'd8; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b111_1111) begin
            $display("FAIL: Test case for BCD 8 failed");
            $finish;
        end

        bcd = 4'd9; #10;
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b111_1011) begin
            $display("FAIL: Test case for BCD 9 failed");
            $finish;
        end

        bcd = 4'd10; #10; // Test default case
        if ({SSa, SSb, SSc, SSd, SSe, SSf, SSg} !== 7'b000_0001) begin
            $display("FAIL: Test case for BCD 10 (default) failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule