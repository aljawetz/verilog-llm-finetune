`timescale 1ns/1ps

module tb_D_flipflop;

  reg clk;
  reg rst;
  reg d;
  wire Q;

  // Instantiate the D_flipflop module
  D_flipflop uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; // Assert reset
    d = 0;
    #10; // Wait for 10ns

    // Check reset functionality
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // Deassert reset
    rst = 0;
    #10; // Wait for 10ns

    // Test D flip-flop behavior
    d = 1; // Set D to 1
    #10; // Wait for clock edge
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when D is 1");
      $finish;
    end

    d = 0; // Set D to 0
    #10; // Wait for clock edge
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when D is 0");
      $finish;
    end

    d = 1; // Set D to 1 again
    #10; // Wait for clock edge
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when D is 1 again");
      $finish;
    end

    // Test reset during operation
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after reset during operation");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule