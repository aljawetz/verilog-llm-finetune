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
    // Test cases for BCD to Excess-3 conversion
    // Expected outputs are based on the BCD to Excess-3 conversion rules
    a = 4'b0000; #10; // 0 -> 3
    if (y !== 4'b0011) $display("FAIL: Test case a=0000 failed, got %b", y);

    a = 4'b0001; #10; // 1 -> 4
    if (y !== 4'b0100) $display("FAIL: Test case a=0001 failed, got %b", y);

    a = 4'b0010; #10; // 2 -> 5
    if (y !== 4'b0101) $display("FAIL: Test case a=0010 failed, got %b", y);

    a = 4'b0011; #10; // 3 -> 6
    if (y !== 4'b0110) $display("FAIL: Test case a=0011 failed, got %b", y);

    a = 4'b0100; #10; // 4 -> 7
    if (y !== 4'b0111) $display("FAIL: Test case a=0100 failed, got %b", y);

    a = 4'b0101; #10; // 5 -> 8
    if (y !== 4'b1000) $display("FAIL: Test case a=0101 failed, got %b", y);

    a = 4'b0110; #10; // 6 -> 9
    if (y !== 4'b1001) $display("FAIL: Test case a=0110 failed, got %b", y);

    a = 4'b0111; #10; // 7 -> 10 (not valid BCD)
    if (y !== 4'b1010) $display("FAIL: Test case a=0111 failed, got %b", y);

    a = 4'b1000; #10; // 8 -> 11 (not valid BCD)
    if (y !== 4'b1011) $display("FAIL: Test case a=1000 failed, got %b", y);

    a = 4'b1001; #10; // 9 -> 12 (not valid BCD)
    if (y !== 4'b1100) $display("FAIL: Test case a=1001 failed, got %b", y);

    // Test invalid BCD inputs
    a = 4'b1010; #10; // 10 (not valid BCD)
    if (y !== 4'b1101) $display("FAIL: Test case a=1010 failed, got %b", y);

    a = 4'b1111; #10; // 15 (not valid BCD)
    if (y !== 4'b1110) $display("FAIL: Test case a=1111 failed, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule