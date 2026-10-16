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
        bcd = 4'b0000; #10; // 0
        if (seg !== 7'b1111110) $display("FAIL: Expected 0 for BCD 0, got %b", seg);
        
        bcd = 4'b0001; #10; // 1
        if (seg !== 7'b0110000) $display("FAIL: Expected 1 for BCD 1, got %b", seg);
        
        bcd = 4'b0010; #10; // 2
        if (seg !== 7'b1101101) $display("FAIL: Expected 2 for BCD 2, got %b", seg);
        
        bcd = 4'b0011; #10; // 3
        if (seg !== 7'b1111001) $display("FAIL: Expected 3 for BCD 3, got %b", seg);
        
        bcd = 4'b0100; #10; // 4
        if (seg !== 7'b0110011) $display("FAIL: Expected 4 for BCD 4, got %b", seg);
        
        bcd = 4'b0101; #10; // 5
        if (seg !== 7'b1011011) $display("FAIL: Expected 5 for BCD 5, got %b", seg);
        
        bcd = 4'b0110; #10; // 6
        if (seg !== 7'b1011111) $display("FAIL: Expected 6 for BCD 6, got %b", seg);
        
        bcd = 4'b0111; #10; // 7
        if (seg !== 7'b1110000) $display("FAIL: Expected 7 for BCD 7, got %b", seg);
        
        bcd = 4'b1000; #10; // 8
        if (seg !== 7'b1111111) $display("FAIL: Expected 8 for BCD 8, got %b", seg);
        
        bcd = 4'b1001; #10; // 9
        if (seg !== 7'b1111011) $display("FAIL: Expected 9 for BCD 9, got %b", seg);
        
        // Test invalid BCD inputs
        bcd = 4'b1010; #10; // 10
        if (seg !== 7'b0000000) $display("FAIL: Expected off for BCD 10, got %b", seg);
        
        bcd = 4'b1111; #10; // 15
        if (seg !== 7'b0000000) $display("FAIL: Expected off for BCD 15, got %b", seg);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule