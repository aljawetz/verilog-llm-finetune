`timescale 1ns/1ps

module tb_dff;

  reg clk;
  reg rst;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .clk(clk),
    .rst(rst),
    .d(d),
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
    rst = 1; // Assert reset
    d = 0;
    #10; // Wait for 10ns

    // Check reset functionality
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    rst = 0; // Deassert reset
    #10; // Wait for 10ns

    // Test D flip-flop behavior
    d = 1; // Set D to 1
    #10; // Wait for 10ns
    if (q !== 1) begin
      $display("FAIL: q did not follow d (expected 1)");
      $finish;
    end

    d = 0; // Set D to 0
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: q did not follow d (expected 0)");
      $finish;
    end

    // Test reset functionality again
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    rst = 0; // Deassert reset
    #10; // Wait for 10ns

    // Final test with multiple values
    d = 1; #10; // Set D to 1
    if (q !== 1) begin
      $display("FAIL: q did not follow d (expected 1)");
      $finish;
    end

    d = 0; #10; // Set D to 0
    if (q !== 0) begin
      $display("FAIL: q did not follow d (expected 0)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule