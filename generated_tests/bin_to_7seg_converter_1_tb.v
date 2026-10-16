`timescale 1ns/1ps

module tb_bin_to_7seg_converter;

    reg [3:0] bin;
    wire [6:0] HEX;

    // Instantiate the module under test (uut)
    bin_to_7seg_converter uut (
        .bin(bin),
        .HEX(HEX)
    );

    initial begin
        // Test all binary inputs from 0 to 15
        bin = 4'b0000; #10; // Test 0
        if (HEX !== 7'b1000000) $display("FAIL: Expected 0 for bin=0, got HEX=%b", HEX);
        
        bin = 4'b0001; #10; // Test 1
        if (HEX !== 7'b1111001) $display("FAIL: Expected 1 for bin=1, got HEX=%b", HEX);
        
        bin = 4'b0010; #10; // Test 2
        if (HEX !== 7'b0100100) $display("FAIL: Expected 2 for bin=2, got HEX=%b", HEX);
        
        bin = 4'b0011; #10; // Test 3
        if (HEX !== 7'b0110000) $display("FAIL: Expected 3 for bin=3, got HEX=%b", HEX);
        
        bin = 4'b0100; #10; // Test 4
        if (HEX !== 7'b0011001) $display("FAIL: Expected 4 for bin=4, got HEX=%b", HEX);
        
        bin = 4'b0101; #10; // Test 5
        if (HEX !== 7'b0010010) $display("FAIL: Expected 5 for bin=5, got HEX=%b", HEX);
        
        bin = 4'b0110; #10; // Test 6
        if (HEX !== 7'b0000010) $display("FAIL: Expected 6 for bin=6, got HEX=%b", HEX);
        
        bin = 4'b0111; #10; // Test 7
        if (HEX !== 7'b1111000) $display("FAIL: Expected 7 for bin=7, got HEX=%b", HEX);
        
        bin = 4'b1000; #10; // Test 8
        if (HEX !== 7'b0000000) $display("FAIL: Expected 8 for bin=8, got HEX=%b", HEX);
        
        bin = 4'b1001; #10; // Test 9
        if (HEX !== 7'b0010000) $display("FAIL: Expected 9 for bin=9, got HEX=%b", HEX);
        
        bin = 4'b1010; #10; // Test A
        if (HEX !== 7'b0001000) $display("FAIL: Expected A for bin=A, got HEX=%b", HEX);
        
        bin = 4'b1011; #10; // Test B
        if (HEX !== 7'b0000011) $display("FAIL: Expected B for bin=B, got HEX=%b", HEX);
        
        bin = 4'b1100; #10; // Test C
        if (HEX !== 7'b1000110) $display("FAIL: Expected C for bin=C, got HEX=%b", HEX);
        
        bin = 4'b1101; #10; // Test D
        if (HEX !== 7'b0100001) $display("FAIL: Expected D for bin=D, got HEX=%b", HEX);
        
        bin = 4'b1110; #10; // Test E
        if (HEX !== 7'b0000110) $display("FAIL: Expected E for bin=E, got HEX=%b", HEX);
        
        bin = 4'b1111; #10; // Test F
        if (HEX !== 7'b0001110) $display("FAIL: Expected F for bin=F, got HEX=%b", HEX);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule