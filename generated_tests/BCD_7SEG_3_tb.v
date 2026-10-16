`timescale 1ns/1ps

module tb_BCD_7SEG;
    reg [3:0] bcd;
    wire [7:0] seg;
    
    // Instantiate the module under test
    BCD_7SEG uut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        // Test all BCD values from 0 to 9
        bcd = 4'b0000; #10;
        if (seg !== 8'b11000000) $display("FAIL: BCD 0 failed");
        
        bcd = 4'b0001; #10;
        if (seg !== 8'b11111001) $display("FAIL: BCD 1 failed");
        
        bcd = 4'b0010; #10;
        if (seg !== 8'b10100100) $display("FAIL: BCD 2 failed");
        
        bcd = 4'b0011; #10;
        if (seg !== 8'b10110000) $display("FAIL: BCD 3 failed");
        
        bcd = 4'b0100; #10;
        if (seg !== 8'b10011001) $display("FAIL: BCD 4 failed");
        
        bcd = 4'b0101; #10;
        if (seg !== 8'b10010010) $display("FAIL: BCD 5 failed");
        
        bcd = 4'b0110; #10;
        if (seg !== 8'b10000010) $display("FAIL: BCD 6 failed");
        
        bcd = 4'b0111; #10;
        if (seg !== 8'b11111000) $display("FAIL: BCD 7 failed");
        
        bcd = 4'b1000; #10;
        if (seg !== 8'b10000000) $display("FAIL: BCD 8 failed");
        
        bcd = 4'b1001; #10;
        if (seg !== 8'b10010000) $display("FAIL: BCD 9 failed");
        
        // Test an invalid BCD value
        bcd = 4'b1010; #10;
        if (seg !== 8'b11111111) $display("FAIL: BCD 10 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule