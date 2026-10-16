`timescale 1ns/1ps

module tb_gray_to_binary_bh;

reg [3:0] gray;
wire [3:0] bin;

// Instantiate the module under test (uut)
gray_to_binary_bh uut (
    .gray(gray),
    .bin(bin)
);

initial begin
    // Test cases
    gray = 4'b0000; #10; 
    if (bin !== 4'b0000) $display("FAIL: gray=0000, expected bin=0000, got bin=%b", bin);
    
    gray = 4'b0001; #10; 
    if (bin !== 4'b0001) $display("FAIL: gray=0001, expected bin=0001, got bin=%b", bin);
    
    gray = 4'b0010; #10; 
    if (bin !== 4'b0011) $display("FAIL: gray=0010, expected bin=0011, got bin=%b", bin);
    
    gray = 4'b0011; #10; 
    if (bin !== 4'b0010) $display("FAIL: gray=0011, expected bin=0010, got bin=%b", bin);
    
    gray = 4'b0100; #10; 
    if (bin !== 4'b0111) $display("FAIL: gray=0100, expected bin=0111, got bin=%b", bin);
    
    gray = 4'b0101; #10; 
    if (bin !== 4'b0110) $display("FAIL: gray=0101, expected bin=0110, got bin=%b", bin);
    
    gray = 4'b0110; #10; 
    if (bin !== 4'b0100) $display("FAIL: gray=0110, expected bin=0100, got bin=%b", bin);
    
    gray = 4'b0111; #10; 
    if (bin !== 4'b0101) $display("FAIL: gray=0111, expected bin=0101, got bin=%b", bin);
    
    gray = 4'b1000; #10; 
    if (bin !== 4'b1111) $display("FAIL: gray=1000, expected bin=1111, got bin=%b", bin);
    
    gray = 4'b1001; #10; 
    if (bin !== 4'b1110) $display("FAIL: gray=1001, expected bin=1110, got bin=%b", bin);
    
    gray = 4'b1010; #10; 
    if (bin !== 4'b1100) $display("FAIL: gray=1010, expected bin=1100, got bin=%b", bin);
    
    gray = 4'b1011; #10; 
    if (bin !== 4'b1101) $display("FAIL: gray=1011, expected bin=1101, got bin=%b", bin);
    
    gray = 4'b1100; #10; 
    if (bin !== 4'b1000) $display("FAIL: gray=1100, expected bin=1000, got bin=%b", bin);
    
    gray = 4'b1101; #10; 
    if (bin !== 4'b1001) $display("FAIL: gray=1101, expected bin=1001, got bin=%b", bin);
    
    gray = 4'b1110; #10; 
    if (bin !== 4'b1011) $display("FAIL: gray=1110, expected bin=1011, got bin=%b", bin);
    
    gray = 4'b1111; #10; 
    if (bin !== 4'b1010) $display("FAIL: gray=1111, expected bin=1010, got bin=%b", bin);
    
    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule