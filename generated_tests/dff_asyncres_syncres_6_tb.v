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
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize signals
    async_reset = 0;
    sync_reset = 0;
    d = 0;

    // Test 1: Check async reset
    async_reset = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Async reset failed");
      $finish;
    end
    async_reset = 0; #10;

    // Test 2: Check synchronous reset
    d = 1; sync_reset = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Sync reset failed");
      $finish;
    end
    sync_reset = 0; #10;

    // Test 3: Check data capture on rising edge
    d = 1; #10;
    if (q !== 1'b1) begin
      $display("FAIL: Data capture failed");
      $finish;
    end

    // Test 4: Check data capture with sync reset
    d = 0; sync_reset = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Sync reset during data capture failed");
      $finish;
    end
    sync_reset = 0; #10;

    // Test 5: Check async reset during data capture
    d = 1; async_reset = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Async reset during data capture failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule