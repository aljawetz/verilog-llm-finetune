`timescale 1ns/1ps

module tb_demux1_2;

  // Inputs
  reg in;
  reg sel;

  // Outputs
  wire y0;
  wire y1;

  // Instantiate the Unit Under Test (UUT)
  demux1_2 uut (
    .in(in),
    .sel(sel),
    .y0(y0),
    .y1(y1)
  );

  initial begin
    // Test case 1: sel = 0, in = 1
    in = 1; sel = 0;
    #10;
    if (y0 !== 1 || y1 !== 0) begin
      $display("FAIL: Test case 1 failed (sel=0, in=1)");
      $finish;
    end

    // Test case 2: sel = 1, in = 1
    in = 1; sel = 1;
    #10;
    if (y0 !== 0 || y1 !== 1) begin
      $display("FAIL: Test case 2 failed (sel=1, in=1)");
      $finish;
    end

    // Test case 3: sel = 0, in = 0
    in = 0; sel = 0;
    #10;
    if (y0 !== 0 || y1 !== 0) begin
      $display("FAIL: Test case 3 failed (sel=0, in=0)");
      $finish;
    end

    // Test case 4: sel = 1, in = 0
    in = 0; sel = 1;
    #10;
    if (y0 !== 0 || y1 !== 0) begin
      $display("FAIL: Test case 4 failed (sel=1, in=0)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule