`timescale 1ns/1ps

module tb_bcd_excess3;

  reg [3:0] b;
  wire [3:0] xs3;

  // Instantiate the module under test (uut)
  bcd_excess3 uut (
    .b(b),
    .xs3(xs3)
  );

  initial begin
    // Test cases for valid BCD inputs
    b = 4'b0000; #10; if (xs3 !== 4'b0011) $display("FAIL: Expected 0011 for BCD 0000");
    b = 4'b0001; #10; if (xs3 !== 4'b0100) $display("FAIL: Expected 0100 for BCD 0001");
    b = 4'b0010; #10; if (xs3 !== 4'b0101) $display("FAIL: Expected 0101 for BCD 0010");
    b = 4'b0011; #10; if (xs3 !== 4'b0110) $display("FAIL: Expected 0110 for BCD 0011");
    b = 4'b0100; #10; if (xs3 !== 4'b0111) $display("FAIL: Expected 0111 for BCD 0100");
    b = 4'b0101; #10; if (xs3 !== 4'b1000) $display("FAIL: Expected 1000 for BCD 0101");
    b = 4'b0110; #10; if (xs3 !== 4'b1001) $display("FAIL: Expected 1001 for BCD 0110");
    b = 4'b0111; #10; if (xs3 !== 4'b1010) $display("FAIL: Expected 1010 for BCD 0111");
    b = 4'b1000; #10; if (xs3 !== 4'b1011) $display("FAIL: Expected 1011 for BCD 1000");
    b = 4'b1001; #10; if (xs3 !== 4'b1100) $display("FAIL: Expected 1100 for BCD 1001");

    // Test cases for non-BCD inputs
    b = 4'b1010; #10; if (xs3 !== 4'b0000) $display("FAIL: Expected 0000 for non-BCD 1010");
    b = 4'b1111; #10; if (xs3 !== 4'b0000) $display("FAIL: Expected 0000 for non-BCD 1111");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule