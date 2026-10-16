`timescale 1ns/1ps

module tb_mux_16to1;

  reg a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
  reg [3:0] sel;
  wire out;

  // Instantiate the module under test (uut)
  mux_16to1 uut (
    .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h),
    .i(i), .j(j), .k(k), .l(l), .m(m), .n(n), .o(o), .p(p),
    .sel(sel), .out(out)
  );

  initial begin
    // Initialize inputs
    a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
    i = 0; j = 0; k = 0; l = 0; m = 0; n = 0; o = 0; p = 0;
    sel = 4'b0000;

    // Test all inputs
    a = 1; sel = 4'b0000; #10; if (out !== a) $display("FAIL: Output mismatch for sel=0000");
    b = 1; sel = 4'b0001; #10; if (out !== b) $display("FAIL: Output mismatch for sel=0001");
    c = 1; sel = 4'b0010; #10; if (out !== c) $display("FAIL: Output mismatch for sel=0010");
    d = 1; sel = 4'b0011; #10; if (out !== d) $display("FAIL: Output mismatch for sel=0011");
    e = 1; sel = 4'b0100; #10; if (out !== e) $display("FAIL: Output mismatch for sel=0100");
    f = 1; sel = 4'b0101; #10; if (out !== f) $display("FAIL: Output mismatch for sel=0101");
    g = 1; sel = 4'b0110; #10; if (out !== g) $display("FAIL: Output mismatch for sel=0110");
    h = 1; sel = 4'b0111; #10; if (out !== h) $display("FAIL: Output mismatch for sel=0111");
    i = 1; sel = 4'b1000; #10; if (out !== i) $display("FAIL: Output mismatch for sel=1000");
    j = 1; sel = 4'b1001; #10; if (out !== j) $display("FAIL: Output mismatch for sel=1001");
    k = 1; sel = 4'b1010; #10; if (out !== k) $display("FAIL: Output mismatch for sel=1010");
    l = 1; sel = 4'b1011; #10; if (out !== l) $display("FAIL: Output mismatch for sel=1011");
    m = 1; sel = 4'b1100; #10; if (out !== m) $display("FAIL: Output mismatch for sel=1100");
    n = 1; sel = 4'b1101; #10; if (out !== n) $display("FAIL: Output mismatch for sel=1101");
    o = 1; sel = 4'b1110; #10; if (out !== o) $display("FAIL: Output mismatch for sel=1110");
    p = 1; sel = 4'b1111; #10; if (out !== p) $display("FAIL: Output mismatch for sel=1111");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule