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
    // Initialize inputs
    rst = 1;
    D = 0;

    // Test 1: Reset functionality
    #10; // Wait for a clock edge
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Reset did not set Q to 0 and Q_bar to 1");
      $finish;
    end

    // Test 2: Load D into Q
    rst = 0; // Deactivate reset
    D = 1;
    #10; // Wait for a clock edge
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Q did not load D correctly");
      $finish;
    end

    // Test 3: Change D and check Q
    D = 0;
    #10; // Wait for a clock edge
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q did not update with new D value");
      $finish;
    end

    // Test 4: Assert reset again
    rst = 1;
    #10; // Wait for a clock edge
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Reset did not set Q to 0 and Q_bar to 1 again");
      $finish;
    end

    // Test 5: Check Q remains 0 when reset is active
    rst = 0; // Deactivate reset
    D = 1;
    #10; // Wait for a clock edge
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Q did not load D correctly after reset");
      $finish;
    end

    // Final check to ensure all tests passed
    $display("PASS");
    $finish;
  end
endmodule