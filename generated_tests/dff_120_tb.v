`timescale 1ns/1ps

module tb_dff;

  reg d;
  reg clk;
  reg r;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .d(d),
    .clk(clk),
    .r(r),
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
    d = 0;
    r = 0;

    // Test 1: Check reset functionality
    r = 1; // Activate reset
    #10;   // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check normal operation
    r = 0; // Deactivate reset
    d = 1; // Set d to 1
    #10;   // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not capture d when r is low");
      $finish;
    end

    // Test 3: Change d while r is low
    d = 0; // Change d to 0
    #10;   // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not capture new d value when r is low");
      $finish;
    end

    // Test 4: Check reset functionality again
    r = 1; // Activate reset
    #10;   // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Test 5: Check that q remains 0 when d changes with reset active
    r = 0; // Deactivate reset
    d = 1; // Set d to 1
    #10;   // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not capture d after reset was deactivated");
      $finish;
    end

    // Final check: Ensure q holds value when clock is high
    #10;   // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not hold value after clock edge");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule