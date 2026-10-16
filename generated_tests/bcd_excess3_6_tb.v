`timescale 1ns/1ps

module tb_bcd_excess3;

reg [3:0] b;
wire [3:0] xs3;

// Instantiate the module under test
bcd_excess3 uut (
    .b(b),
    .xs3(xs3)
);

initial begin
    // Test cases
    // Valid BCD inputs
    b = 4'b0000; #10; if (xs3 !== 4'b0011) $display("FAIL: Expected 4'b0011 for BCD 0");
    b = 4'b0001; #10; if (xs3 !== 4'b0100) $display("FAIL: Expected 4'b0100 for BCD 1");
    b = 4'b0010; #10; if (xs3 !== 4'b0101) $display("FAIL: Expected 4'b0101 for BCD 2");
    b = 4'b0011; #10; if (xs3 !== 4'b0110) $display("FAIL: Expected 4'b0110 for BCD 3");
    b = 4'b0100; #10; if (xs3 !== 4'b0111) $display("FAIL: Expected 4'b0111 for BCD 4");
    b = 4'b0101; #10; if (xs3 !== 4'b1000) $display("FAIL: Expected 4'b1000 for BCD 5");
    b = 4'b0110; #10; if (xs3 !== 4'b1001) $display("FAIL: Expected 4'b1001 for BCD 6");
    b = 4'b0111; #10; if (xs3 !== 4'b1010) $display("FAIL: Expected 4'b1010 for BCD 7");
    b = 4'b1000; #10; if (xs3 !== 4'b1011) $display("FAIL: Expected 4'b1011 for BCD 8");
    b = 4'b1001; #10; if (xs3 !== 4'b1100) $display("FAIL: Expected 4'b1100 for BCD 9");

    // Invalid BCD inputs
    b = 4'b1010; #10; if (xs3 !== 4'b0000) $display("FAIL: Expected 4'b0000 for non-BCD 10");
    b = 4'b1111; #10; if (xs3 !== 4'b0000) $display("FAIL: Expected 4'b0000 for non-BCD 15");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule