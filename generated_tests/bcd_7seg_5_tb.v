`timescale 1ns/1ps

module tb_bcd_7seg;
  reg [3:0] bcd;
  wire [6:0] seg_7;
  
  // Instantiate the Unit Under Test (UUT)
  bcd_7seg uut (
    .bcd(bcd),
    .seg_7(seg_7)
  );

  initial begin
    // Test cases for BCD inputs 0 to 9
    bcd = 4'b0000; #10; if (seg_7 !== 7'b1111110) $display("FAIL: Test case bcd=0 failed");
    bcd = 4'b0001; #10; if (seg_7 !== 7'b0110000) $display("FAIL: Test case bcd=1 failed");
    bcd = 4'b0010; #10; if (seg_7 !== 7'b1101101) $display("FAIL: Test case bcd=2 failed");
    bcd = 4'b0011; #10; if (seg_7 !== 7'b1111001) $display("FAIL: Test case bcd=3 failed");
    bcd = 4'b0100; #10; if (seg_7 !== 7'b0110011) $display("FAIL: Test case bcd=4 failed");
    bcd = 4'b0101; #10; if (seg_7 !== 7'b1011011) $display("FAIL: Test case bcd=5 failed");
    bcd = 4'b0110; #10; if (seg_7 !== 7'b1011111) $display("FAIL: Test case bcd=6 failed");
    bcd = 4'b0111; #10; if (seg_7 !== 7'b1110000) $display("FAIL: Test case bcd=7 failed");
    bcd = 4'b1000; #10; if (seg_7 !== 7'b1111111) $display("FAIL: Test case bcd=8 failed");
    bcd = 4'b1001; #10; if (seg_7 !== 7'b1111011) $display("FAIL: Test case bcd=9 failed");

    // Test cases for undefined BCD inputs
    bcd = 4'b1010; #10; if (seg_7 !== 7'b0000000) $display("FAIL: Test case bcd=10 failed");
    bcd = 4'b1111; #10; if (seg_7 !== 7'b0000000) $display("FAIL: Test case bcd=15 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule