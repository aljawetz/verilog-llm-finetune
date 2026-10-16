`timescale 1ns/1ps

module tb_syncrst_dff;

  reg clk;
  reg en;
  reg rst;
  reg d;
  wire q;

  // Instantiate the module under test (uut)
  syncrst_dff uut (
    .clk(clk),
    .en(en),
    .rst(rst),
    .d(d),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    en = 0;
    rst = 1;
    d = 0;

    // Test 1: Reset functionality
    #10; // Wait for a clock edge
    rst = 0; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Enable functionality
    rst = 1; // Deassert reset
    #10; // Wait for a clock edge
    en = 1; // Enable the flip-flop
    d = 1; // Set input data
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d when enabled");
      $finish;
    end

    // Test 3: Disable functionality
    d = 0; // Change input data
    en = 0; // Disable the flip-flop
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q changed when disabled");
      $finish;
    end

    // Test 4: Re-enable and change input
    en = 1; // Re-enable the flip-flop
    d = 0; // Change input data
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to new d when re-enabled");
      $finish;
    end

    // Test 5: Check reset while enabled
    rst = 0; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 while enabled");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule