`timescale 1ns/1ps

module tb_sr_ff_sync_rst;

  reg clk;
  reg rst;
  reg S;
  reg R;
  wire Q;
  wire Q_bar;

  // Instantiate the SR flip-flop module
  sr_ff_sync_rst uut (
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
    // Initialize inputs
    rst = 1;
    S = 0;
    R = 0;
    
    // Wait for a clock cycle
    #10;

    // Test synchronous reset
    rst = 0; // Deactivate reset
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Initial state after reset is incorrect");
      $finish;
    end

    // Test setting the flip-flop
    S = 1; R = 0; // Set condition
    #10;
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Q should be set to 1");
      $finish;
    end

    // Test clearing the flip-flop
    S = 0; R = 1; // Reset condition
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q should be cleared to 0");
      $finish;
    end

    // Test holding state
    S = 0; R = 0; // Hold condition
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q should hold state 0");
      $finish;
    end

    // Test setting again
    S = 1; R = 0; // Set condition
    #10;
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Q should be set to 1 again");
      $finish;
    end

    // Test invalid state
    S = 1; R = 1; // Invalid condition
    #10;
    if (Q !== 1'bx) begin
      $display("FAIL: Q should be in an invalid state");
      $finish;
    end

    // Test synchronous reset again
    rst = 1; // Activate reset
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Q should be reset to 0");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule