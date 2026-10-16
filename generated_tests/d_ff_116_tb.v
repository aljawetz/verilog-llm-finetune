`timescale 1ns/1ps

module tb_d_ff;
  reg clk;
  reg D;
  wire Q;
  wire Q_bar;

  // Instantiate the D flip-flop
  d_ff uut (
    .clk(clk),
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
    // Initialize inputs
    D = 0;

    // Wait for the first clock edge
    #10;

    // Test case 1: D = 0, check Q and Q_bar
    D = 0;
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: D = 1, check Q and Q_bar
    D = 1;
    #10;
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: D = 0, check Q and Q_bar
    D = 0;
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: D = 1, check Q and Q_bar
    D = 1;
    #10;
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Final check to ensure Q and Q_bar are stable
    #10;
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Final state check failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule