`timescale 1ns/1ps

module tb_segment7;

    reg [3:0] bcd;
    wire [6:0] seg;

    // Instantiate the module under test
    segment7 uut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        // Test cases for BCD inputs 0 to 9
        bcd = 4'b0000; #10; // BCD 0
        if (seg !== 7'b1111110) $display("FAIL: BCD 0 failed");
        
        bcd = 4'b0001; #10; // BCD 1
        if (seg !== 7'b0110000) $display("FAIL: BCD 1 failed");
        
        bcd = 4'b0010; #10; // BCD 2
        if (seg !== 7'b1101101) $display("FAIL: BCD 2 failed");
        
        bcd = 4'b0011; #10; // BCD 3
        if (seg !== 7'b1111001) $display("FAIL: BCD 3 failed");
        
        bcd = 4'b0100; #10; // BCD 4
        if (seg !== 7'b0110011) $display("FAIL: BCD 4 failed");
        
        bcd = 4'b0101; #10; // BCD 5
        if (seg !== 7'b1011011) $display("FAIL: BCD 5 failed");
        
        bcd = 4'b0110; #10; // BCD 6
        if (seg !== 7'b1011111) $display("FAIL: BCD 6 failed");
        
        bcd = 4'b0111; #10; // BCD 7
        if (seg !== 7'b1110000) $display("FAIL: BCD 7 failed");
        
        bcd = 4'b1000; #10; // BCD 8
        if (seg !== 7'b1111111) $display("FAIL: BCD 8 failed");
        
        bcd = 4'b1001; #10; // BCD 9
        if (seg !== 7'b1111011) $display("FAIL: BCD 9 failed");
        
        // Test case for invalid BCD input (10)
        bcd = 4'b1010; #10; // BCD 10
        if (seg !== 7'b0000000) $display("FAIL: BCD 10 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule