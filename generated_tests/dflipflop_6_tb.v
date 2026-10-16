`timescale 1ns/1ps

module tb_dflipflop;
  reg d;
  reg clk;
  reg rst;
  wire q;
  wire qbar;

  // Instantiate the D Flip-Flop
  dflipflop uut (
    .d(d),
    .clk(clk),
    .rst(rst),
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
    // Initialize signals
    rst = 1;
    d = 0;

    // Apply reset
    #10;
    rst = 0; // Release reset

    // Test case 1: Check reset functionality
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qbar to 1");
      $finish;
    end

    // Test case 2: Check D input propagation
    d = 1; // Set D to 1
    #10; // Wait for clock edge
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: D input did not propagate correctly");
      $finish;
    end

    // Test case 3: Check D input with reset
    rst = 1; // Assert reset
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qbar to 1");
      $finish;
    end

    // Test case 4: Check D input propagation after reset
    rst = 0; // Release reset
    d = 0; // Set D to 0
    #10; // Wait for clock edge
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: D input did not propagate correctly after reset");
      $finish;
    end

    // Test case 5: Check D input propagation with changing D
    d = 1; // Set D to 1
    #10; // Wait for clock edge
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: D input did not propagate correctly with changing D");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule