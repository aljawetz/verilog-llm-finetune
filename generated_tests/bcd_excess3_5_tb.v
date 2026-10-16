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
    // BCD: 0000 (0) -> Excess-3: 0011 (3)
    a = 4'b0000; #10;
    if (y !== 4'b0011) $display("FAIL: Test case 0 failed, got %b, expected 0011", y);

    // BCD: 0001 (1) -> Excess-3: 0100 (4)
    a = 4'b0001; #10;
    if (y !== 4'b0100) $display("FAIL: Test case 1 failed, got %b, expected 0100", y);

    // BCD: 0010 (2) -> Excess-3: 0101 (5)
    a = 4'b0010; #10;
    if (y !== 4'b0101) $display("FAIL: Test case 2 failed, got %b, expected 0101", y);

    // BCD: 0011 (3) -> Excess-3: 0110 (6)
    a = 4'b0011; #10;
    if (y !== 4'b0110) $display("FAIL: Test case 3 failed, got %b, expected 0110", y);

    // BCD: 0100 (4) -> Excess-3: 0111 (7)
    a = 4'b0100; #10;
    if (y !== 4'b0111) $display("FAIL: Test case 4 failed, got %b, expected 0111", y);

    // BCD: 0101 (5) -> Excess-3: 1000 (8)
    a = 4'b0101; #10;
    if (y !== 4'b1000) $display("FAIL: Test case 5 failed, got %b, expected 1000", y);

    // BCD: 0110 (6) -> Excess-3: 1001 (9)
    a = 4'b0110; #10;
    if (y !== 4'b1001) $display("FAIL: Test case 6 failed, got %b, expected 1001", y);

    // BCD: 0111 (7) -> Excess-3: 1010 (10)
    a = 4'b0111; #10;
    if (y !== 4'b1010) $display("FAIL: Test case 7 failed, got %b, expected 1010", y);

    // BCD: 1000 (8) -> Excess-3: 1011 (11)
    a = 4'b1000; #10;
    if (y !== 4'b1011) $display("FAIL: Test case 8 failed, got %b, expected 1011", y);

    // BCD: 1001 (9) -> Excess-3: 1100 (12)
    a = 4'b1001; #10;
    if (y !== 4'b1100) $display("FAIL: Test case 9 failed, got %b, expected 1100", y);

    // BCD: 1010 (10) -> Excess-3: 1110 (14) (invalid BCD)
    a = 4'b1010; #10;
    if (y !== 4'b1110) $display("FAIL: Test case 10 failed, got %b, expected 1110", y);

    // BCD: 1111 (15) -> Excess-3: 1111 (15) (invalid BCD)
    a = 4'b1111; #10;
    if (y !== 4'b1111) $display("FAIL: Test case 11 failed, got %b, expected 1111", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule