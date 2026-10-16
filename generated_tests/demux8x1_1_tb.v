`timescale 1ns/1ps

module tb_demux8x1;

  reg d;
  reg s0, s1, s2;
  wire y0, y1, y2, y3, y4, y5, y6, y7;

  // Instantiate the demux8x1 module
  demux8x1 uut (
    .d(d),
    .s0(s0),
    .s1(s1),
    .s2(s2),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3),
    .y4(y4),
    .y5(y5),
    .y6(y6),
    .y7(y7)
  );

  initial begin
    // Initialize inputs
    d = 0; s0 = 0; s1 = 0; s2 = 0;

    // Test all combinations of selector inputs with d = 1
    d = 1;
    #10;
    if (y0 !== 1 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
      $display("FAIL: Test case d=1, s=000 failed");
    
    s0 = 1; #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 1 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
      $display("FAIL: Test case d=1, s=100 failed");
    
    s0 = 0; s1 = 1; #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 1 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
      $display("FAIL: Test case d=1, s=010 failed");
    
    s1 = 0; s2 = 1; #10;
    if (y0 !== 0 || y1 !== 1 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
      $display("FAIL: Test case d=1, s=001 failed");
    
    s0 = 1; #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 1 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
      $display("FAIL: Test case d=1, s=111 failed");

    // Test all combinations of selector inputs with d = 0
    d = 0; s0 = 0; s1 = 0; s2 = 0; #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
      $display("FAIL: Test case d=0, s=000 failed");
    
    s0 = 1; #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
      $display("FAIL: Test case d=0, s=100 failed");
    
    s0 = 0; s1 = 1; #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
      $display("FAIL: Test case d=0, s=010 failed");
    
    s1 = 0; s2 = 1; #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
      $display("FAIL: Test case d=0, s=001 failed");
    
    s0 = 1; #10;
    if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0 || y4 !== 0 || y5 !== 0 || y6 !== 0 || y7 !== 0) 
      $display("FAIL: Test case d=0, s=111 failed");

    $display("PASS");
    $finish;
  end

endmodule