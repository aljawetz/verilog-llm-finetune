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

    // Test 1: Check async reset
    async_reset = 1; #10; // Apply async reset
    if (q !== 1'b0) begin
      $display("FAIL: Async reset failed");
      $finish;
    end
    async_reset = 0; // Release async reset

    // Test 2: Check normal operation
    d = 1; #10; // Set d to 1
    if (q !== 1'b1) begin
      $display("FAIL: D flip-flop failed to set");
      $finish;
    end

    // Test 3: Check sync reset
    sync_reset = 1; #10; // Apply sync reset
    if (q !== 1'b0) begin
      $display("FAIL: Sync reset failed");
      $finish;
    end
    sync_reset = 0; // Release sync reset

    // Test 4: Check normal operation after sync reset
    d = 0; #10; // Set d to 0
    if (q !== 1'b0) begin
      $display("FAIL: D flip-flop failed to reset");
      $finish;
    end

    d = 1; #10; // Set d to 1
    if (q !== 1'b1) begin
      $display("FAIL: D flip-flop failed to set after reset");
      $finish;
    end

    // Test 5: Check async reset during operation
    d = 0; #10; // Set d to 0
    async_reset = 1; #10; // Apply async reset
    if (q !== 1'b0) begin
      $display("FAIL: Async reset during operation failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule