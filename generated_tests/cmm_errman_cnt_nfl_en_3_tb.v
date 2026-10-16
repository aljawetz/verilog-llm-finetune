`timescale 1ns/1ps

module tb_cmm_errman_cnt_nfl_en;

  // Parameters
  parameter CLK_PERIOD = 10;

  // Inputs
  reg index;
  reg inc_dec_b;
  reg enable;
  reg rst;
  reg clk;

  // Outputs
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
    forever #(CLK_PERIOD/2) clk = ~clk;
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    enable = 0;
    index = 0;
    inc_dec_b = 0;

    // Release reset
    #(CLK_PERIOD) rst = 0;

    // Test 1: Enable counter and increment
    enable = 1;
    index = 1;
    inc_dec_b = 1; // Increment
    #(CLK_PERIOD);
    if (count !== 1) $display("FAIL: Expected count to be 1 after incrementing 0 by 1");

    // Test 2: Increment again
    #(CLK_PERIOD);
    if (count !== 1) $display("FAIL: Expected count to remain 1 after incrementing 1 by 1");

    // Test 3: Decrement
    inc_dec_b = 0; // Decrement
    #(CLK_PERIOD);
    if (count !== 0) $display("FAIL: Expected count to be 0 after decrementing 1 by 1");

    // Test 4: Underflow condition
    index = 1;
    #(CLK_PERIOD);
    if (count !== 0) $display("FAIL: Expected count to remain 0 after decrementing 0 by 1");

    // Test 5: Enable and increment again
    enable = 1;
    index = 1;
    inc_dec_b = 1; // Increment
    #(CLK_PERIOD);
    if (count !== 1) $display("FAIL: Expected count to be 1 after incrementing 0 by 1");

    // Test 6: Overflow condition
    index = 1;
    #(CLK_PERIOD);
    if (count !== 1) $display("FAIL: Expected count to remain 1 after incrementing 1 by 1");

    // Test 7: Reset the counter
    rst = 1;
    #(CLK_PERIOD);
    rst = 0;
    #(CLK_PERIOD);
    if (count !== 0) $display("FAIL: Expected count to be 0 after reset");

    // Test 8: Disable counter
    enable = 0;
    index = 1;
    inc_dec_b = 1; // Increment
    #(CLK_PERIOD);
    if (count !== 0) $display("FAIL: Expected count to remain 0 after incrementing while disabled");

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule