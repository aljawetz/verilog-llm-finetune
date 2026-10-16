`timescale 1ns/1ps

module tb_dff;
  reg d;
  reg clk;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .d(d),
    .clk(clk),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    d = 0;
    #10; // Wait for the first clock edge

    // Test case 1: Check initial state
    if (q !== 0) begin
      $display("FAIL: Initial state of q is not 0");
      $finish;
    end

    // Test case 2: Set d to 1 and check q
    d = 1;
    #10; // Wait for the next clock edge
    if (q !== 1) begin
      $display("FAIL: q did not update to 1 when d is 1");
      $finish;
    end

    // Test case 3: Set d to 0 and check q
    d = 0;
    #10; // Wait for the next clock edge
    if (q !== 0) begin
      $display("FAIL: q did not update to 0 when d is 0");
      $finish;
    end

    // Test case 4: Toggle d and check q
    d = 1;
    #10; // Wait for the next clock edge
    if (q !== 1) begin
      $display("FAIL: q did not update to 1 when d is toggled to 1");
      $finish;
    end

    d = 0;
    #10; // Wait for the next clock edge
    if (q !== 0) begin
      $display("FAIL: q did not update to 0 when d is toggled to 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule