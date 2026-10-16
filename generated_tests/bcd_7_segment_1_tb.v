`timescale 1ns/1ps

module tb_bcd_7_segment;

reg [3:0] bcd;
wire [6:0] seg;

// Instantiate the module under test (uut)
bcd_7_segment uut (
    .seg(seg),
    .bcd(bcd)
);

initial begin
    // Test cases
    bcd = 4'b0000; #10; // Test 0
    if (seg !== 7'b0111111) begin
        $display("FAIL: Expected 0111111 for BCD 0000, got %b", seg);
        $finish;
    end

    bcd = 4'b0001; #10; // Test 1
    if (seg !== 7'b0000110) begin
        $display("FAIL: Expected 0000110 for BCD 0001, got %b", seg);
        $finish;
    end

    bcd = 4'b0010; #10; // Test 2
    if (seg !== 7'b1011011) begin
        $display("FAIL: Expected 1011011 for BCD 0010, got %b", seg);
        $finish;
    end

    bcd = 4'b0011; #10; // Test 3
    if (seg !== 7'b1001111) begin
        $display("FAIL: Expected 1001111 for BCD 0011, got %b", seg);
        $finish;
    end

    bcd = 4'b0100; #10; // Test 4
    if (seg !== 7'b1100110) begin
        $display("FAIL: Expected 1100110 for BCD 0100, got %b", seg);
        $finish;
    end

    bcd = 4'b0101; #10; // Test 5
    if (seg !== 7'b1101101) begin
        $display("FAIL: Expected 1101101 for BCD 0101, got %b", seg);
        $finish;
    end

    bcd = 4'b0110; #10; // Test 6
    if (seg !== 7'b1111101) begin
        $display("FAIL: Expected 1111101 for BCD 0110, got %b", seg);
        $finish;
    end

    bcd = 4'b0111; #10; // Test 7
    if (seg !== 7'b0000111) begin
        $display("FAIL: Expected 0000111 for BCD 0111, got %b", seg);
        $finish;
    end

    bcd = 4'b1000; #10; // Test 8
    if (seg !== 7'b1111111) begin
        $display("FAIL: Expected 1111111 for BCD 1000, got %b", seg);
        $finish;
    end

    bcd = 4'b1001; #10; // Test 9
    if (seg !== 7'b1101111) begin
        $display("FAIL: Expected 1101111 for BCD 1001, got %b", seg);
        $finish;
    end

    bcd = 4'b1010; #10; // Test invalid BCD
    if (seg !== 7'b0000000) begin
        $display("FAIL: Expected 0000000 for invalid BCD 1010, got %b", seg);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule