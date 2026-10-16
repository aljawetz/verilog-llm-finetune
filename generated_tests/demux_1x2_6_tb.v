`timescale 1ns/1ps

module tb_demux_1x2;

  reg s;
  reg i;
  wire [1:0] w;

  // Instantiate the module under test (uut)
  demux_1x2 uut (
    .w(w),
    .s(s),
    .i(i)
  );

  initial begin
    // Test case 1: s = 0, i = 0
    s = 0; i = 0;
    #10;
    if (w !== 2'b00) begin
      $display("FAIL: Test case 1 failed, expected w = 00, got w = %b", w);
      $finish;
    end

    // Test case 2: s = 0, i = 1
    s = 0; i = 1;
    #10;
    if (w !== 2'b01) begin
      $display("FAIL: Test case 2 failed, expected w = 01, got w = %b", w);
      $finish;
    end

    // Test case 3: s = 1, i = 0
    s = 1; i = 0;
    #10;
    if (w !== 2'b00) begin
      $display("FAIL: Test case 3 failed, expected w = 00, got w = %b", w);
      $finish;
    end

    // Test case 4: s = 1, i = 1
    s = 1; i = 1;
    #10;
    if (w !== 2'b10) begin
      $display("FAIL: Test case 4 failed, expected w = 10, got w = %b", w);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule