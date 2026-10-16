`timescale 1ns/1ps

module tb_BCDto7Segment;

    reg [3:0] bcd;
    wire [6:0] seg;

    // Instantiate the module under test (uut)
    BCDto7Segment uut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        // Test valid BCD inputs
        bcd = 4'b0000; #10; // Expect 0
        if (seg !== 7'b1111110) $display("FAIL: Expected 0, got %b", seg);

        bcd = 4'b0001; #10; // Expect 1
        if (seg !== 7'b0110000) $display("FAIL: Expected 1, got %b", seg);

        bcd = 4'b0010; #10; // Expect 2
        if (seg !== 7'b1101101) $display("FAIL: Expected 2, got %b", seg);

        bcd = 4'b0011; #10; // Expect 3
        if (seg !== 7'b1111001) $display("FAIL: Expected 3, got %b", seg);

        bcd = 4'b0100; #10; // Expect 4
        if (seg !== 7'b0110011) $display("FAIL: Expected 4, got %b", seg);

        bcd = 4'b0101; #10; // Expect 5
        if (seg !== 7'b1011011) $display("FAIL: Expected 5, got %b", seg);

        bcd = 4'b0110; #10; // Expect 6
        if (seg !== 7'b1011111) $display("FAIL: Expected 6, got %b", seg);

        bcd = 4'b0111; #10; // Expect 7
        if (seg !== 7'b1110000) $display("FAIL: Expected 7, got %b", seg);

        bcd = 4'b1000; #10; // Expect 8
        if (seg !== 7'b1111111) $display("FAIL: Expected 8, got %b", seg);

        bcd = 4'b1001; #10; // Expect 9
        if (seg !== 7'b1111011) $display("FAIL: Expected 9, got %b", seg);

        // Test invalid BCD inputs
        bcd = 4'b1010; #10; // Expect all segments off
        if (seg !== 7'b0000000) $display("FAIL: Expected all off for input 10, got %b", seg);

        bcd = 4'b1111; #10; // Expect all segments off
        if (seg !== 7'b0000000) $display("FAIL: Expected all off for input 15, got %b", seg);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule