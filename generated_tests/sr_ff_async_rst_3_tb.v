`timescale 1ns/1ps

module tb_sr_ff_async_rst;

  reg clk;
  reg rst;
  reg S;
  reg R;
  wire Q;
  wire Q_bar;

  // Instantiate the SR flip-flop module
  sr_ff_async_rst uut (
    .clk(clk),
    .rst(rst),
    .S(S),
    .R(R),
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
    S = 0;
    R = 0;
    #10; // Wait for reset to take effect

    // Test 1: Reset the flip-flop
    rst = 0; // Deassert reset
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Initial state after reset is incorrect");
      $finish;
    end

    // Test 2: Set the flip-flop
    S = 1; R = 0; // Set condition
    #10;
    if (Q !== 1'b1 || Q_bar !== 1'b0) begin
      $display("FAIL: Q should be 1 when S=1, R=0");
      $finish;
    end

    // Test 3: Reset the flip-flop
    S = 0; R = 1; // Reset condition
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Q should be 0 when S=0, R=1");
      $finish;
    end

    // Test 4: Hold state
    S = 0; R = 0; // Hold condition
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Q should remain 0 when S=0, R=0");
      $finish;
    end

    // Test 5: Set to 1
    S = 1; R = 0; // Set condition
    #10;
    if (Q !== 1'b1 || Q_bar !== 1'b0) begin
      $display("FAIL: Q should be 1 when S=1, R=0");
      $finish;
    end

    // Test 6: Invalid state
    S = 1; R = 1; // Invalid condition
    #10;
    if (Q !== 1'bx || Q_bar !== 1'bx) begin
      $display("FAIL: Q should be unknown when S=1, R=1");
      $finish;
    end

    // Test 7: Reset while in invalid state
    rst = 1; // Assert reset
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Q should be 0 after reset from invalid state");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule