`timescale 1ns/1ps

module tb_bcd2excess3;

reg [3:0] bcd;
wire [3:0] excess3;

// Instantiate the module under test
bcd2excess3 uut (
    .bcd(bcd),
    .excess3(excess3)
);

initial begin
    // Test valid BCD inputs
    bcd = 4'b0000; #10; 
    if (excess3 !== 4'b0011) $display("FAIL: Expected 0011 for BCD 0000, got %b", excess3);
    
    bcd = 4'b0001; #10; 
    if (excess3 !== 4'b0100) $display("FAIL: Expected 0100 for BCD 0001, got %b", excess3);
    
    bcd = 4'b0010; #10; 
    if (excess3 !== 4'b0101) $display("FAIL: Expected 0101 for BCD 0010, got %b", excess3);
    
    bcd = 4'b0011; #10; 
    if (excess3 !== 4'b0110) $display("FAIL: Expected 0110 for BCD 0011, got %b", excess3);
    
    bcd = 4'b0100; #10; 
    if (excess3 !== 4'b0111) $display("FAIL: Expected 0111 for BCD 0100, got %b", excess3);
    
    bcd = 4'b0101; #10; 
    if (excess3 !== 4'b1000) $display("FAIL: Expected 1000 for BCD 0101, got %b", excess3);
    
    bcd = 4'b0110; #10; 
    if (excess3 !== 4'b1001) $display("FAIL: Expected 1001 for BCD 0110, got %b", excess3);
    
    bcd = 4'b0111; #10; 
    if (excess3 !== 4'b1010) $display("FAIL: Expected 1010 for BCD 0111, got %b", excess3);
    
    bcd = 4'b1000; #10; 
    if (excess3 !== 4'b1011) $display("FAIL: Expected 1011 for BCD 1000, got %b", excess3);
    
    bcd = 4'b1001; #10; 
    if (excess3 !== 4'b1100) $display("FAIL: Expected 1100 for BCD 1001, got %b", excess3);
    
    // Test invalid BCD inputs
    bcd = 4'b1010; #10; 
    if (excess3 !== 4'bxxxx) $display("FAIL: Expected xxxx for BCD 1010, got %b", excess3);
    
    bcd = 4'b1111; #10; 
    if (excess3 !== 4'bxxxx) $display("FAIL: Expected xxxx for BCD 1111, got %b", excess3);
    
    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule