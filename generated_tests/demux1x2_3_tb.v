`timescale 1ns/1ps

module tb_demux1x2;

  reg d;
  reg s;
  wire y0;
  wire y1;

  // Instantiate the module under test (uut)
  demux1x2 uut (
    .d(d),
    .s(s),
    .y0(y0),
    .y1(y1)
  );

  initial begin
    // Test case 1: d=0, s=0 -> y0 should be 0, y1 should be 0
    d = 0; s = 0;
    #10;
    if (y0 !== 0 || y1 !== 0) begin
      $display("FAIL: Test case 1 failed (d=0, s=0)");
      $finish;
    end

    // Test case 2: d=0, s=1 -> y0 should be 0, y1 should be 0
    d = 0; s = 1;
    #10;
    if (y0 !== 0 || y1 !== 0) begin
      $display("FAIL: Test case 2 failed (d=0, s=1)");
      $finish;
    end

    // Test case 3: d=1, s=0 -> y0 should be 1, y1 should be 0
    d = 1; s = 0;
    #10;
    if (y0 !== 1 || y1 !== 0) begin
      $display("FAIL: Test case 3 failed (d=1, s=0)");
      $finish;
    end

    // Test case 4: d=1, s=1 -> y0 should be 0, y1 should be 1
    d = 1; s = 1;
    #10;
    if (y0 !== 0 || y1 !== 1) begin
      $display("FAIL: Test case 4 failed (d=1, s=1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule