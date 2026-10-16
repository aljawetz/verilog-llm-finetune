`timescale 1ns/1ps

module tb_strt_Check;

  // Inputs
  reg strt_chk_en;
  reg sampled_bit;
  reg rst_check;
  reg clk;
  reg RST;

  // Outputs
  wire strt_glitch;

  // Instantiate the Unit Under Test (UUT)
  strt_Check uut (
    .strt_chk_en(strt_chk_en),
    .sampled_bit(sampled_bit),
    .rst_check(rst_check),
    .clk(clk),
    .RST(RST),
    .strt_glitch(strt_glitch)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    RST = 0;
    strt_chk_en = 0;
    sampled_bit = 0;
    rst_check = 0;

    // Apply reset
    #10;
    RST = 1;

    // Test 1: strt_chk_en is low, strt_glitch should be 0
    #10;
    strt_chk_en = 0;
    sampled_bit = 1; // sampled_bit high
    #10;
    if (strt_glitch !== 1'b0) begin
      $display("FAIL: strt_glitch should be 0 when strt_chk_en is low");
      $finish;
    end

    // Test 2: strt_chk_en is high, sampled_bit is high, strt_glitch should be 1
    #10;
    strt_chk_en = 1;
    sampled_bit = 1; // sampled_bit high
    #10;
    if (strt_glitch !== 1'b1) begin
      $display("FAIL: strt_glitch should be 1 when strt_chk_en is high and sampled_bit is high");
      $finish;
    end

    // Test 3: sampled_bit goes low, strt_glitch should be 0
    #10;
    sampled_bit = 0; // sampled_bit low
    #10;
    if (strt_glitch !== 1'b0) begin
      $display("FAIL: strt_glitch should be 0 when sampled_bit is low");
      $finish;
    end

    // Test 4: rst_check is high, strt_glitch should reset to 0
    #10;
    rst_check = 1; // activate reset check
    #10;
    if (strt_glitch !== 1'b0) begin
      $display("FAIL: strt_glitch should be 0 when rst_check is high");
      $finish;
    end

    // Test 5: strt_chk_en is high again, sampled_bit is high, strt_glitch should be 1
    #10;
    rst_check = 0; // deactivate reset check
    sampled_bit = 1; // sampled_bit high
    #10;
    if (strt_glitch !== 1'b1) begin
      $display("FAIL: strt_glitch should be 1 when strt_chk_en is high and sampled_bit is high");
      $finish;
    end

    // Test 6: Apply reset
    #10;
    RST = 0; // apply reset
    #10;
    if (strt_glitch !== 1'b0) begin
      $display("FAIL: strt_glitch should be 0 after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule