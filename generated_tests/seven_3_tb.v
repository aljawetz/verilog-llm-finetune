`timescale 1ns/1ps

module tb_seven;

    reg a, b, c, d;
    wire [6:0] out;

    // Instantiate the module under test
    seven uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out)
    );

    initial begin
        // Test all combinations of a, b, c, d
        // Expected outputs based on the truth table of a 7-segment display decoder
        
        // Test case 0 (0000)
        a = 0; b = 0; c = 0; d = 0; #10;
        if (out !== 7'b1111110) $display("FAIL: Test case 0 failed, got %b", out);
        
        // Test case 1 (0001)
        a = 0; b = 0; c = 0; d = 1; #10;
        if (out !== 7'b0110000) $display("FAIL: Test case 1 failed, got %b", out);
        
        // Test case 2 (0010)
        a = 0; b = 0; c = 1; d = 0; #10;
        if (out !== 7'b1101101) $display("FAIL: Test case 2 failed, got %b", out);
        
        // Test case 3 (0011)
        a = 0; b = 0; c = 1; d = 1; #10;
        if (out !== 7'b1111001) $display("FAIL: Test case 3 failed, got %b", out);
        
        // Test case 4 (0100)
        a = 0; b = 1; c = 0; d = 0; #10;
        if (out !== 7'b0110011) $display("FAIL: Test case 4 failed, got %b", out);
        
        // Test case 5 (0101)
        a = 0; b = 1; c = 0; d = 1; #10;
        if (out !== 7'b1011011) $display("FAIL: Test case 5 failed, got %b", out);
        
        // Test case 6 (0110)
        a = 0; b = 1; c = 1; d = 0; #10;
        if (out !== 7'b1011111) $display("FAIL: Test case 6 failed, got %b", out);
        
        // Test case 7 (0111)
        a = 0; b = 1; c = 1; d = 1; #10;
        if (out !== 7'b1110010) $display("FAIL: Test case 7 failed, got %b", out);
        
        // Test case 8 (1000)
        a = 1; b = 0; c = 0; d = 0; #10;
        if (out !== 7'b1111110) $display("FAIL: Test case 8 failed, got %b", out);
        
        // Test case 9 (1001)
        a = 1; b = 0; c = 0; d = 1; #10;
        if (out !== 7'b0110000) $display("FAIL: Test case 9 failed, got %b", out);
        
        // Test case 10 (1010)
        a = 1; b = 0; c = 1; d = 0; #10;
        if (out !== 7'b1101101) $display("FAIL: Test case 10 failed, got %b", out);
        
        // Test case 11 (1011)
        a = 1; b = 0; c = 1; d = 1; #10;
        if (out !== 7'b1111001) $display("FAIL: Test case 11 failed, got %b", out);
        
        // Test case 12 (1100)
        a = 1; b = 1; c = 0; d = 0; #10;
        if (out !== 7'b0110011) $display("FAIL: Test case 12 failed, got %b", out);
        
        // Test case 13 (1101)
        a = 1; b = 1; c = 0; d = 1; #10;
        if (out !== 7'b1011011) $display("FAIL: Test case 13 failed, got %b", out);
        
        // Test case 14 (1110)
        a = 1; b = 1; c = 1; d = 0; #10;
        if (out !== 7'b1011111) $display("FAIL: Test case 14 failed, got %b", out);
        
        // Test case 15 (1111)
        a = 1; b = 1; c = 1; d = 1; #10;
        if (out !== 7'b1110010) $display("FAIL: Test case 15 failed, got %b", out);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule