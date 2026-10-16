`timescale 1ns/1ps

module tb_sr_flipflop;

  reg clk;
  reg rst_n;
  reg s;
  reg r;
  wire q;
  wire q_bar;

  // Instantiate the SR Flip-Flop
  sr_flipflop uut (
    .clk(clk),
    .rst_n(rst_n),
    .s(s),
    .r(r),
    .q(q),
    .q_bar(q_bar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0; s = 0; r = 0;
    #10; // Wait for 10ns

    // Release reset
    rst_n = 1;
    #10;

    // Test setting the flip-flop
    s = 1; r = 0; // Set
    #10;
    if (q !== 1 || q_bar !== 0) begin
      $display("FAIL: Expected q=1, q_bar=0 after set");
      $finish;
    end

    // Test holding state
    s = 0; r = 0; // Hold
    #10;
    if (q !== 1 || q_bar !== 0) begin
      $display("FAIL: Expected q=1, q_bar=0 after hold");
      $finish;
    end

    // Test resetting the flip-flop
    s = 0; r = 1; // Reset
    #10;
    if (q !== 0 || q_bar !== 1) begin
      $display("FAIL: Expected q=0, q_bar=1 after reset");
      $finish;
    end

    // Test holding state again
    s = 0; r = 0; // Hold
    #10;
    if (q !== 0 || q_bar !== 1) begin
      $display("FAIL: Expected q=0, q_bar=1 after hold");
      $finish;
    end

    // Test invalid condition (both set and reset)
    s = 1; r = 1; // Invalid state
    #10;
    if (q !== 0 || q_bar !== 1) begin
      $display("FAIL: Expected q=0, q_bar=1 after invalid state");
      $finish;
    end

    // Test setting again
    s = 1; r = 0; // Set
    #10;
    if (q !== 1 || q_bar !== 0) begin
      $display("FAIL: Expected q=1, q_bar=0 after set");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule