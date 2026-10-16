`timescale 1ns/1ps

module tb_dff;

  reg d;
  reg clk;
  reg reset;
  wire q;
  wire qbar;

  // Instantiate the D flip-flop
  dff uut (
    .d(d),
    .clk(clk),
    .reset(reset),
    .q(q),
    .qbar(qbar)
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
    reset = 0;

    // Test 1: Check reset functionality
    reset = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qbar to 1");
      $finish;
    end

    // Test 2: Check normal operation
    reset = 0; // Deactivate reset
    d = 1; // Set d to 1
    #10; // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: q and qbar did not reflect d correctly");
      $finish;
    end

    // Test 3: Check d = 0
    d = 0; // Set d to 0
    #10; // Wait for one clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: q and qbar did not reflect d correctly");
      $finish;
    end

    // Test 4: Check reset functionality again
    reset = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qbar to 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule