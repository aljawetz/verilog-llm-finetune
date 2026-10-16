`timescale 1ns/1ps

module tb_BCD_7SEG_BH;

reg [3:0] bcd;
wire [6:0] seg;

// Instantiate the module under test (uut)
BCD_7SEG_BH uut (
    .bcd(bcd),
    .seg(seg)
);

initial begin
    // Test cases
    bcd = 4'b0000; #10; // Test BCD 0
    if (seg !== 7'b0000001) begin
        $display("FAIL: Expected seg=0000001 for bcd=0000, got seg=%b", seg);
        $finish;
    end

    bcd = 4'b0001; #10; // Test BCD 1
    if (seg !== 7'b1001111) begin
        $display("FAIL: Expected seg=1001111 for bcd=0001, got seg=%b", seg);
        $finish;
    end

    bcd = 4'b0010; #10; // Test BCD 2
    if (seg !== 7'b0010010) begin
        $display("FAIL: Expected seg=0010010 for bcd=0010, got seg=%b", seg);
        $finish;
    end

    bcd = 4'b0011; #10; // Test BCD 3
    if (seg !== 7'b0000110) begin
        $display("FAIL: Expected seg=0000110 for bcd=0011, got seg=%b", seg);
        $finish;
    end

    bcd = 4'b0100; #10; // Test BCD 4
    if (seg !== 7'b1001100) begin
        $display("FAIL: Expected seg=1001100 for bcd=0100, got seg=%b", seg);
        $finish;
    end

    bcd = 4'b0101; #10; // Test BCD 5
    if (seg !== 7'b0100100) begin
        $display("FAIL: Expected seg=0100100 for bcd=0101, got seg=%b", seg);
        $finish;
    end

    bcd = 4'b0110; #10; // Test BCD 6
    if (seg !== 7'b0100000) begin
        $display("FAIL: Expected seg=0100000 for bcd=0110, got seg=%b", seg);
        $finish;
    end

    bcd = 4'b0111; #10; // Test BCD 7
    if (seg !== 7'b0001111) begin
        $display("FAIL: Expected seg=0001111 for bcd=0111, got seg=%b", seg);
        $finish;
    end

    bcd = 4'b1000; #10; // Test invalid BCD 8
    if (seg !== 7'b0000000) begin
        $display("FAIL: Expected seg=0000000 for bcd=1000, got seg=%b", seg);
        $finish;
    end

    bcd = 4'b1001; #10; // Test invalid BCD 9
    if (seg !== 7'b0000000) begin
        $display("FAIL: Expected seg=0000000 for bcd=1001, got seg=%b", seg);
        $finish;
    end

    bcd = 4'b1010; #10; // Test invalid BCD 10
    if (seg !== 7'b0000000) begin
        $display("FAIL: Expected seg=0000000 for bcd=1010, got seg=%b", seg);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule