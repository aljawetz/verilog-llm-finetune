`timescale 1ns/1ps

module tb_Dmux1_2;
  reg i;
  reg s;
  wire y1;
  wire y2;

  // Instantiate the Dmux1_2 module
  Dmux1_2 uut (
    .i(i),
    .s(s),
    .y1(y1),
    .y2(y2)
  );

  initial begin
    // Test case 1: s = 0, i = 1
    i = 1; s = 0;
    #10;
    if (y1 !== 1 || y2 !== 0) begin
      $display("FAIL: Test case 1 failed (s=0, i=1)");
      $finish;
    end

    // Test case 2: s = 1, i = 1
    i = 1; s = 1;
    #10;
    if (y1 !== 0 || y2 !== 1) begin
      $display("FAIL: Test case 2 failed (s=1, i=1)");
      $finish;
    end

    // Test case 3: s = 0, i = 0
    i = 0; s = 0;
    #10;
    if (y1 !== 0 || y2 !== 0) begin
      $display("FAIL: Test case 3 failed (s=0, i=0)");
      $finish;
    end

    // Test case 4: s = 1, i = 0
    i = 0; s = 1;
    #10;
    if (y1 !== 0 || y2 !== 0) begin
      $display("FAIL: Test case 4 failed (s=1, i=0)");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end
endmodule