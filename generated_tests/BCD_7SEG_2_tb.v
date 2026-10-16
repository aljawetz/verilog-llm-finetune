`timescale 1ns/1ps

module tb_BCD_7SEG;
    reg [3:0] bcd;
    wire [7:0] seg;

    // Instantiate the module under test (uut)
    BCD_7SEG uut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        // Test cases for BCD inputs 0 to 9
        bcd = 4'b0000; #10; // BCD 0
        if (seg !== 8'b11000000) $display("FAIL: Expected 11000000 for BCD 0, got %b", seg);
        
        bcd = 4'b0001; #10; // BCD 1
        if (seg !== 8'b11111001) $display("FAIL: Expected 11111001 for BCD 1, got %b", seg);
        
        bcd = 4'b0010; #10; // BCD 2
        if (seg !== 8'b10100100) $display("FAIL: Expected 10100100 for BCD 2, got %b", seg);
        
        bcd = 4'b0011; #10; // BCD 3
        if (seg !== 8'b10110000) $display("FAIL: Expected 10110000 for BCD 3, got %b", seg);
        
        bcd = 4'b0100; #10; // BCD 4
        if (seg !== 8'b10011001) $display("FAIL: Expected 10011001 for BCD 4, got %b", seg);
        
        bcd = 4'b0101; #10; // BCD 5
        if (seg !== 8'b10010010) $display("FAIL: Expected 10010010 for BCD 5, got %b", seg);
        
        bcd = 4'b0110; #10; // BCD 6
        if (seg !== 8'b10000010) $display("FAIL: Expected 10000010 for BCD 6, got %b", seg);
        
        bcd = 4'b0111; #10; // BCD 7
        if (seg !== 8'b11111000) $display("FAIL: Expected 11111000 for BCD 7, got %b", seg);
        
        bcd = 4'b1000; #10; // BCD 8
        if (seg !== 8'b10000000) $display("FAIL: Expected 10000000 for BCD 8, got %b", seg);
        
        bcd = 4'b1001; #10; // BCD 9
        if (seg !== 8'b10010000) $display("FAIL: Expected 10010000 for BCD 9, got %b", seg);
        
        // Test case for invalid BCD input (10)
        bcd = 4'b1010; #10; // Invalid BCD
        if (seg !== 8'b11111111) $display("FAIL: Expected 11111111 for invalid BCD 10, got %b", seg);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule