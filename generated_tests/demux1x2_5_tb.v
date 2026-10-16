`timescale 1ns/1ps

module tb_demux1x2;
  reg s;
  reg d;
  wire y1;
  wire y2;

  // Instantiate the module under test (uut)
  demux1x2 uut (
    .s(s),
    .d(d),
    .y1(y1),
    .y2(y2)
  );

  initial begin
    // Test case 1: s = 0, d = 1
    s = 0; d = 1;
    #10;
    if (y1 !== 1'b1 || y2 !== 1'b0) begin
      $display("FAIL: Test case 1 failed (s=0, d=1)");
      $finish;
    end

    // Test case 2: s = 0, d = 0
    s = 0; d = 0;
    #10;
    if (y1 !== 1'b0 || y2 !== 1'b0) begin
      $display("FAIL: Test case 2 failed (s=0, d=0)");
      $finish;
    end

    // Test case 3: s = 1, d = 1
    s = 1; d = 1;
    #10;
    if (y1 !== 1'b0 || y2 !== 1'b1) begin
      $display("FAIL: Test case 3 failed (s=1, d=1)");
      $finish;
    end

    // Test case 4: s = 1, d = 0
    s = 1; d = 0;
    #10;
    if (y1 !== 1'b0 || y2 !== 1'b0) begin
      $display("FAIL: Test case 4 failed (s=1, d=0)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule