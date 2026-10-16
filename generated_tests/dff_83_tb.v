`timescale 1ns/1ps

module tb_dff;
  reg clk;
  reg rst;
  reg d;
  wire q;

  // Instantiate the D Flip-Flop
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

    // Deassert reset
    rst = 0;
    #10; // Wait for 10ns

    // Test case 1: Check output after setting d
    d = 1;
    #10; // Wait for 10ns
    if (q !== 1) begin
      $display("FAIL: Expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 2: Check output after changing d
    d = 0;
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 3: Check reset functionality
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after reset, got q = %b", q);
      $finish;
    end

    // Test case 4: Check output after reset is deasserted
    rst = 0;
    d = 1;
    #10; // Wait for 10ns
    if (q !== 1) begin
      $display("FAIL: Expected q = 1 after setting d = 1, got q = %b", q);
      $finish;
    end

    // Test case 5: Final reset check
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after final reset, got q = %b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule