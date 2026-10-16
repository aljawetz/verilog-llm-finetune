`timescale 1ns/1ps

module tb_demux_1to2;

  reg i;
  reg s;
  wire [1:0] y;

  // Instantiate the module under test (uut)
  demux_1to2 uut (
    .i(i),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: s = 0, i = 0
    i = 0; s = 0;
    #10;
    if (y !== 2'b00) begin
      $display("FAIL: Test case 1 failed, expected y = 00, got y = %b", y);
      $finish;
    end

    // Test case 2: s = 0, i = 1
    i = 1; s = 0;
    #10;
    if (y !== 2'b01) begin
      $display("FAIL: Test case 2 failed, expected y = 01, got y = %b", y);
      $finish;
    end

    // Test case 3: s = 1, i = 0
    i = 0; s = 1;
    #10;
    if (y !== 2'b00) begin
      $display("FAIL: Test case 3 failed, expected y = 00, got y = %b", y);
      $finish;
    end

    // Test case 4: s = 1, i = 1
    i = 1; s = 1;
    #10;
    if (y !== 2'b10) begin
      $display("FAIL: Test case 4 failed, expected y = 10, got y = %b", y);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule