`timescale 1ns/1ps

module tb_d_ff;
  reg clk;
  reg rst;
  reg D;
  wire Q;
  wire Q_bar;

  // Instantiate the D flip-flop
  d_ff uut (
    .clk(clk),
    .rst(rst),
    .D(D),
    .Q(Q),
    .Q_bar(Q_bar)
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
    D = 0;

    // Wait for a clock edge
    #10;

    // Test reset functionality
    rst = 0; // Deassert reset
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Initial state after reset is incorrect");
      $finish;
    end

    // Test D input functionality
    D = 1; // Set D to 1
    #10; // Wait for clock edge
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Q should be 1 when D is 1");
      $finish;
    end

    D = 0; // Set D to 0
    #10; // Wait for clock edge
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q should be 0 when D is 0");
      $finish;
    end

    // Test reset functionality again
    rst = 1; // Assert reset
    #10; // Wait for clock edge
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // Deassert reset and test again
    rst = 0; // Deassert reset
    #10;
    D = 1; // Set D to 1
    #10; // Wait for clock edge
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Q should be 1 when D is 1 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule