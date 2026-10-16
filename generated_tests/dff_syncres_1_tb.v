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

    // Test 2: Check data capture
    sync_reset = 0; // Deactivate synchronous reset
    d = 1; // Set d to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not capture d when sync_reset is low");
      $finish;
    end

    // Test 3: Check data capture with different d value
    d = 0; // Change d to 0
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not capture new d value when sync_reset is low");
      $finish;
    end

    // Test 4: Check reset functionality again
    sync_reset = 1; // Activate synchronous reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Synchronous reset did not set q to 0 again");
      $finish;
    end

    // Test 5: Check behavior with async_reset (should not affect q)
    async_reset = 1; // Activate asynchronous reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Asynchronous reset affected q when sync_reset is active");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule