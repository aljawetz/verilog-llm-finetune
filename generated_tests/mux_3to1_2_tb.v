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
    // Test case 1: s0=0, s1=0 -> out should be i0
    i0 = 1; i1 = 0; i2 = 0; s0 = 0; s1 = 0;
    #10;
    if (out !== i0) begin
      $display("FAIL: Test case 1 failed, expected out=%b, got out=%b", i0, out);
      $finish;
    end

    // Test case 2: s0=0, s1=1 -> out should be i0
    i0 = 1; i1 = 0; i2 = 0; s0 = 0; s1 = 1;
    #10;
    if (out !== i0) begin
      $display("FAIL: Test case 2 failed, expected out=%b, got out=%b", i0, out);
      $finish;
    end

    // Test case 3: s0=1, s1=0 -> out should be i1
    i0 = 0; i1 = 1; i2 = 0; s0 = 1; s1 = 0;
    #10;
    if (out !== i1) begin
      $display("FAIL: Test case 3 failed, expected out=%b, got out=%b", i1, out);
      $finish;
    end

    // Test case 4: s0=1, s1=1 -> out should be i2
    i0 = 0; i1 = 0; i2 = 1; s0 = 1; s1 = 1;
    #10;
    if (out !== i2) begin
      $display("FAIL: Test case 4 failed, expected out=%b, got out=%b", i2, out);
      $finish;
    end

    // Test case 5: s0=0, s1=0 -> out should be i0 (again)
    i0 = 0; i1 = 1; i2 = 1; s0 = 0; s1 = 0;
    #10;
    if (out !== i0) begin
      $display("FAIL: Test case 5 failed, expected out=%b, got out=%b", i0, out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule