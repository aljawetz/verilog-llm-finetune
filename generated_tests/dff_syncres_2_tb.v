`timescale 1ns/1ps

module tb_dff_syncres;

  reg clk;
  reg async_reset;
  reg sync_reset;
  reg d;
  wire q;

  // Instantiate the module under test (uut)
  dff_syncres uut (
    .clk(clk),
    .async_reset(async_reset),
    .sync_reset(sync_reset),
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
    // Initialize signals
    async_reset = 0;
    sync_reset = 0;
    d = 0;

    // Test 1: Check reset functionality
    sync_reset = 1; // Assert synchronous reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Synchronous reset did not set q to 0");
      $finish;
    end

    sync_reset = 0; // Deassert synchronous reset
    #10;

    // Test 2: Check D flip-flop functionality
    d = 1; // Set D to 1
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d when sync_reset is low");
      $finish;
    end

    d = 0; // Set D to 0
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d when sync_reset is low");
      $finish;
    end

    // Test 3: Check synchronous reset while D is high
    sync_reset = 1; // Assert synchronous reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Synchronous reset did not set q to 0");
      $finish;
    end

    sync_reset = 0; // Deassert synchronous reset
    d = 1; // Set D to 1
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d when sync_reset is low");
      $finish;
    end

    // Test 4: Check synchronous reset again
    sync_reset = 1; // Assert synchronous reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Synchronous reset did not set q to 0");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end

endmodule