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
    a = 1; sel = 4'b0000; #10; if (out !== a) $display("FAIL: Expected %b, got %b for sel=%b", a, out, sel);
    b = 1; sel = 4'b0001; #10; if (out !== b) $display("FAIL: Expected %b, got %b for sel=%b", b, out, sel);
    c = 1; sel = 4'b0010; #10; if (out !== c) $display("FAIL: Expected %b, got %b for sel=%b", c, out, sel);
    d = 1; sel = 4'b0011; #10; if (out !== d) $display("FAIL: Expected %b, got %b for sel=%b", d, out, sel);
    e = 1; sel = 4'b0100; #10; if (out !== e) $display("FAIL: Expected %b, got %b for sel=%b", e, out, sel);
    f = 1; sel = 4'b0101; #10; if (out !== f) $display("FAIL: Expected %b, got %b for sel=%b", f, out, sel);
    g = 1; sel = 4'b0110; #10; if (out !== g) $display("FAIL: Expected %b, got %b for sel=%b", g, out, sel);
    h = 1; sel = 4'b0111; #10; if (out !== h) $display("FAIL: Expected %b, got %b for sel=%b", h, out, sel);
    i = 1; sel = 4'b1000; #10; if (out !== i) $display("FAIL: Expected %b, got %b for sel=%b", i, out, sel);
    j = 1; sel = 4'b1001; #10; if (out !== j) $display("FAIL: Expected %b, got %b for sel=%b", j, out, sel);
    k = 1; sel = 4'b1010; #10; if (out !== k) $display("FAIL: Expected %b, got %b for sel=%b", k, out, sel);
    l = 1; sel = 4'b1011; #10; if (out !== l) $display("FAIL: Expected %b, got %b for sel=%b", l, out, sel);
    m = 1; sel = 4'b1100; #10; if (out !== m) $display("FAIL: Expected %b, got %b for sel=%b", m, out, sel);
    n = 1; sel = 4'b1101; #10; if (out !== n) $display("FAIL: Expected %b, got %b for sel=%b", n, out, sel);
    o = 1; sel = 4'b1110; #10; if (out !== o) $display("FAIL: Expected %b, got %b for sel=%b", o, out, sel);
    p = 1; sel = 4'b1111; #10; if (out !== p) $display("FAIL: Expected %b, got %b for sel=%b", p, out, sel);

    $display("PASS");
    $finish;
  end

endmodule