`timescale 1ns/1ps

module tb_mux_2x1;

  reg [1:0] in;
  reg sel;
  wire out;

  // Instantiate the module under test (uut)
  mux_2x1 uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: sel = 0, expect out = in[0]
    in = 2'b01; sel = 0; #10;
    if (out !== 1'b1) $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);

    // Test case 2: sel = 1, expect out = in[1]
    in = 2'b10; sel = 1; #10;
    if (out !== 1'b1) $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);

    // Test case 3: sel = 0, expect out = in[0]
    in = 2'b00; sel = 0; #10;
    if (out !== 1'b0) $display("FAIL: Test case 3 failed, expected out = 0, got out = %b", out);

    // Test case 4: sel = 1, expect out = in[1]
    in = 2'b11; sel = 1; #10;
    if (out !== 1'b1) $display("FAIL: Test case 4 failed, expected out = 1, got out = %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule