`timescale 1ns/1ps

module tb_Binary_to_Excess3;

    reg [3:0] B_IN;
    wire [3:0] EX_OUT;
    
    // Instantiate the module under test (uut)
    Binary_to_Excess3 uut (
        .B_IN(B_IN),
        .EX_OUT(EX_OUT)
    );

    initial begin
        // Test cases
        // Test case 1: B_IN = 0
        B_IN = 4'b0000; #10;
        if (EX_OUT !== 4'b0011) $display("FAIL: Expected 0011 for B_IN = 0000, got %b", EX_OUT);
        
        // Test case 2: B_IN = 1
        B_IN = 4'b0001; #10;
        if (EX_OUT !== 4'b0100) $display("FAIL: Expected 0100 for B_IN = 0001, got %b", EX_OUT);
        
        // Test case 3: B_IN = 2
        B_IN = 4'b0010; #10;
        if (EX_OUT !== 4'b0101) $display("FAIL: Expected 0101 for B_IN = 0010, got %b", EX_OUT);
        
        // Test case 4: B_IN = 3
        B_IN = 4'b0011; #10;
        if (EX_OUT !== 4'b0110) $display("FAIL: Expected 0110 for B_IN = 0011, got %b", EX_OUT);
        
        // Test case 5: B_IN = 4
        B_IN = 4'b0100; #10;
        if (EX_OUT !== 4'b0111) $display("FAIL: Expected 0111 for B_IN = 0100, got %b", EX_OUT);
        
        // Test case 6: B_IN = 5
        B_IN = 4'b0101; #10;
        if (EX_OUT !== 4'b1000) $display("FAIL: Expected 1000 for B_IN = 0101, got %b", EX_OUT);
        
        // Test case 7: B_IN = 6
        B_IN = 4'b0110; #10;
        if (EX_OUT !== 4'b1001) $display("FAIL: Expected 1001 for B_IN = 0110, got %b", EX_OUT);
        
        // Test case 8: B_IN = 7
        B_IN = 4'b0111; #10;
        if (EX_OUT !== 4'b1010) $display("FAIL: Expected 1010 for B_IN = 0111, got %b", EX_OUT);
        
        // Test case 9: B_IN = 8
        B_IN = 4'b1000; #10;
        if (EX_OUT !== 4'b1011) $display("FAIL: Expected 1011 for B_IN = 1000, got %b", EX_OUT);
        
        // Test case 10: B_IN = 9
        B_IN = 4'b1001; #10;
        if (EX_OUT !== 4'b1100) $display("FAIL: Expected 1100 for B_IN = 1001, got %b", EX_OUT);
        
        // Test case 11: B_IN = 10
        B_IN = 4'b1010; #10;
        if (EX_OUT !== 4'b1101) $display("FAIL: Expected 1101 for B_IN = 1010, got %b", EX_OUT);
        
        // Test case 12: B_IN = 11
        B_IN = 4'b1011; #10;
        if (EX_OUT !== 4'b1110) $display("FAIL: Expected 1110 for B_IN = 1011, got %b", EX_OUT);
        
        // Test case 13: B_IN = 12
        B_IN = 4'b1100; #10;
        if (EX_OUT !== 4'bxxxx) $display("FAIL: Expected xxxx for B_IN = 1100, got %b", EX_OUT);
        
        // Test case 14: B_IN = 13
        B_IN = 4'b1101; #10;
        if (EX_OUT !== 4'bxxxx) $display("FAIL: Expected xxxx for B_IN = 1101, got %b", EX_OUT);
        
        // Test case 15: B_IN = 14
        B_IN = 4'b1110; #10;
        if (EX_OUT !== 4'bxxxx) $display("FAIL: Expected xxxx for B_IN = 1110, got %b", EX_OUT);
        
        // Test case 16: B_IN = 15
        B_IN = 4'b1111; #10;
        if (EX_OUT !== 4'bxxxx) $display("FAIL: Expected xxxx for B_IN = 1111, got %b", EX_OUT);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule