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

    // Wait for a clock edge
    #10;

    // Test synchronous reset
    rst = 0; // Deactivate reset
    #10;

    // Test setting Q
    S = 1; R = 0; // Set Q
    #10;
    if (Q !== 1'b1 || Q_bar !== 1'b0) begin
      $display("FAIL: Q should be 1 when S=1 and R=0");
      $finish;
    end

    // Test clearing Q
    S = 0; R = 1; // Clear Q
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Q should be 0 when S=0 and R=1");
      $finish;
    end

    // Test holding state
    S = 0; R = 0; // Hold state
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Q should remain 0 when S=0 and R=0");
      $finish;
    end

    // Test invalid state
    S = 1; R = 1; // Invalid state
    #10;
    if (Q !== 1'bx) begin
      $display("FAIL: Q should be undefined (x) when S=1 and R=1");
      $finish;
    end

    // Test synchronous reset again
    rst = 1; // Activate reset
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule