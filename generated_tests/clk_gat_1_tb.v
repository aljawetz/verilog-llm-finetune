`timescale 1ns/1ps

module tb_clk_gat;

  reg clk_in;
  reg en;
  wire out_sig;

  // Instantiate the module under test (uut)
  clk_gat uut (
    .clk_in(clk_in),
    .en(en),
    .out_sig(out_sig)
  );

  // Clock generation
  initial begin
    clk_in = 0;
    forever #5 clk_in = ~clk_in; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize enable
    en = 0;

    // Wait for a few clock cycles
    #10;
    if (out_sig !== 0) begin
      $display("FAIL: Output should be 0 when enable is low");
      $finish;
    end

    // Enable the clock gating
    en = 1;
    #10;
    if (out_sig !== clk_in) begin
      $display("FAIL: Output should follow clk_in when enable is high");
      $finish;
    end

    // Disable the clock gating
    en = 0;
    #10;
    if (out_sig !== 0) begin
      $display("FAIL: Output should be 0 when enable is low");
      $finish;
    end

    // Enable again and check
    en = 1;
    #10;
    if (out_sig !== clk_in) begin
      $display("FAIL: Output should follow clk_in when enable is high");
      $finish;
    end

    // Final check with enable low
    en = 0;
    #10;
    if (out_sig !== 0) begin
      $display("FAIL: Output should be 0 when enable is low");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule