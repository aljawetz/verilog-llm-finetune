`timescale 1ns/1ps

module tb_dff_const4;

  reg clk;
  reg reset;
  wire q;

  // Instantiate the module under test (uut)
  dff_const4 uut (
    .clk(clk),
    .reset(reset),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check initial state after reset
    if (q !== 1'b1) begin
      $display("FAIL: Initial state after reset is not high");
      $finish;
    end

    // Wait for one clock cycle
    #10;

    // Check state after one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: State after one clock cycle is not high");
      $finish;
    end

    // Wait for another clock cycle
    #10;

    // Check state after two clock cycles
    if (q !== 1'b1) begin
      $display("FAIL: State after two clock cycles is not high");
      $finish;
    end

    // Assert that q remains high for several cycles
    #50; // Wait for five more clock cycles

    if (q !== 1'b1) begin
      $display("FAIL: State after multiple clock cycles is not high");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule