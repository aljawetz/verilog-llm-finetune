`timescale 1ns/1ps

module tb_Gray_to_bin_bh;

    reg [3:0] gray;
    wire [3:0] bin;

    // Instantiate the module under test (uut)
    Gray_to_bin_bh uut (
        .gray(gray),
        .bin(bin)
    );

    initial begin
        // Test cases
        gray = 4'b0000; #10; 
        if (bin !== 4'b0000) $display("FAIL: Expected 0000 for gray 0000, got %b", bin);
        
        gray = 4'b0001; #10; 
        if (bin !== 4'b0001) $display("FAIL: Expected 0001 for gray 0001, got %b", bin);
        
        gray = 4'b0010; #10; 
        if (bin !== 4'b0011) $display("FAIL: Expected 0011 for gray 0010, got %b", bin);
        
        gray = 4'b0011; #10; 
        if (bin !== 4'b0010) $display("FAIL: Expected 0010 for gray 0011, got %b", bin);
        
        gray = 4'b0100; #10; 
        if (bin !== 4'b0111) $display("FAIL: Expected 0111 for gray 0100, got %b", bin);
        
        gray = 4'b0101; #10; 
        if (bin !== 4'b0110) $display("FAIL: Expected 0110 for gray 0101, got %b", bin);
        
        gray = 4'b0110; #10; 
        if (bin !== 4'b0100) $display("FAIL: Expected 0100 for gray 0110, got %b", bin);
        
        gray = 4'b0111; #10; 
        if (bin !== 4'b0101) $display("FAIL: Expected 0101 for gray 0111, got %b", bin);
        
        gray = 4'b1000; #10; 
        if (bin !== 4'b1111) $display("FAIL: Expected 1111 for gray 1000, got %b", bin);
        
        gray = 4'b1001; #10; 
        if (bin !== 4'b1110) $display("FAIL: Expected 1110 for gray 1001, got %b", bin);
        
        gray = 4'b1010; #10; 
        if (bin !== 4'b1100) $display("FAIL: Expected 1100 for gray 1010, got %b", bin);
        
        gray = 4'b1011; #10; 
        if (bin !== 4'b1101) $display("FAIL: Expected 1101 for gray 1011, got %b", bin);
        
        gray = 4'b1100; #10; 
        if (bin !== 4'b1000) $display("FAIL: Expected 1000 for gray 1100, got %b", bin);
        
        gray = 4'b1101; #10; 
        if (bin !== 4'b1001) $display("FAIL: Expected 1001 for gray 1101, got %b", bin);
        
        gray = 4'b1110; #10; 
        if (bin !== 4'b1011) $display("FAIL: Expected 1011 for gray 1110, got %b", bin);
        
        gray = 4'b1111; #10; 
        if (bin !== 4'b1010) $display("FAIL: Expected 1010 for gray 1111, got %b", bin);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule