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
    async_reset = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Async reset failed");
      $finish;
    end
    async_reset = 0; #10;

    // Test 2: Synchronous reset
    d = 1; sync_reset = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Sync reset failed");
      $finish;
    end
    sync_reset = 0; #10;

    // Test 3: Latch input on clock edge
    d = 1; #10;
    if (q !== 1'b1) begin
      $display("FAIL: D flip-flop failed to latch input");
      $finish;
    end

    // Test 4: Change input and check on next clock edge
    d = 0; #10;
    if (q !== 1'b0) begin
      $display("FAIL: D flip-flop failed to update on clock edge");
      $finish;
    end

    // Test 5: Check behavior with async reset during operation
    async_reset = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Async reset during operation failed");
      $finish;
    end
    async_reset = 0; #10;

    // Test 6: Check sync reset again
    d = 1; sync_reset = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Sync reset during operation failed");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end

endmodule