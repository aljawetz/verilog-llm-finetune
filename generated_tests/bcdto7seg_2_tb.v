`timescale 1ns/1ps

module tb_bcdto7seg;
    reg [3:0] bcd;
    wire [6:0] seg;

    // Instantiate the module under test
    bcdto7seg uut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        // Test cases for BCD to 7-segment display
        bcd = 4'b0000; #10; // BCD 0
        if (seg !== 7'b1111110) begin
            $display("FAIL: Expected 7'b1111110 for BCD 0, got %b", seg);
            $finish;
        end

        bcd = 4'b0001; #10; // BCD 1
        if (seg !== 7'b0110000) begin
            $display("FAIL: Expected 7'b0110000 for BCD 1, got %b", seg);
            $finish;
        end

        bcd = 4'b0010; #10; // BCD 2
        if (seg !== 7'b1101101) begin
            $display("FAIL: Expected 7'b1101101 for BCD 2, got %b", seg);
            $finish;
        end

        bcd = 4'b0011; #10; // BCD 3
        if (seg !== 7'b1111001) begin
            $display("FAIL: Expected 7'b1111001 for BCD 3, got %b", seg);
            $finish;
        end

        bcd = 4'b0100; #10; // BCD 4
        if (seg !== 7'b0110011) begin
            $display("FAIL: Expected 7'b0110011 for BCD 4, got %b", seg);
            $finish;
        end

        bcd = 4'b0101; #10; // BCD 5
        if (seg !== 7'b1011011) begin
            $display("FAIL: Expected 7'b1011011 for BCD 5, got %b", seg);
            $finish;
        end

        bcd = 4'b0110; #10; // BCD 6
        if (seg !== 7'b1011111) begin
            $display("FAIL: Expected 7'b1011111 for BCD 6, got %b", seg);
            $finish;
        end

        bcd = 4'b0111; #10; // BCD 7
        if (seg !== 7'b1110000) begin
            $display("FAIL: Expected 7'b1110000 for BCD 7, got %b", seg);
            $finish;
        end

        bcd = 4'b1000; #10; // BCD 8
        if (seg !== 7'b1111111) begin
            $display("FAIL: Expected 7'b1111111 for BCD 8, got %b", seg);
            $finish;
        end

        bcd = 4'b1001; #10; // BCD 9
        if (seg !== 7'b1111011) begin
            $display("FAIL: Expected 7'b1111011 for BCD 9, got %b", seg);
            $finish;
        end

        bcd = 4'b1010; #10; // Invalid BCD 10
        if (seg !== 7'b0000000) begin
            $display("FAIL: Expected 7'b0000000 for invalid BCD 10, got %b", seg);
            $finish;
        end

        bcd = 4'b1111; #10; // Invalid BCD 15
        if (seg !== 7'b0000000) begin
            $display("FAIL: Expected 7'b0000000 for invalid BCD 15, got %b", seg);
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule