`timescale 1ns/1ps

module tb_bcd_7seg;

reg [3:0] b;
wire [7:0] seg;

// Instantiate the module under test
bcd_7seg uut (
    .b(b),
    .seg(seg)
);

initial begin
    // Test all BCD values from 0 to 9
    b = 4'b0000; // Test for 0
    #10;
    if (seg !== 8'b1111110) $display("FAIL: Expected 0 for input 0, got %b", seg);

    b = 4'b0001; // Test for 1
    #10;
    if (seg !== 8'b0110000) $display("FAIL: Expected 1 for input 1, got %b", seg);

    b = 4'b0010; // Test for 2
    #10;
    if (seg !== 8'b1101101) $display("FAIL: Expected 2 for input 2, got %b", seg);

    b = 4'b0011; // Test for 3
    #10;
    if (seg !== 8'b1111001) $display("FAIL: Expected 3 for input 3, got %b", seg);

    b = 4'b0100; // Test for 4
    #10;
    if (seg !== 8'b0110011) $display("FAIL: Expected 4 for input 4, got %b", seg);

    b = 4'b0101; // Test for 5
    #10;
    if (seg !== 8'b1011011) $display("FAIL: Expected 5 for input 5, got %b", seg);

    b = 4'b0110; // Test for 6
    #10;
    if (seg !== 8'b1011111) $display("FAIL: Expected 6 for input 6, got %b", seg);

    b = 4'b0111; // Test for 7
    #10;
    if (seg !== 8'b1110000) $display("FAIL: Expected 7 for input 7, got %b", seg);

    b = 4'b1000; // Test for 8
    #10;
    if (seg !== 8'b1111111) $display("FAIL: Expected 8 for input 8, got %b", seg);

    b = 4'b1001; // Test for 9
    #10;
    if (seg !== 8'b1110011) $display("FAIL: Expected 9 for input 9, got %b", seg);

    // Test for invalid BCD input (10)
    b = 4'b1010; // Test for invalid input
    #10;
    if (seg !== 8'b0000000) $display("FAIL: Expected 0 for invalid input 10, got %b", seg);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule