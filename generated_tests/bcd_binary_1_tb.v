`timescale 1ns/1ps

module tb_bcd_binary;

reg [7:0] bcd;
wire [4:0] binary;

// Instantiate the module under test
bcd_binary uut (
    .bcd(bcd),
    .binary(binary)
);

initial begin
    // Test cases for BCD to binary conversion
    // Test for BCD 0 to 19
    bcd = 8'b00000000; #10;
    if (binary !== 5'd0) $display("FAIL: Expected 0 for BCD 0, got %d", binary);
    
    bcd = 8'b00000001; #10;
    if (binary !== 5'd1) $display("FAIL: Expected 1 for BCD 1, got %d", binary);
    
    bcd = 8'b00000010; #10;
    if (binary !== 5'd2) $display("FAIL: Expected 2 for BCD 2, got %d", binary);
    
    bcd = 8'b00000011; #10;
    if (binary !== 5'd3) $display("FAIL: Expected 3 for BCD 3, got %d", binary);
    
    bcd = 8'b00000100; #10;
    if (binary !== 5'd4) $display("FAIL: Expected 4 for BCD 4, got %d", binary);
    
    bcd = 8'b00000101; #10;
    if (binary !== 5'd5) $display("FAIL: Expected 5 for BCD 5, got %d", binary);
    
    bcd = 8'b00000110; #10;
    if (binary !== 5'd6) $display("FAIL: Expected 6 for BCD 6, got %d", binary);
    
    bcd = 8'b00000111; #10;
    if (binary !== 5'd7) $display("FAIL: Expected 7 for BCD 7, got %d", binary);
    
    bcd = 8'b00001000; #10;
    if (binary !== 5'd8) $display("FAIL: Expected 8 for BCD 8, got %d", binary);
    
    bcd = 8'b00001001; #10;
    if (binary !== 5'd9) $display("FAIL: Expected 9 for BCD 9, got %d", binary);
    
    bcd = 8'b00010000; #10;
    if (binary !== 5'd10) $display("FAIL: Expected 10 for BCD 10, got %d", binary);
    
    bcd = 8'b00010001; #10;
    if (binary !== 5'd11) $display("FAIL: Expected 11 for BCD 11, got %d", binary);
    
    bcd = 8'b00010010; #10;
    if (binary !== 5'd12) $display("FAIL: Expected 12 for BCD 12, got %d", binary);
    
    bcd = 8'b00010011; #10;
    if (binary !== 5'd13) $display("FAIL: Expected 13 for BCD 13, got %d", binary);
    
    bcd = 8'b00010100; #10;
    if (binary !== 5'd14) $display("FAIL: Expected 14 for BCD 14, got %d", binary);
    
    bcd = 8'b00010101; #10;
    if (binary !== 5'd15) $display("FAIL: Expected 15 for BCD 15, got %d", binary);
    
    bcd = 8'b00010110; #10;
    if (binary !== 5'd16) $display("FAIL: Expected 16 for BCD 16, got %d", binary);
    
    bcd = 8'b00010111; #10;
    if (binary !== 5'd17) $display("FAIL: Expected 17 for BCD 17, got %d", binary);
    
    bcd = 8'b00011000; #10;
    if (binary !== 5'd18) $display("FAIL: Expected 18 for BCD 18, got %d", binary);
    
    bcd = 8'b00011001; #10;
    if (binary !== 5'd19) $display("FAIL: Expected 19 for BCD 19, got %d", binary);
    
    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule