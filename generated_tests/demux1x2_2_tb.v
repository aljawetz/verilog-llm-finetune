`timescale 1ns/1ps

module tb_demux1x2;

  reg s;
  reg d;
  wire y0;
  wire y1;

  // Instantiate the demux1x2 module
  demux1x2 uut (
    .s(s),
    .d(d),
    .y0(y0),
    .y1(y1)
  );

  initial begin
    // Test case 1: s = 0, d = 1
    s = 0; d = 1; 
    #10;
    if (y0 !== 1'b1 || y1 !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: s = 0, d = 0
    s = 0; d = 0; 
    #10;
    if (y0 !== 1'b0 || y1 !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: s = 1, d = 1
    s = 1; d = 1; 
    #10;
    if (y0 !== 1'b0 || y1 !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: s = 1, d = 0
    s = 1; d = 0; 
    #10;
    if (y0 !== 1'b0 || y1 !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule