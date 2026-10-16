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
    sync_reset = 1; // Activate sync_reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q should be 0 when sync_reset is high");
      $finish;
    end

    // Test 2: Check data capture
    sync_reset = 0; // Deactivate sync_reset
    d = 1; // Set d to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q should be 1 after capturing d");
      $finish;
    end

    // Test 3: Check reset functionality again
    sync_reset = 1; // Activate sync_reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q should be 0 when sync_reset is high again");
      $finish;
    end

    // Test 4: Check data capture again
    sync_reset = 0; // Deactivate sync_reset
    d = 0; // Set d to 0
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q should be 0 after capturing d");
      $finish;
    end

    // Test 5: Check data capture with d = 1
    d = 1; // Set d to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q should be 1 after capturing d again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule