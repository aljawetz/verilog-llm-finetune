`timescale 1ns/1ps

module tb_sbox6;

reg [1:6] addr;
wire [1:4] dout;

// Instantiate the module under test
sbox6 uut (
    .addr(addr),
    .dout(dout)
);

initial begin
    // Test all possible addresses
    addr = 0; #10;
    if (dout !== 4'b1100) $display("FAIL: addr = 0, dout = %b", dout);
    
    addr = 1; #10;
    if (dout !== 4'b0001) $display("FAIL: addr = 1, dout = %b", dout);
    
    addr = 2; #10;
    if (dout !== 4'b1010) $display("FAIL: addr = 2, dout = %b", dout);
    
    addr = 3; #10;
    if (dout !== 4'b1111) $display("FAIL: addr = 3, dout = %b", dout);
    
    addr = 4; #10;
    if (dout !== 4'b1001) $display("FAIL: addr = 4, dout = %b", dout);
    
    addr = 5; #10;
    if (dout !== 4'b0010) $display("FAIL: addr = 5, dout = %b", dout);
    
    addr = 6; #10;
    if (dout !== 4'b0110) $display("FAIL: addr = 6, dout = %b", dout);
    
    addr = 7; #10;
    if (dout !== 4'b1000) $display("FAIL: addr = 7, dout = %b", dout);
    
    addr = 8; #10;
    if (dout !== 4'b0000) $display("FAIL: addr = 8, dout = %b", dout);
    
    addr = 9; #10;
    if (dout !== 4'b1101) $display("FAIL: addr = 9, dout = %b", dout);
    
    addr = 10; #10;
    if (dout !== 4'b0011) $display("FAIL: addr = 10, dout = %b", dout);
    
    addr = 11; #10;
    if (dout !== 4'b0100) $display("FAIL: addr = 11, dout = %b", dout);
    
    addr = 12; #10;
    if (dout !== 4'b1110) $display("FAIL: addr = 12, dout = %b", dout);
    
    addr = 13; #10;
    if (dout !== 4'b0111) $display("FAIL: addr = 13, dout = %b", dout);
    
    addr = 14; #10;
    if (dout !== 4'b0101) $display("FAIL: addr = 14, dout = %b", dout);
    
    addr = 15; #10;
    if (dout !== 4'b1011) $display("FAIL: addr = 15, dout = %b", dout);
    
    // Continue testing for all addresses up to 63
    addr = 16; #10;
    if (dout !== 4'b1010) $display("FAIL: addr = 16, dout = %b", dout);
    
    addr = 17; #10;
    if (dout !== 4'b1111) $display("FAIL: addr = 17, dout = %b", dout);
    
    addr = 18; #10;
    if (dout !== 4'b0100) $display("FAIL: addr = 18, dout = %b", dout);
    
    addr = 19; #10;
    if (dout !== 4'b0010) $display("FAIL: addr = 19, dout = %b", dout);
    
    addr = 20; #10;
    if (dout !== 4'b0111) $display("FAIL: addr = 20, dout = %b", dout);
    
    addr = 21; #10;
    if (dout !== 4'b1100) $display("FAIL: addr = 21, dout = %b", dout);
    
    addr = 22; #10;
    if (dout !== 4'b1001) $display("FAIL: addr = 22, dout = %b", dout);
    
    addr = 23; #10;
    if (dout !== 4'b0101) $display("FAIL: addr = 23, dout = %b", dout);
    
    addr = 24; #10;
    if (dout !== 4'b0110) $display("FAIL: addr = 24, dout = %b", dout);
    
    addr = 25; #10;
    if (dout !== 4'b0001) $display("FAIL: addr = 25, dout = %b", dout);
    
    addr = 26; #10;
    if (dout !== 4'b1101) $display("FAIL: addr = 26, dout = %b", dout);
    
    addr = 27; #10;
    if (dout !== 4'b1110) $display("FAIL: addr = 27, dout = %b", dout);
    
    addr = 28; #10;
    if (dout !== 4'b0000) $display("FAIL: addr = 28, dout = %b", dout);
    
    addr = 29; #10;
    if (dout !== 4'b1011) $display("FAIL: addr = 29, dout = %b", dout);
    
    addr = 30; #10;
    if (dout !== 4'b0011) $display("FAIL: addr = 30, dout = %b", dout);
    
    addr = 31; #10;
    if (dout !== 4'b1000) $display("FAIL: addr = 31, dout = %b", dout);
    
    addr = 32; #10;
    if (dout !== 4'b1001) $display("FAIL: addr = 32, dout = %b", dout);
    
    addr = 33; #10;
    if (dout !== 4'b1110) $display("FAIL: addr = 33, dout = %b", dout);
    
    addr = 34; #10;
    if (dout !== 4'b1111) $display("FAIL: addr = 34, dout = %b", dout);
    
    addr = 35; #10;
    if (dout !== 4'b0101) $display("FAIL: addr = 35, dout = %b", dout);
    
    addr = 36; #10;
    if (dout !== 4'b0010) $display("FAIL: addr = 36, dout = %b", dout);
    
    addr = 37; #10;
    if (dout !== 4'b1000) $display("FAIL: addr = 37, dout = %b", dout);
    
    addr = 38; #10;
    if (dout !== 4'b1100) $display("FAIL: addr = 38, dout = %b", dout);
    
    addr = 39; #10;
    if (dout !== 4'b0011) $display("FAIL: addr = 39, dout = %b", dout);
    
    addr = 40; #10;
    if (dout !== 4'b0111) $display("FAIL: addr = 40, dout = %b", dout);
    
    addr = 41; #10;
    if (dout !== 4'b0000) $display("FAIL: addr = 41, dout = %b", dout);
    
    addr = 42; #10;
    if (dout !== 4'b0100) $display("FAIL: addr = 42, dout = %b", dout);
    
    addr = 43; #10;
    if (dout !== 4'b1010) $display("FAIL: addr = 43, dout = %b", dout);
    
    addr = 44; #10;
    if (dout !== 4'b0001) $display("FAIL: addr = 44, dout = %b", dout);
    
    addr = 45; #10;
    if (dout !== 4'b1101) $display("FAIL: addr = 45, dout = %b", dout);
    
    addr = 46; #10;
    if (dout !== 4'b1011) $display("FAIL: addr = 46, dout = %b", dout);
    
    addr = 47; #10;
    if (dout !== 4'b0110) $display("FAIL: addr = 47, dout = %b", dout);
    
    addr = 48; #10;
    if (dout !== 4'b0100) $display("FAIL: addr = 48, dout = %b", dout);
    
    addr = 49; #10;
    if (dout !== 4'b0011) $display("FAIL: addr = 49, dout = %b", dout);
    
    addr = 50; #10;
    if (dout !== 4'b0010) $display("FAIL: addr = 50, dout = %b", dout);
    
    addr = 51; #10;
    if (dout !== 4'b1100) $display("FAIL: addr = 51, dout = %b", dout);
    
    addr = 52; #10;
    if (dout !== 4'b1001) $display("FAIL: addr = 52, dout = %b", dout);
    
    addr = 53; #10;
    if (dout !== 4'b0101) $display("FAIL: addr = 53, dout = %b", dout);
    
    addr = 54; #10;
    if (dout !== 4'b1111) $display("FAIL: addr = 54, dout = %b", dout);
    
    addr = 55; #10;
    if (dout !== 4'b1010) $display("FAIL: addr = 55, dout = %b", dout);
    
    addr = 56; #10;
    if (dout !== 4'b1011) $display("FAIL: addr = 56, dout = %b", dout);
    
    addr = 57; #10;
    if (dout !== 4'b1110) $display("FAIL: addr = 57, dout = %b", dout);
    
    addr = 58; #10;
    if (dout !== 4'b0001) $display("FAIL: addr = 58, dout = %b", dout);
    
    addr = 59; #10;
    if (dout !== 4'b0111) $display("FAIL: addr = 59, dout = %b", dout);
    
    addr = 60; #10;
    if (dout !== 4'b0110) $display("FAIL: addr = 60, dout = %b", dout);
    
    addr = 61; #10;
    if (dout !== 4'b0000) $display("FAIL: addr = 61, dout = %b", dout);
    
    addr = 62; #10;
    if (dout !== 4'b1000) $display("FAIL: addr = 62, dout = %b", dout);
    
    addr = 63; #10;
    if (dout !== 4'b1101) $display("FAIL: addr = 63, dout = %b", dout);
    
    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule