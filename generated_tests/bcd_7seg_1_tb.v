`timescale 1ns/1ps

module tb_bcd_7seg;

    reg [3:0] bcd;
    wire [6:0] seg;

    // Instantiate the module under test
    bcd_7seg uut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        // Test valid BCD inputs
        bcd = 4'b0000; #10;
        if (seg !== 7'b0000001) $display("FAIL: Expected 0000001 for BCD 0, got %b", seg);

        bcd = 4'b0001; #10;
        if (seg !== 7'b1001111) $display("FAIL: Expected 1001111 for BCD 1, got %b", seg);

        bcd = 4'b0010; #10;
        if (seg !== 7'b0010010) $display("FAIL: Expected 0010010 for BCD 2, got %b", seg);

        bcd = 4'b0011; #10;
        if (seg !== 7'b0000110) $display("FAIL: Expected 0000110 for BCD 3, got %b", seg);

        bcd = 4'b0100; #10;
        if (seg !== 7'b1001100) $display("FAIL: Expected 1001100 for BCD 4, got %b", seg);

        bcd = 4'b0101; #10;
        if (seg !== 7'b0100100) $display("FAIL: Expected 0100100 for BCD 5, got %b", seg);

        bcd = 4'b0110; #10;
        if (seg !== 7'b0100000) $display("FAIL: Expected 0100000 for BCD 6, got %b", seg);

        bcd = 4'b0111; #10;
        if (seg !== 7'b0001111) $display("FAIL: Expected 0001111 for BCD 7, got %b", seg);

        bcd = 4'b1000; #10;
        if (seg !== 7'b0000000) $display("FAIL: Expected 0000000 for BCD 8, got %b", seg);

        bcd = 4'b1001; #10;
        if (seg !== 7'b0000101) $display("FAIL: Expected 0000101 for BCD 9, got %b", seg);

        // Test invalid BCD inputs
        bcd = 4'b1010; #10;
        if (seg !== 7'b1111111) $display("FAIL: Expected 1111111 for BCD 10, got %b", seg);

        bcd = 4'b1111; #10;
        if (seg !== 7'b1111111) $display("FAIL: Expected 1111111 for BCD 15, got %b", seg);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule