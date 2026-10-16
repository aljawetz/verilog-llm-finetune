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
    async_reset = 1; // Apply async reset
    #10;
    async_reset = 0; // Release async reset
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after async reset");
      $finish;
    end

    // Test 2: Check synchronous reset
    d = 1; // Set d to 1
    sync_reset = 1; // Apply sync reset
    #10;
    sync_reset = 0; // Release sync reset
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after sync reset");
      $finish;
    end

    // Test 3: Check normal operation
    d = 1; // Set d to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 after d is set to 1");
      $finish;
    end

    // Test 4: Check if d changes q on clock edge
    d = 0; // Change d to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after d is set to 0");
      $finish;
    end

    // Test 5: Check synchronous reset takes precedence over d
    d = 1; // Set d to 1
    sync_reset = 1; // Apply sync reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after sync reset is applied");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule