`timescale 1ns/1ps

module tb_themux;

  reg a, b, c, d, e, f, g, h;
  reg [2:0] sel;
  wire out;

  // Instantiate the module under test
  themux uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g),
    .h(h),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Initialize inputs
    a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
    sel = 3'b000;

    // Test all selections
    a = 1; sel = 3'b000; #10; if (out !== a) $display("FAIL: Output mismatch for sel=000");
    b = 1; sel = 3'b001; #10; if (out !== b) $display("FAIL: Output mismatch for sel=001");
    c = 1; sel = 3'b010; #10; if (out !== c) $display("FAIL: Output mismatch for sel=010");
    d = 1; sel = 3'b011; #10; if (out !== d) $display("FAIL: Output mismatch for sel=011");
    e = 1; sel = 3'b100; #10; if (out !== e) $display("FAIL: Output mismatch for sel=100");
    f = 1; sel = 3'b101; #10; if (out !== f) $display("FAIL: Output mismatch for sel=101");
    g = 1; sel = 3'b110; #10; if (out !== g) $display("FAIL: Output mismatch for sel=110");
    h = 1; sel = 3'b111; #10; if (out !== h) $display("FAIL: Output mismatch for sel=111");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule