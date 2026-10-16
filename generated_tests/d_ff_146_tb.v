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
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Initial state incorrect");
      $finish;
    end

    // Test case 1: Set D to 1
    D = 1;
    #10; // Wait for the next clock edge
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Q should be 1 and Q_bar should be 0 when D is 1");
      $finish;
    end

    // Test case 2: Set D to 0
    D = 0;
    #10; // Wait for the next clock edge
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q should be 0 and Q_bar should be 1 when D is 0");
      $finish;
    end

    // Test case 3: Toggle D to 1 again
    D = 1;
    #10; // Wait for the next clock edge
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Q should be 1 and Q_bar should be 0 when D is 1");
      $finish;
    end

    // Test case 4: Toggle D to 0 again
    D = 0;
    #10; // Wait for the next clock edge
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q should be 0 and Q_bar should be 1 when D is 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule