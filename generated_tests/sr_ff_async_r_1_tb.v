`timescale 1ns/1ps

module tb_sr_ff_async_r;

  reg s;
  reg r;
  reg reset;
  reg clk;
  wire q;
  wire qbar;

  // Instantiate the SR flip-flop
  sr_ff_async_r uut (
    .s(s),
    .r(r),
    .reset(reset),
    .clk(clk),
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
    s = 0;
    r = 0;
    reset = 0;

    // Test 1: Reset the flip-flop
    reset = 1; #10; // Assert reset
    reset = 0; #10; // Deassert reset
    if (q !== 0) begin
      $display("FAIL: Reset did not clear q");
      $finish;
    end

    // Test 2: Set the flip-flop
    s = 1; r = 0; #10; // Set
    if (q !== 1) begin
      $display("FAIL: Set did not set q");
      $finish;
    end

    // Test 3: Clear the flip-flop
    s = 0; r = 1; #10; // Clear
    if (q !== 0) begin
      $display("FAIL: Clear did not clear q");
      $finish;
    end

    // Test 4: Maintain state
    s = 0; r = 0; #10; // Maintain
    if (q !== 0) begin
      $display("FAIL: Maintain did not keep q unchanged");
      $finish;
    end

    // Test 5: Set and then clear
    s = 1; r = 0; #10; // Set
    s = 0; r = 1; #10; // Clear
    if (q !== 0) begin
      $display("FAIL: Clear after set did not clear q");
      $finish;
    end

    // Test 6: Undefined state
    s = 1; r = 1; #10; // Undefined state
    if (q !== 1'bx) begin
      $display("FAIL: Undefined state did not produce x");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule