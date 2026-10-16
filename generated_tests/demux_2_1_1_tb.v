`timescale 1ns/1ps

module tb_demux_2_1;

  reg sel;
  reg i;
  wire y0;
  wire y1;

  // Instantiate the module under test (uut)
  demux_2_1 uut (
    .sel(sel),
    .i(i),
    .y0(y0),
    .y1(y1)
  );

  initial begin
    // Test case 1: sel = 0, i = 1
    sel = 0; i = 1;
    #10;
    if (y0 !== 1'b1 || y1 !== 1'b0) begin
      $display("FAIL: Test case 1 failed (sel=0, i=1)");
      $finish;
    end

    // Test case 2: sel = 0, i = 0
    sel = 0; i = 0;
    #10;
    if (y0 !== 1'b0 || y1 !== 1'b0) begin
      $display("FAIL: Test case 2 failed (sel=0, i=0)");
      $finish;
    end

    // Test case 3: sel = 1, i = 1
    sel = 1; i = 1;
    #10;
    if (y0 !== 1'b0 || y1 !== 1'b1) begin
      $display("FAIL: Test case 3 failed (sel=1, i=1)");
      $finish;
    end

    // Test case 4: sel = 1, i = 0
    sel = 1; i = 0;
    #10;
    if (y0 !== 1'b0 || y1 !== 1'b0) begin
      $display("FAIL: Test case 4 failed (sel=1, i=0)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule