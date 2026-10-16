`timescale 1ns/1ps

module tb_ClkDiv;

  reg i_ref_clk;
  reg i_rst_n;
  reg i_clk_en;
  reg [7:0] i_div_ratio;
  wire o_div_clk;

  // Instantiate the module under test (uut)
  ClkDiv uut (
    .i_ref_clk(i_ref_clk),
    .i_rst_n(i_rst_n),
    .i_clk_en(i_clk_en),
    .i_div_ratio(i_div_ratio),
    .o_div_clk(o_div_clk)
  );

  // Clock generation
  initial begin
    i_ref_clk = 0;
    forever #5 i_ref_clk = ~i_ref_clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize signals
    i_rst_n = 0;
    i_clk_en = 0;
    i_div_ratio = 8'd0;

    // Reset the DUT
    #10;
    i_rst_n = 1; // Release reset
    #10;

    // Test case 1: Check output when clock is disabled
    i_clk_en = 0;
    i_div_ratio = 8'd4; // Set division ratio
    #20;
    if (o_div_clk !== i_ref_clk) begin
      $display("FAIL: Output clock should match reference clock when disabled");
      $finish;
    end

    // Test case 2: Check output when clock is enabled with ratio 0
    i_clk_en = 1;
    i_div_ratio = 8'd0; // Invalid ratio
    #20;
    if (o_div_clk !== i_ref_clk) begin
      $display("FAIL: Output clock should match reference clock when division ratio is 0");
      $finish;
    end

    // Test case 3: Check output when clock is enabled with ratio 1
    i_div_ratio = 8'd1; // Invalid ratio
    #20;
    if (o_div_clk !== i_ref_clk) begin
      $display("FAIL: Output clock should match reference clock when division ratio is 1");
      $finish;
    end

    // Test case 4: Check output when clock is enabled with ratio 2
    i_div_ratio = 8'd2; // Valid ratio
    #40; // Wait for two clock cycles
    if (o_div_clk === i_ref_clk) begin
      $display("FAIL: Output clock should toggle when division ratio is 2");
      $finish;
    end

    // Test case 5: Check output when clock is enabled with ratio 4
    i_div_ratio = 8'd4; // Valid ratio
    #80; // Wait for four clock cycles
    if (o_div_clk === i_ref_clk) begin
      $display("FAIL: Output clock should toggle when division ratio is 4");
      $finish;
    end

    // Test case 6: Check output when clock is enabled with ratio 5
    i_div_ratio = 8'd5; // Valid ratio
    #100; // Wait for five clock cycles
    if (o_div_clk === i_ref_clk) begin
      $display("FAIL: Output clock should toggle when division ratio is 5");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule