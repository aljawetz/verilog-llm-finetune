`timescale 1ns/1ps

module tb_hs_1;

  reg a;
  reg bin;
  wire d;
  wire bout;

  // Instantiate the unit under test (UUT)
  hs_1 uut (
    .a(a),
    .bin(bin),
    .d(d),
    .bout(bout)
  );

  initial begin
    // Test Case 1: a = 0, bin = 0
    a = 0; bin = 0;
    #10;
    if (d !== 0 || bout !== 0) begin
      $display("FAIL: Test Case 1 failed (a=0, bin=0)");
      $finish;
    end

    // Test Case 2: a = 0, bin = 1
    a = 0; bin = 1;
    #10;
    if (d !== 1 || bout !== 1) begin
      $display("FAIL: Test Case 2 failed (a=0, bin=1)");
      $finish;
    end

    // Test Case 3: a = 1, bin = 0
    a = 1; bin = 0;
    #10;
    if (d !== 1 || bout !== 0) begin
      $display("FAIL: Test Case 3 failed (a=1, bin=0)");
      $finish;
    end

    // Test Case 4: a = 1, bin = 1
    a = 1; bin = 1;
    #10;
    if (d !== 0 || bout !== 0) begin
      $display("FAIL: Test Case 4 failed (a=1, bin=1)");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule