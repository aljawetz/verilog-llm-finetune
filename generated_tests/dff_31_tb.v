`timescale 1ns/1ps

module tb_dff;
  reg clk;
  reg load;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .clk(clk),
    .load(load),
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
    load = 0;
    d = 0;

    // Test case 1: Check reset functionality
    #10; // Wait for one clock cycle
    load = 1; // Set load high
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Test case 1 failed, expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 2: Check D input functionality
    load = 0; // Set load low
    d = 1; // Set D input to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Test case 2 failed, expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 3: Check D input functionality with load
    d = 0; // Change D input to 0
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Test case 3 failed, expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 4: Check reset functionality again
    load = 1; // Set load high
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Test case 4 failed, expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 5: Check D input functionality after reset
    load = 0; // Set load low
    d = 1; // Set D input to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Test case 5 failed, expected q = 1, got q = %b", q);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end
endmodule