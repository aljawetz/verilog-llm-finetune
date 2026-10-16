`timescale 1ns/1ps

module tb_mux_3_1;

  reg a, b, c;
  reg [1:0] sel;
  wire out;

  // Instantiate the module under test (uut)
  mux_3_1 uut (
    .a(a),
    .b(b),
    .c(c),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Initialize inputs
    a = 0; b = 0; c = 0; sel = 2'b00;

    // Test case 1: sel = 00, expect out = a
    a = 1; b = 0; c = 0; sel = 2'b00;
    #10;
    if (out !== a) $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", a, out);

    // Test case 2: sel = 01, expect out = b
    a = 0; b = 1; c = 0; sel = 2'b01;
    #10;
    if (out !== b) $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", b, out);

    // Test case 3: sel = 10, expect out = c
    a = 0; b = 0; c = 1; sel = 2'b10;
    #10;
    if (out !== c) $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", c, out);

    // Test case 4: sel = 11, expect out = a (default case)
    a = 1; b = 0; c = 0; sel = 2'b11;
    #10;
    if (out !== a) $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", a, out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule