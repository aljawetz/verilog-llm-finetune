`timescale 1ns/1ps

module tb_bcd_7seg;

  reg [3:0] bcd;
  wire [6:0] seg_7;

  // Instantiate the module under test (uut)
  bcd_7seg uut (
    .bcd(bcd),
    .seg_7(seg_7)
  );

  initial begin
    // Test cases for BCD inputs 0 to 9
    bcd = 4'b0000; #10; if (seg_7 !== 7'b1111110) $display("FAIL: Expected 7'b1111110 for BCD 0");
    bcd = 4'b0001; #10; if (seg_7 !== 7'b0110000) $display("FAIL: Expected 7'b0110000 for BCD 1");
    bcd = 4'b0010; #10; if (seg_7 !== 7'b1101101) $display("FAIL: Expected 7'b1101101 for BCD 2");
    bcd = 4'b0011; #10; if (seg_7 !== 7'b1111001) $display("FAIL: Expected 7'b1111001 for BCD 3");
    bcd = 4'b0100; #10; if (seg_7 !== 7'b0110011) $display("FAIL: Expected 7'b0110011 for BCD 4");
    bcd = 4'b0101; #10; if (seg_7 !== 7'b1011011) $display("FAIL: Expected 7'b1011011 for BCD 5");
    bcd = 4'b0110; #10; if (seg_7 !== 7'b1011111) $display("FAIL: Expected 7'b1011111 for BCD 6");
    bcd = 4'b0111; #10; if (seg_7 !== 7'b1110000) $display("FAIL: Expected 7'b1110000 for BCD 7");
    bcd = 4'b1000; #10; if (seg_7 !== 7'b1111111) $display("FAIL: Expected 7'b1111111 for BCD 8");
    bcd = 4'b1001; #10; if (seg_7 !== 7'b1111011) $display("FAIL: Expected 7'b1111011 for BCD 9");

    // Test cases for undefined BCD inputs
    bcd = 4'b1010; #10; if (seg_7 !== 7'b0000000) $display("FAIL: Expected 7'b0000000 for BCD 10");
    bcd = 4'b1111; #10; if (seg_7 !== 7'b0000000) $display("FAIL: Expected 7'b0000000 for BCD 15");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule