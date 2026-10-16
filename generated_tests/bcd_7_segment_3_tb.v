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
    // Test valid BCD inputs
    bcd = 4'b0000; #10; // 0
    if (seg !== 7'b0111111) begin
        $display("FAIL: Expected 0 for BCD 0000, got %b", seg);
        $finish;
    end

    bcd = 4'b0001; #10; // 1
    if (seg !== 7'b0000110) begin
        $display("FAIL: Expected 1 for BCD 0001, got %b", seg);
        $finish;
    end

    bcd = 4'b0010; #10; // 2
    if (seg !== 7'b1011011) begin
        $display("FAIL: Expected 2 for BCD 0010, got %b", seg);
        $finish;
    end

    bcd = 4'b0011; #10; // 3
    if (seg !== 7'b1001111) begin
        $display("FAIL: Expected 3 for BCD 0011, got %b", seg);
        $finish;
    end

    bcd = 4'b0100; #10; // 4
    if (seg !== 7'b1100110) begin
        $display("FAIL: Expected 4 for BCD 0100, got %b", seg);
        $finish;
    end

    bcd = 4'b0101; #10; // 5
    if (seg !== 7'b1101101) begin
        $display("FAIL: Expected 5 for BCD 0101, got %b", seg);
        $finish;
    end

    bcd = 4'b0110; #10; // 6
    if (seg !== 7'b1111101) begin
        $display("FAIL: Expected 6 for BCD 0110, got %b", seg);
        $finish;
    end

    bcd = 4'b0111; #10; // 7
    if (seg !== 7'b0000111) begin
        $display("FAIL: Expected 7 for BCD 0111, got %b", seg);
        $finish;
    end

    bcd = 4'b1000; #10; // 8
    if (seg !== 7'b1111111) begin
        $display("FAIL: Expected 8 for BCD 1000, got %b", seg);
        $finish;
    end

    bcd = 4'b1001; #10; // 9
    if (seg !== 7'b1101111) begin
        $display("FAIL: Expected 9 for BCD 1001, got %b", seg);
        $finish;
    end

    // Test invalid BCD inputs
    bcd = 4'b1010; #10; // A
    if (seg !== 7'b0000000) begin
        $display("FAIL: Expected blank for BCD 1010, got %b", seg);
        $finish;
    end

    bcd = 4'b1111; #10; // F
    if (seg !== 7'b0000000) begin
        $display("FAIL: Expected blank for BCD 1111, got %b", seg);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule