`timescale 1ns/1ps

module tb_demux1x2;

  // Inputs
  reg s;
  reg i;

  // Outputs
  wire y0;
  wire y1;

  // Instantiate the Unit Under Test (UUT)
  demux1x2 uut (
    .y0(y0),
    .y1(y1),
    .s(s),
    .i(i)
  );

  initial begin
    // Test case 1: s = 0, i = 1
    s = 0; i = 1;
    #10;
    if (y0 !== 1'b1 || y1 !== 1'b0) begin
      $display("FAIL: Test case 1 failed (s=0, i=1)");
      $finish;
    end

    // Test case 2: s = 1, i = 1
    s = 1; i = 1;
    #10;
    if (y0 !== 1'b0 || y1 !== 1'b1) begin
      $display("FAIL: Test case 2 failed (s=1, i=1)");
      $finish;
    end

    // Test case 3: s = 0, i = 0
    s = 0; i = 0;
    #10;
    if (y0 !== 1'b0 || y1 !== 1'b0) begin
      $display("FAIL: Test case 3 failed (s=0, i=0)");
      $finish;
    end

    // Test case 4: s = 1, i = 0
    s = 1; i = 0;
    #10;
    if (y0 !== 1'b0 || y1 !== 1'b0) begin
      $display("FAIL: Test case 4 failed (s=1, i=0)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule