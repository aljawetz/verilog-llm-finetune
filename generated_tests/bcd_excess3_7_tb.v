`timescale 1ns/1ps

module tb_bcd_excess3;

reg [3:0] a;
wire [3:0] y;

// Instantiate the module under test (uut)
bcd_excess3 uut (
    .a(a),
    .y(y)
);

initial begin
    // Test all BCD inputs from 0 to 9
    a = 4'b0000; #10; // BCD 0
    if (y !== 4'b0000) $display("FAIL: BCD 0 -> Excess-3 expected 0000, got %b", y);
    
    a = 4'b0001; #10; // BCD 1
    if (y !== 4'b0001) $display("FAIL: BCD 1 -> Excess-3 expected 0001, got %b", y);
    
    a = 4'b0010; #10; // BCD 2
    if (y !== 4'b0010) $display("FAIL: BCD 2 -> Excess-3 expected 0010, got %b", y);
    
    a = 4'b0011; #10; // BCD 3
    if (y !== 4'b0011) $display("FAIL: BCD 3 -> Excess-3 expected 0011, got %b", y);
    
    a = 4'b0100; #10; // BCD 4
    if (y !== 4'b0100) $display("FAIL: BCD 4 -> Excess-3 expected 0100, got %b", y);
    
    a = 4'b0101; #10; // BCD 5
    if (y !== 4'b0101) $display("FAIL: BCD 5 -> Excess-3 expected 0101, got %b", y);
    
    a = 4'b0110; #10; // BCD 6
    if (y !== 4'b0110) $display("FAIL: BCD 6 -> Excess-3 expected 0110, got %b", y);
    
    a = 4'b0111; #10; // BCD 7
    if (y !== 4'b0111) $display("FAIL: BCD 7 -> Excess-3 expected 0111, got %b", y);
    
    a = 4'b1000; #10; // BCD 8
    if (y !== 4'b1000) $display("FAIL: BCD 8 -> Excess-3 expected 1000, got %b", y);
    
    a = 4'b1001; #10; // BCD 9
    if (y !== 4'b1001) $display("FAIL: BCD 9 -> Excess-3 expected 1001, got %b", y);
    
    // End of tests
    $display("PASS");
    $finish;
end

endmodule