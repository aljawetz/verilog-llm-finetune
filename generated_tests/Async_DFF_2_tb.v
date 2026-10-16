`timescale 1ns/1ps

module tb_Async_DFF;

  reg clk;
  reg D;
  reg reset_n;
  reg clear_n;
  wire Q;

  // Instantiate the module under test (uut)
  Async_DFF uut (
    .clk(clk),
    .D(D),
    .reset_n(reset_n),
    .clear_n(clear_n),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset_n = 1;
    clear_n = 1;
    D = 0;

    // Test 1: Check reset functionality
    reset_n = 0; // Assert reset
    #10; // Wait for a clock edge
    if (Q !== 1'b0) begin
      $display("FAIL: Reset did not set Q to 0");
      $finish;
    end
    reset_n = 1; // Deassert reset

    // Test 2: Check D capture
    D = 1; // Set D to 1
    #10; // Wait for a clock edge
    if (Q !== 1'b1) begin
      $display("FAIL: Q did not capture D value of 1");
      $finish;
    end

    // Test 3: Check clear functionality
    clear_n = 0; // Assert clear
    #10; // Wait for a clock edge
    if (Q !== 1'b1) begin
      $display("FAIL: Clear did not set Q to 1");
      $finish;
    end
    clear_n = 1; // Deassert clear

    // Test 4: Check D capture again
    D = 0; // Set D to 0
    #10; // Wait for a clock edge
    if (Q !== 1'b0) begin
      $display("FAIL: Q did not capture D value of 0");
      $finish;
    end

    // Test 5: Check reset again
    reset_n = 0; // Assert reset
    #10; // Wait for a clock edge
    if (Q !== 1'b0) begin
      $display("FAIL: Reset did not set Q to 0");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule