`timescale 1ns/1ps

module tb_BDC_to_7Segment;

    reg [3:0] bcd;
    wire [6:0] segment;

    // Instantiate the module under test (uut)
    BDC_to_7Segment uut (
        .bcd(bcd),
        .segment(segment)
    );

    initial begin
        // Test cases for BCD inputs
        // Expected outputs are in comments
        bcd = 4'b0000; #10; // 0 -> 1111110
        if (segment !== 7'b1111110) $display("FAIL: Expected 1111110 for BCD 0, got %b", segment);
        
        bcd = 4'b0001; #10; // 1 -> 0110000
        if (segment !== 7'b0110000) $display("FAIL: Expected 0110000 for BCD 1, got %b", segment);
        
        bcd = 4'b0010; #10; // 2 -> 1101101
        if (segment !== 7'b1101101) $display("FAIL: Expected 1101101 for BCD 2, got %b", segment);
        
        bcd = 4'b0011; #10; // 3 -> 1111001
        if (segment !== 7'b1111001) $display("FAIL: Expected 1111001 for BCD 3, got %b", segment);
        
        bcd = 4'b0100; #10; // 4 -> 0110011
        if (segment !== 7'b0110011) $display("FAIL: Expected 0110011 for BCD 4, got %b", segment);
        
        bcd = 4'b0101; #10; // 5 -> 1011011
        if (segment !== 7'b1011011) $display("FAIL: Expected 1011011 for BCD 5, got %b", segment);
        
        bcd = 4'b0110; #10; // 6 -> 1011111
        if (segment !== 7'b1011111) $display("FAIL: Expected 1011111 for BCD 6, got %b", segment);
        
        bcd = 4'b0111; #10; // 7 -> 1110000
        if (segment !== 7'b1110000) $display("FAIL: Expected 1110000 for BCD 7, got %b", segment);
        
        bcd = 4'b1000; #10; // 8 -> 1111111
        if (segment !== 7'b1111111) $display("FAIL: Expected 1111111 for BCD 8, got %b", segment);
        
        bcd = 4'b1001; #10; // 9 -> 1111011
        if (segment !== 7'b1111011) $display("FAIL: Expected 1111011 for BCD 9, got %b", segment);
        
        bcd = 4'b1010; #10; // default case -> 0000000
        if (segment !== 7'b0000000) $display("FAIL: Expected 0000000 for BCD 10, got %b", segment);
        
        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule