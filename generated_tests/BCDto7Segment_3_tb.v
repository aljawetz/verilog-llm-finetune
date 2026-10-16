`timescale 1ns/1ps

module tb_BCDto7Segment;

    reg [3:0] bcd;
    wire [6:0] seg;

    // Instantiate the Unit Under Test (UUT)
    BCDto7Segment uut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        // Test cases
        // Test for BCD 0
        bcd = 4'b0000; #10;
        if (seg !== 7'b1111110) begin
            $display("FAIL: BCD 0 failed");
            $finish;
        end

        // Test for BCD 1
        bcd = 4'b0001; #10;
        if (seg !== 7'b0110000) begin
            $display("FAIL: BCD 1 failed");
            $finish;
        end

        // Test for BCD 2
        bcd = 4'b0010; #10;
        if (seg !== 7'b1101101) begin
            $display("FAIL: BCD 2 failed");
            $finish;
        end

        // Test for BCD 3
        bcd = 4'b0011; #10;
        if (seg !== 7'b1111001) begin
            $display("FAIL: BCD 3 failed");
            $finish;
        end

        // Test for BCD 4
        bcd = 4'b0100; #10;
        if (seg !== 7'b0110011) begin
            $display("FAIL: BCD 4 failed");
            $finish;
        end

        // Test for BCD 5
        bcd = 4'b0101; #10;
        if (seg !== 7'b1011011) begin
            $display("FAIL: BCD 5 failed");
            $finish;
        end

        // Test for BCD 6
        bcd = 4'b0110; #10;
        if (seg !== 7'b1011111) begin
            $display("FAIL: BCD 6 failed");
            $finish;
        end

        // Test for BCD 7
        bcd = 4'b0111; #10;
        if (seg !== 7'b1110000) begin
            $display("FAIL: BCD 7 failed");
            $finish;
        end

        // Test for BCD 8
        bcd = 4'b1000; #10;
        if (seg !== 7'b1111111) begin
            $display("FAIL: BCD 8 failed");
            $finish;
        end

        // Test for BCD 9
        bcd = 4'b1001; #10;
        if (seg !== 7'b1111011) begin
            $display("FAIL: BCD 9 failed");
            $finish;
        end

        // Test for invalid BCD (10)
        bcd = 4'b1010; #10;
        if (seg !== 7'b0000000) begin
            $display("FAIL: Invalid BCD 10 failed");
            $finish;
        end

        // Test for invalid BCD (15)
        bcd = 4'b1111; #10;
        if (seg !== 7'b0000000) begin
            $display("FAIL: Invalid BCD 15 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule