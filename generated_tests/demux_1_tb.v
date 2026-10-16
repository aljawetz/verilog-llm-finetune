`timescale 1ns/1ps

module tb_demux;

  reg a;
  reg sel;
  wire y0;
  wire y1;

  // Instantiate the demux module
  demux uut (
    .a(a),
    .sel(sel),
    .y0(y0),
    .y1(y1)
  );

  initial begin
    // Test case 1: sel = 0, a = 1
    a = 1; sel = 0;
    #10;
    if (y0 !== 1 || y1 !== 0) begin
      $display("FAIL: Test case 1 failed (sel=0, a=1)");
      $finish;
    end

    // Test case 2: sel = 0, a = 0
    a = 0; sel = 0;
    #10;
    if (y0 !== 0 || y1 !== 0) begin
      $display("FAIL: Test case 2 failed (sel=0, a=0)");
      $finish;
    end

    // Test case 3: sel = 1, a = 1
    a = 1; sel = 1;
    #10;
    if (y0 !== 0 || y1 !== 1) begin
      $display("FAIL: Test case 3 failed (sel=1, a=1)");
      $finish;
    end

    // Test case 4: sel = 1, a = 0
    a = 0; sel = 1;
    #10;
    if (y0 !== 0 || y1 !== 0) begin
      $display("FAIL: Test case 4 failed (sel=1, a=0)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule