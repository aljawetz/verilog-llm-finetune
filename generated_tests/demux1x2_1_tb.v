`timescale 1ns/1ps

module tb_demux1x2;

  // Inputs
  reg d;
  reg s;

  // Outputs
  wire y0;
  wire y1;

  // Instantiate the Unit Under Test (UUT)
  demux1x2 uut (
    .d(d),
    .s(s),
    .y0(y0),
    .y1(y1)
  );

  initial begin
    // Test case 1: d = 0, s = 0
    d = 0; s = 0;
    #10;
    if (y0 !== 0 || y1 !== 0) begin
      $display("FAIL: Test case 1 failed. Expected y0=0, y1=0 but got y0=%b, y1=%b", y0, y1);
      $finish;
    end

    // Test case 2: d = 0, s = 1
    d = 0; s = 1;
    #10;
    if (y0 !== 0 || y1 !== 0) begin
      $display("FAIL: Test case 2 failed. Expected y0=0, y1=0 but got y0=%b, y1=%b", y0, y1);
      $finish;
    end

    // Test case 3: d = 1, s = 0
    d = 1; s = 0;
    #10;
    if (y0 !== 1 || y1 !== 0) begin
      $display("FAIL: Test case 3 failed. Expected y0=1, y1=0 but got y0=%b, y1=%b", y0, y1);
      $finish;
    end

    // Test case 4: d = 1, s = 1
    d = 1; s = 1;
    #10;
    if (y0 !== 0 || y1 !== 1) begin
      $display("FAIL: Test case 4 failed. Expected y0=0, y1=1 but got y0=%b, y1=%b", y0, y1);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule