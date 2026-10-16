`timescale 1ns/1ps

module tb_hexa;
    reg [3:0] bin;
    wire [6:0] hex;
    
    // Instantiate the module under test (uut)
    hexa uut (
        .bin(bin),
        .hex(hex)
    );

    initial begin
        // Test cases
        bin = 4'b0000; #10; 
        if (hex !== 7'b0000001) $display("FAIL: Test case bin=0000 failed, expected 0000001, got %b", hex);
        
        bin = 4'b0001; #10; 
        if (hex !== 7'b1001111) $display("FAIL: Test case bin=0001 failed, expected 1001111, got %b", hex);
        
        bin = 4'b0010; #10; 
        if (hex !== 7'b0010010) $display("FAIL: Test case bin=0010 failed, expected 0010010, got %b", hex);
        
        bin = 4'b0011; #10; 
        if (hex !== 7'b0000110) $display("FAIL: Test case bin=0011 failed, expected 0000110, got %b", hex);
        
        bin = 4'b0100; #10; 
        if (hex !== 7'b1001100) $display("FAIL: Test case bin=0100 failed, expected 1001100, got %b", hex);
        
        bin = 4'b0101; #10; 
        if (hex !== 7'b0100100) $display("FAIL: Test case bin=0101 failed, expected 0100100, got %b", hex);
        
        bin = 4'b0110; #10; 
        if (hex !== 7'b0100000) $display("FAIL: Test case bin=0110 failed, expected 0100000, got %b", hex);
        
        bin = 4'b0111; #10; 
        if (hex !== 7'b0001111) $display("FAIL: Test case bin=0111 failed, expected 0001111, got %b", hex);
        
        bin = 4'b1000; #10; 
        if (hex !== 7'b0000000) $display("FAIL: Test case bin=1000 failed, expected 0000000, got %b", hex);
        
        bin = 4'b1001; #10; 
        if (hex !== 7'b0000100) $display("FAIL: Test case bin=1001 failed, expected 0000100, got %b", hex);
        
        bin = 4'b1010; #10; 
        if (hex !== 7'b0001000) $display("FAIL: Test case bin=1010 failed, expected 0001000, got %b", hex);
        
        bin = 4'b1011; #10; 
        if (hex !== 7'b1100000) $display("FAIL: Test case bin=1011 failed, expected 1100000, got %b", hex);
        
        bin = 4'b1100; #10; 
        if (hex !== 7'b0110001) $display("FAIL: Test case bin=1100 failed, expected 0110001, got %b", hex);
        
        bin = 4'b1101; #10; 
        if (hex !== 7'b1000010) $display("FAIL: Test case bin=1101 failed, expected 1000010, got %b", hex);
        
        bin = 4'b1110; #10; 
        if (hex !== 7'b0110000) $display("FAIL: Test case bin=1110 failed, expected 0110000, got %b", hex);
        
        bin = 4'b1111; #10; 
        if (hex !== 7'b0111000) $display("FAIL: Test case bin=1111 failed, expected 0111000, got %b", hex);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule