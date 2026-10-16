`timescale 1ns/1ps

module tb_t_ff;

  reg clk;
  reg rst;
  reg t;
  wire q;

  // Instantiate the T flip-flop module
  t_ff uut (
    .clk(clk),
    .rst(rst),
    .t(t),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; // Start with reset
    t = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Toggle when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q=1 after toggling with t=1");
      $finish;
    end

    // Test case 2: Retain state when t is low
    t = 0; // Set t low
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q=1 after retaining state with t=0");
      $finish;
    end

    // Test case 3: Toggle again when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q=0 after toggling with t=1");
      $finish;
    end

    // Test case 4: Reset functionality
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q=0 after reset");
      $finish;
    end

    // Test case 5: Ensure no toggle on reset
    rst = 0; // Release reset
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q=1 after toggling with t=1");
      $finish;
    end

    // Test case 6: Final toggle
    t = 0; // Set t low
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q=1 after retaining state with t=0");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule