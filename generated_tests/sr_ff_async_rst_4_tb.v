`timescale 1ns/1ps

module tb_sr_ff_async_rst;

  reg clk;
  reg rst;
  reg S;
  reg R;
  wire Q;
  wire Q_bar;

  // Instantiate the SR flip-flop
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
    rst = 1; S = 0; R = 0;
    #10; // Wait for 10ns

    // Test 1: Asynchronous reset
    rst = 0; // Release reset
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Initial state after reset is incorrect");
      $finish;
    end

    // Test 2: Set state
    S = 1; R = 0; // Set condition
    #10;
    if (Q !== 1'b1 || Q_bar !== 1'b0) begin
      $display("FAIL: Q should be 1 when S=1 and R=0");
      $finish;
    end

    // Test 3: Reset state
    S = 0; R = 1; // Reset condition
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Q should be 0 when S=0 and R=1");
      $finish;
    end

    // Test 4: Hold state
    S = 0; R = 0; // Hold condition
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Q should remain 0 when S=0 and R=0");
      $finish;
    end

    // Test 5: Invalid state
    S = 1; R = 1; // Invalid condition
    #10;
    if (Q !== 1'bx || Q_bar !== 1'bx) begin
      $display("FAIL: Q should be unknown when S=1 and R=1");
      $finish;
    end

    // Test 6: Asynchronous reset again
    rst = 1; // Assert reset
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Q should be 0 after asynchronous reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule