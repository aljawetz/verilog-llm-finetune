`timescale 1ns/1ps

module tb_dff_syncres;

  // Inputs
  reg clk;
  reg async_reset;
  reg sync_reset;
  reg d;

  // Outputs
  wire q;

  // Instantiate the Unit Under Test (UUT)
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
    // Initialize inputs
    async_reset = 0;
    sync_reset = 0;
    d = 0;

    // Test 1: Check reset functionality
    sync_reset = 1; // Activate synchronous reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Synchronous reset did not set q to 0");
      $finish;
    end

    // Test 2: Check D flip-flop functionality
    sync_reset = 0; // Deactivate synchronous reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: D flip-flop did not capture d correctly");
      $finish;
    end

    // Test 3: Check D flip-flop with different input
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: D flip-flop did not capture d correctly");
      $finish;
    end

    // Test 4: Check reset functionality again
    sync_reset = 1; // Activate synchronous reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Synchronous reset did not set q to 0");
      $finish;
    end

    // Test 5: Check D flip-flop after reset
    sync_reset = 0; // Deactivate synchronous reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: D flip-flop did not capture d correctly after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule