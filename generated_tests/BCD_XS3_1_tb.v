`timescale 1ns/1ps

module tb_BCD_XS3;

  reg a, b, c, d;
  wire w, x, y, z;

  // Instantiate the module under test (uut)
  BCD_XS3 uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .w(w),
    .x(x),
    .y(y),
    .z(z)
  );

  initial begin
    // Test all BCD inputs from 0 to 9
    // Expected Excess-3 outputs are given in comments
    // BCD:  0000 (0) -> XS3:  0011 (3)
    a = 0; b = 0; c = 0; d = 0; #10;
    if ({w, x, y, z} !== 4'b0011) $display("FAIL: BCD 0 failed");

    // BCD:  0001 (1) -> XS3:  0100 (4)
    a = 0; b = 0; c = 0; d = 1; #10;
    if ({w, x, y, z} !== 4'b0100) $display("FAIL: BCD 1 failed");

    // BCD:  0010 (2) -> XS3:  0101 (5)
    a = 0; b = 0; c = 1; d = 0; #10;
    if ({w, x, y, z} !== 4'b0101) $display("FAIL: BCD 2 failed");

    // BCD:  0011 (3) -> XS3:  0110 (6)
    a = 0; b = 0; c = 1; d = 1; #10;
    if ({w, x, y, z} !== 4'b0110) $display("FAIL: BCD 3 failed");

    // BCD:  0100 (4) -> XS3:  0111 (7)
    a = 0; b = 1; c = 0; d = 0; #10;
    if ({w, x, y, z} !== 4'b0111) $display("FAIL: BCD 4 failed");

    // BCD:  0101 (5) -> XS3:  1000 (8)
    a = 0; b = 1; c = 0; d = 1; #10;
    if ({w, x, y, z} !== 4'b1000) $display("FAIL: BCD 5 failed");

    // BCD:  0110 (6) -> XS3:  1001 (9)
    a = 0; b = 1; c = 1; d = 0; #10;
    if ({w, x, y, z} !== 4'b1001) $display("FAIL: BCD 6 failed");

    // BCD:  0111 (7) -> XS3:  1010 (A)
    a = 0; b = 1; c = 1; d = 1; #10;
    if ({w, x, y, z} !== 4'b1010) $display("FAIL: BCD 7 failed");

    // BCD:  1000 (8) -> XS3:  1011 (B)
    a = 1; b = 0; c = 0; d = 0; #10;
    if ({w, x, y, z} !== 4'b1011) $display("FAIL: BCD 8 failed");

    // BCD:  1001 (9) -> XS3:  1100 (C)
    a = 1; b = 0; c = 0; d = 1; #10;
    if ({w, x, y, z} !== 4'b1100) $display("FAIL: BCD 9 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule