`timescale 1ns/1ps

module tb_mux;

  reg [15:0] a, b, c, d, e, f, g, h, i;
  reg [3:0] sel;
  wire [15:0] out;

  // Instantiate the module under test
  mux #(16) uut (
    .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h), .i(i), .sel(sel), .out(out)
  );

  initial begin
    // Initialize inputs
    a = 16'h0001; b = 16'h0002; c = 16'h0003; d = 16'h0004;
    e = 16'h0005; f = 16'h0006; g = 16'h0007; h = 16'h0008; i = 16'h0009;

    // Test each selection
    sel = 4'd0; #10; if (out !== a) $display("FAIL: Expected %h, got %h for sel=%d", a, out, sel);
    sel = 4'd1; #10; if (out !== b) $display("FAIL: Expected %h, got %h for sel=%d", b, out, sel);
    sel = 4'd2; #10; if (out !== c) $display("FAIL: Expected %h, got %h for sel=%d", c, out, sel);
    sel = 4'd3; #10; if (out !== d) $display("FAIL: Expected %h, got %h for sel=%d", d, out, sel);
    sel = 4'd4; #10; if (out !== e) $display("FAIL: Expected %h, got %h for sel=%d", e, out, sel);
    sel = 4'd5; #10; if (out !== f) $display("FAIL: Expected %h, got %h for sel=%d", f, out, sel);
    sel = 4'd6; #10; if (out !== g) $display("FAIL: Expected %h, got %h for sel=%d", g, out, sel);
    sel = 4'd7; #10; if (out !== h) $display("FAIL: Expected %h, got %h for sel=%d", h, out, sel);
    sel = 4'd8; #10; if (out !== i) $display("FAIL: Expected %h, got %h for sel=%d", i, out, sel);
    
    // Test out-of-range selection
    sel = 4'd9; #10; if (out !== 16'hffff) $display("FAIL: Expected 16'hffff, got %h for sel=%d", out, sel);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule