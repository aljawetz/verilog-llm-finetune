`timescale 1ns/1ps

module tb_bcd2seg;

  reg [3:0] bcd;
  wire [6:0] seg_7;

  // Instantiate the module under test (uut)
  bcd2seg uut (
    .bcd(bcd),
    .seg_7(seg_7)
  );

  initial begin
    // Test cases for BCD to 7-segment display
    // BCD 0 -> 0b1111110
    bcd = 4'b0000; #10;
    if (seg_7 !== 7'b1111110) $display("FAIL: BCD 0 failed");

    // BCD 1 -> 0b0110000
    bcd = 4'b0001; #10;
    if (seg_7 !== 7'b0110000) $display("FAIL: BCD 1 failed");

    // BCD 2 -> 0b1101101
    bcd = 4'b0010; #10;
    if (seg_7 !== 7'b1101101) $display("FAIL: BCD 2 failed");

    // BCD 3 -> 0b1111001
    bcd = 4'b0011; #10;
    if (seg_7 !== 7'b1111001) $display("FAIL: BCD 3 failed");

    // BCD 4 -> 0b0110011
    bcd = 4'b0100; #10;
    if (seg_7 !== 7'b0110011) $display("FAIL: BCD 4 failed");

    // BCD 5 -> 0b1011011
    bcd = 4'b0101; #10;
    if (seg_7 !== 7'b1011011) $display("FAIL: BCD 5 failed");

    // BCD 6 -> 0b1011111
    bcd = 4'b0110; #10;
    if (seg_7 !== 7'b1011111) $display("FAIL: BCD 6 failed");

    // BCD 7 -> 0b1110000
    bcd = 4'b0111; #10;
    if (seg_7 !== 7'b1110000) $display("FAIL: BCD 7 failed");

    // BCD 8 -> 0b1111111
    bcd = 4'b1000; #10;
    if (seg_7 !== 7'b1111111) $display("FAIL: BCD 8 failed");

    // BCD 9 -> 0b1111011
    bcd = 4'b1001; #10;
    if (seg_7 !== 7'b1111011) $display("FAIL: BCD 9 failed");

    // End of test
    $display("PASS");
    $finish;
  end

endmodule