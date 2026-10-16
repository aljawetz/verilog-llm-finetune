`timescale 1ns/1ps

module tb_cmm_errman_cnt_nfl_en;

  // Parameters
  reg index;
  reg inc_dec_b;
  reg enable;
  reg rst;
  reg clk;
  wire count;

  // Instantiate the Unit Under Test (UUT)
  cmm_errman_cnt_nfl_en uut (
    .count(count),
    .index(index),
    .inc_dec_b(inc_dec_b),
    .enable(enable),
    .rst(rst),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    enable = 0;
    index = 0;
    inc_dec_b = 0;

    // Release reset
    #10 rst = 0;

    // Test 1: Enable counting up
    enable = 1;
    index = 1;
    inc_dec_b = 1; // Increment
    #10;
    if (count !== 1) $display("FAIL: Expected count to be 1 after incrementing by 1");

    // Test 2: Increment again
    #10;
    if (count !== 1) $display("FAIL: Expected count to remain 1 (no overflow)");

    // Test 3: Enable counting down
    inc_dec_b = 0; // Decrement
    #10;
    if (count !== 0) $display("FAIL: Expected count to be 0 after decrementing by 1");

    // Test 4: Underflow condition
    #10;
    if (count !== 0) $display("FAIL: Expected count to remain 0 (underflow)");

    // Test 5: Reset the counter
    rst = 1;
    #10;
    rst = 0;
    if (count !== 0) $display("FAIL: Expected count to be 0 after reset");

    // Test 6: Enable counting up with larger index
    enable = 1;
    index = 1;
    inc_dec_b = 1; // Increment
    #10;
    if (count !== 1) $display("FAIL: Expected count to be 1 after incrementing by 1");

    // Test 7: Increment to overflow
    index = 1;
    #10;
    if (count !== 1) $display("FAIL: Expected count to remain 1 (no overflow)");

    // Test 8: Enable counting down to underflow
    inc_dec_b = 0; // Decrement
    #10;
    if (count !== 0) $display("FAIL: Expected count to be 0 after decrementing to underflow");

    // Test 9: Disable counting
    enable = 0;
    #10;
    if (count !== 0) $display("FAIL: Expected count to remain 0 when disabled");

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule