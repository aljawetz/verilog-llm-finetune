`timescale 1ns/1ps

module tb_clock_divide_by_2;
  reg clk;
  reg reset;
  wire Q;

  // Instantiate the module under test (uut)
  clock_divide_by_2 uut (
    .clk(clk),
    .reset(reset),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Check initial state of Q
    if (Q !== 1'b0) begin
      $display("FAIL: Initial state of Q is not 0");
      $finish;
    end

    // Wait for two clock cycles and check Q
    #10; // Wait for 1 clock cycle
    if (Q !== 1'b1) begin
      $display("FAIL: Q is not 1 after 1 clock cycle");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (Q !== 1'b0) begin
      $display("FAIL: Q is not 0 after 2 clock cycles");
      $finish;
    end

    // Assert Q toggles correctly for a few more cycles
    #10; // Wait for 1 clock cycle
    if (Q !== 1'b1) begin
      $display("FAIL: Q is not 1 after 3 clock cycles");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (Q !== 1'b0) begin
      $display("FAIL: Q is not 0 after 4 clock cycles");
      $finish;
    end

    // Test reset functionality
    reset = 1; // Assert reset
    #10; // Wait for 1 clock cycle
    reset = 0; // Release reset

    // Check Q after reset
    if (Q !== 1'b0) begin
      $display("FAIL: Q is not 0 after reset");
      $finish;
    end

    // Final check for toggling
    #10; // Wait for 1 clock cycle
    if (Q !== 1'b1) begin
      $display("FAIL: Q is not 1 after reset and 1 clock cycle");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (Q !== 1'b0) begin
      $display("FAIL: Q is not 0 after reset and 2 clock cycles");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule