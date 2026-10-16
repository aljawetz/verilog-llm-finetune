`timescale 1ns/1ps

module tb_bcdtosevensegment;

reg [3:0] bcd;
wire [6:0] segment;

// Instantiate the module under test
bcdtosevensegment uut (
    .bcd(bcd),
    .segment(segment)
);

initial begin
    // Test cases for BCD values 0 to 9
    bcd = 4'd0; #10;
    if (segment !== 7'b1111110) $display("FAIL: BCD 0 expected 1111110, got %b", segment);
    
    bcd = 4'd1; #10;
    if (segment !== 7'b0110000) $display("FAIL: BCD 1 expected 0110000, got %b", segment);
    
    bcd = 4'd2; #10;
    if (segment !== 7'b1101101) $display("FAIL: BCD 2 expected 1101101, got %b", segment);
    
    bcd = 4'd3; #10;
    if (segment !== 7'b1111001) $display("FAIL: BCD 3 expected 1111001, got %b", segment);
    
    bcd = 4'd4; #10;
    if (segment !== 7'b0110011) $display("FAIL: BCD 4 expected 0110011, got %b", segment);
    
    bcd = 4'd5; #10;
    if (segment !== 7'b1011011) $display("FAIL: BCD 5 expected 1011011, got %b", segment);
    
    bcd = 4'd6; #10;
    if (segment !== 7'b1011111) $display("FAIL: BCD 6 expected 1011111, got %b", segment);
    
    bcd = 4'd7; #10;
    if (segment !== 7'b1110000) $display("FAIL: BCD 7 expected 1110000, got %b", segment);
    
    bcd = 4'd8; #10;
    if (segment !== 7'b1111111) $display("FAIL: BCD 8 expected 1111111, got %b", segment);
    
    bcd = 4'd9; #10;
    if (segment !== 7'b1111011) $display("FAIL: BCD 9 expected 1111011, got %b", segment);
    
    // Test case for invalid BCD values (10 to 15)
    bcd = 4'd10; #10;
    if (segment !== 7'b0000000) $display("FAIL: BCD 10 expected 0000000, got %b", segment);
    
    bcd = 4'd15; #10;
    if (segment !== 7'b0000000) $display("FAIL: BCD 15 expected 0000000, got %b", segment);
    
    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule