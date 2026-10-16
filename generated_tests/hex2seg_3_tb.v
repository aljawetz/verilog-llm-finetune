`timescale 1ns/1ps

module tb_hex2seg;

    reg [3:0] hex;
    wire [7:0] seg;

    // Instantiate the module under test (uut)
    hex2seg uut (
        .hex(hex),
        .seg(seg)
    );

    initial begin
        // Test all hexadecimal values from 0 to F
        hex = 4'h0; #10;
        if (seg !== 8'b11000000) $display("FAIL: Test for hex 0 failed, got %b", seg);
        
        hex = 4'h1; #10;
        if (seg !== 8'b11111001) $display("FAIL: Test for hex 1 failed, got %b", seg);
        
        hex = 4'h2; #10;
        if (seg !== 8'b10100101) $display("FAIL: Test for hex 2 failed, got %b", seg);
        
        hex = 4'h3; #10;
        if (seg !== 8'b10110001) $display("FAIL: Test for hex 3 failed, got %b", seg);
        
        hex = 4'h4; #10;
        if (seg !== 8'b10011001) $display("FAIL: Test for hex 4 failed, got %b", seg);
        
        hex = 4'h5; #10;
        if (seg !== 8'b10010111) $display("FAIL: Test for hex 5 failed, got %b", seg);
        
        hex = 4'h6; #10;
        if (seg !== 8'b10000011) $display("FAIL: Test for hex 6 failed, got %b", seg);
        
        hex = 4'h7; #10;
        if (seg !== 8'b11111001) $display("FAIL: Test for hex 7 failed, got %b", seg);
        
        hex = 4'h8; #10;
        if (seg !== 8'b00000000) $display("FAIL: Test for hex 8 failed, got %b", seg);
        
        hex = 4'h9; #10;
        if (seg !== 8'b10010000) $display("FAIL: Test for hex 9 failed, got %b", seg);
        
        hex = 4'hA; #10;
        if (seg !== 8'b10001111) $display("FAIL: Test for hex A failed, got %b", seg);
        
        hex = 4'hB; #10;
        if (seg !== 8'b10000011) $display("FAIL: Test for hex B failed, got %b", seg);
        
        hex = 4'hC; #10;
        if (seg !== 8'b11000111) $display("FAIL: Test for hex C failed, got %b", seg);
        
        hex = 4'hD; #10;
        if (seg !== 8'b10111001) $display("FAIL: Test for hex D failed, got %b", seg);
        
        hex = 4'hE; #10;
        if (seg !== 8'b10000111) $display("FAIL: Test for hex E failed, got %b", seg);
        
        hex = 4'hF; #10;
        if (seg !== 8'b10010001) $display("FAIL: Test for hex F failed, got %b", seg);
        
        $display("PASS");
        $finish;
    end

endmodule