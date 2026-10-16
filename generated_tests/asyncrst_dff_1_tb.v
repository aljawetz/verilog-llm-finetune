`timescale 1ns/1ps

module tb_asyncrst_dff;

  reg clk;
  reg en;
  reg rst;
  reg d;
  wire q;

  // Instantiate the module under test (uut)
  asyncrst_dff uut (
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

    // Test 1: Check reset functionality
    rst = 0; // Assert reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check normal operation with enable
    rst = 1; // Deassert reset
    en = 1;   // Enable the D flip-flop
    d = 1;    // Set input d to 1
    #10;      // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d when enabled");
      $finish;
    end

    // Test 3: Check disable functionality
    en = 0;   // Disable the D flip-flop
    d = 0;    // Change input d to 0
    #10;      // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q should not change when disabled");
      $finish;
    end

    // Test 4: Check reset functionality again
    rst = 0; // Assert reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 5: Check operation with different values
    rst = 1; // Deassert reset
    en = 1;   // Enable the D flip-flop
    d = 0;    // Set input d to 0
    #10;      // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to d when enabled");
      $finish;
    end

    d = 1;    // Change input d to 1
    #10;      // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d when enabled");
      $finish;
    end

    // Final check: Disable and ensure q remains unchanged
    en = 0;   // Disable the D flip-flop
    #10;      // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q should not change when disabled");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule