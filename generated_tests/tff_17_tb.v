`timescale 1ns/1ps

module tb_tff;

  reg clk;
  reg rstn;
  reg t;
  wire q;

  // Instantiate the module under test (uut)
  tff uut (
    .clk(clk),
    .rstn(rstn),
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
    // Initialize inputs
    rstn = 0;
    t = 0;

    // Reset the T flip-flop
    #10;
    rstn = 1; // Release reset

    // Test case 1: Check initial state after reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Initial state after reset is not 0");
      $finish;
    end

    // Test case 2: Toggle T flip-flop
    t = 1; // Set T to toggle
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q to be 1 after toggle");
      $finish;
    end

    // Test case 3: Toggle again
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q to be 0 after second toggle");
      $finish;
    end

    // Test case 4: Hold state with T = 0
    t = 0; // Set T to hold
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q to remain 0 when T is 0");
      $finish;
    end

    // Test case 5: Toggle again with T = 1
    t = 1; // Set T to toggle
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q to be 1 after toggle with T = 1");
      $finish;
    end

    // Test case 6: Reset during operation
    rstn = 0; // Assert reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q to be 0 after reset during operation");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule