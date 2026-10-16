`timescale 1ns/1ps

module tb_or_gate;

  reg a0;
  reg b0;
  wire c0;

  // Instantiate the module under test (uut)
  or_gate uut (
    .a0(a0),
    .b0(b0),
    .c0(c0)
  );

  initial begin
    // Test case 1: a0 = 0, b0 = 0
    a0 = 0; b0 = 0;
    #10;
    if (c0 !== 0) begin
      $display("FAIL: Test case 1 failed, expected c0 = 0, got c0 = %b", c0);
      $finish;
    end

    // Test case 2: a0 = 0, b0 = 1
    a0 = 0; b0 = 1;
    #10;
    if (c0 !== 1) begin
      $display("FAIL: Test case 2 failed, expected c0 = 1, got c0 = %b", c0);
      $finish;
    end

    // Test case 3: a0 = 1, b0 = 0
    a0 = 1; b0 = 0;
    #10;
    if (c0 !== 1) begin
      $display("FAIL: Test case 3 failed, expected c0 = 1, got c0 = %b", c0);
      $finish;
    end

    // Test case 4: a0 = 1, b0 = 1
    a0 = 1; b0 = 1;
    #10;
    if (c0 !== 1) begin
      $display("FAIL: Test case 4 failed, expected c0 = 1, got c0 = %b", c0);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule