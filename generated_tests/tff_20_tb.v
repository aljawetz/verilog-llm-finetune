`timescale 1ns/1ps

module tb_tff;

  reg clk;
  reg reset;
  reg t;
  wire q;

  // Instantiate the module under test (uut)
  tff uut (
    .clk(clk),
    .reset(reset),
    .t(t),
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
    reset = 1;
    t = 0;

    // Apply reset
    #10;
    reset = 0;

    // Test case 1: Check reset functionality
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test case 2: Toggle t and check q
    t = 1; // Set T to toggle
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q to be 1 after toggling with t=1");
      $finish;
    end

    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to be 0 after toggling again with t=1");
      $finish;
    end

    // Test case 3: Check behavior with t = 0
    t = 0; // Set T to hold
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to remain 0 with t=0");
      $finish;
    end

    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to remain 0 with t=0");
      $finish;
    end

    // Test case 4: Reset again
    reset = 1;
    #10;
    reset = 0;

    // Test case 5: Check reset functionality again
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 on second reset");
      $finish;
    end

    // Test case 6: Toggle t again
    t = 1; // Set T to toggle
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q to be 1 after toggling with t=1 on second toggle");
      $finish;
    end

    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to be 0 after toggling again with t=1 on second toggle");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule