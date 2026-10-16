`timescale 1ns/1ps

module tb_BCD_to_7seg;

  reg A, B, C, D;
  wire a, b, c, d, e, f, g;

  // Instantiate the module under test (uut)
  BCD_to_7seg uut (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g)
  );

  initial begin
    // Test all BCD values from 0 to 9
    // BCD 0: 0000 -> 1111110
    A = 0; B = 0; C = 0; D = 0; #10;
    if ({a, b, c, d, e, f, g} !== 7'b1111110) $display("FAIL: BCD 0 output incorrect");

    // BCD 1: 0001 -> 0110000
    A = 0; B = 0; C = 0; D = 1; #10;
    if ({a, b, c, d, e, f, g} !== 7'b0110000) $display("FAIL: BCD 1 output incorrect");

    // BCD 2: 0010 -> 1101101
    A = 0; B = 0; C = 1; D = 0; #10;
    if ({a, b, c, d, e, f, g} !== 7'b1101101) $display("FAIL: BCD 2 output incorrect");

    // BCD 3: 0011 -> 1111001
    A = 0; B = 0; C = 1; D = 1; #10;
    if ({a, b, c, d, e, f, g} !== 7'b1111001) $display("FAIL: BCD 3 output incorrect");

    // BCD 4: 0100 -> 0110011
    A = 0; B = 1; C = 0; D = 0; #10;
    if ({a, b, c, d, e, f, g} !== 7'b0110011) $display("FAIL: BCD 4 output incorrect");

    // BCD 5: 0101 -> 1011011
    A = 0; B = 1; C = 0; D = 1; #10;
    if ({a, b, c, d, e, f, g} !== 7'b1011011) $display("FAIL: BCD 5 output incorrect");

    // BCD 6: 0110 -> 1011111
    A = 0; B = 1; C = 1; D = 0; #10;
    if ({a, b, c, d, e, f, g} !== 7'b1011111) $display("FAIL: BCD 6 output incorrect");

    // BCD 7: 0111 -> 1110000
    A = 0; B = 1; C = 1; D = 1; #10;
    if ({a, b, c, d, e, f, g} !== 7'b1110000) $display("FAIL: BCD 7 output incorrect");

    // BCD 8: 1000 -> 1111111
    A = 1; B = 0; C = 0; D = 0; #10;
    if ({a, b, c, d, e, f, g} !== 7'b1111111) $display("FAIL: BCD 8 output incorrect");

    // BCD 9: 1001 -> 1111011
    A = 1; B = 0; C = 0; D = 1; #10;
    if ({a, b, c, d, e, f, g} !== 7'b1111011) $display("FAIL: BCD 9 output incorrect");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule