`timescale 1ns/1ps

module tb_mux_3to1;

  reg i0, i1, i2;
  reg s0, s1;
  wire out;

  // Instantiate the module under test (uut)
  mux_3to1 uut (
    .out(out),
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .s0(s0),
    .s1(s1)
  );

  initial begin
    // Test case 1: Select i0 with s0=0, s1=0
    i0 = 1; i1 = 0; i2 = 0; s0 = 0; s1 = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 1 failed, expected out=1, got out=%b", out);

    // Test case 2: Select i0 with s0=0, s1=1
    i0 = 0; i1 = 0; i2 = 0; s0 = 0; s1 = 1;
    #10;
    if (out !== 0) $display("FAIL: Test case 2 failed, expected out=0, got out=%b", out);

    // Test case 3: Select i1 with s0=1, s1=0
    i0 = 0; i1 = 1; i2 = 0; s0 = 1; s1 = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 3 failed, expected out=1, got out=%b", out);

    // Test case 4: Select i2 with s0=1, s1=1
    i0 = 0; i1 = 0; i2 = 1; s0 = 1; s1 = 1;
    #10;
    if (out !== 1) $display("FAIL: Test case 4 failed, expected out=1, got out=%b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule