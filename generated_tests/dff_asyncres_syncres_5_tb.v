`timescale 1ns/1ps

module tb_dff_asyncres_syncres;

  reg clk;
  reg async_reset;
  reg sync_reset;
  reg d;
  wire q;

  // Instantiate the module under test (uut)
  dff_asyncres_syncres uut (
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

    // Test 1: Asynchronous reset
    async_reset = 1;
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: Asynchronous reset failed");
      $finish;
    end
    async_reset = 0;

    // Test 2: Synchronous reset
    d = 1;
    sync_reset = 1;
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: Synchronous reset failed");
      $finish;
    end
    sync_reset = 0;

    // Test 3: Normal operation
    d = 1;
    #10; // Wait for a clock edge
    if (q !== 1) begin
      $display("FAIL: D flip-flop failed to latch input");
      $finish;
    end

    // Test 4: Change input while clock is low
    d = 0;
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: D flip-flop failed to latch new input");
      $finish;
    end

    // Test 5: Asynchronous reset during normal operation
    d = 1;
    #5 async_reset = 1; // Assert async reset before next clock edge
    #10; // Wait for a clock edge
    if (q !== 0) begin
      $display("FAIL: Asynchronous reset during operation failed");
      $finish;
    end

    // Test 6: Check normal operation after async reset
    async_reset = 0;
    d = 1;
    #10; // Wait for a clock edge
    if (q !== 1) begin
      $display("FAIL: D flip-flop failed to latch input after async reset");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule