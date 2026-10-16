`timescale 1ns/1ps

module tb_d_ff;
  reg clk;
  reg rst;
  reg D;
  wire Q;
  wire Q_bar;

  // Instantiate the D flip-flop module
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

    // Test reset functionality
    #10;
    rst = 0; // Deassert reset
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q and Q_bar should be 0 and 1 after reset deassertion");
      $finish;
    end

    // Test D input functionality
    D = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Q should be 1 and Q_bar should be 0 after D is set to 1");
      $finish;
    end

    // Test D input functionality with D = 0
    D = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q should be 0 and Q_bar should be 1 after D is set to 0");
      $finish;
    end

    // Test reset functionality again
    rst = 1; // Assert reset
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q and Q_bar should be 0 and 1 after reset assertion");
      $finish;
    end

    // Deassert reset and check again
    rst = 0; // Deassert reset
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q and Q_bar should still be 0 and 1 after reset deassertion");
      $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
  end
endmodule