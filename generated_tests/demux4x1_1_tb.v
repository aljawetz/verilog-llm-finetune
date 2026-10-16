`timescale 1ns/1ps

module tb_demux4x1;

  reg d;
  reg s0;
  reg s1;
  wire y0;
  wire y1;
  wire y2;
  wire y3;

  // Instantiate the demux4x1 module
  demux4x1 uut (
    .d(d),
    .s0(s0),
    .s1(s1),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3)
  );

  initial begin
    // Test case 1: d=1, s0=0, s1=0 -> y0 should be 1, others should be 0
    d = 1; s0 = 0; s1 = 0;
    #10;
    if (y0 !== 1 || y1 !== 0 || y2 !== 0 || y3 !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: d=1, s0=0, s1=1 -> y1 should be 1, others should be 0
    d = 1; s0 = 0; s1 = 1;
    #10;
    if (y0 !== 0 || y1 !== 1 || y2 !== 0 || y3 !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: d=1, s0=1, s1=0 -> y2 should be 1, others should be 0
    d = 1; s0 = 1; s1 = 0;
    #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 1 || y3 !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: d=1, s0=1, s1=1 -> y3 should be 1, others should be 0
    d = 1; s0 = 1; s1 = 1;
    #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: d=0, s0=0, s1=0 -> y0 should be 0, others should be 0
    d = 0; s0 = 0; s1 = 0;
    #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: d=0, s0=0, s1=1 -> y1 should be 0, others should be 0
    d = 0; s0 = 0; s1 = 1;
    #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: d=0, s0=1, s1=0 -> y2 should be 0, others should be 0
    d = 0; s0 = 1; s1 = 0;
    #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: d=0, s0=1, s1=1 -> y3 should be 0, others should be 0
    d = 0; s0 = 1; s1 = 1;
    #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule