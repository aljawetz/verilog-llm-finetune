`timescale 1ns/1ps

module tb_moore;
  reg clk;
  reg rst;
  reg x;
  wire z;

  // Instantiate the module under test
  moore uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .z(z)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 0;
    x = 0;

    // Apply reset
    #3 rst = 1; // Release reset after 3ns
    #10; // Wait for a few clock cycles

    // Test sequence
    // State A (initial state)
    if (uut.present_state !== 4'h1 || z !== 0) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Transition to state B
    x = 1; #10;
    if (uut.present_state !== 4'h2 || z !== 0) begin
      $display("FAIL: Transition from A to B failed");
      $finish;
    end

    // Stay in state B
    x = 1; #10;
    if (uut.present_state !== 4'h2 || z !== 0) begin
      $display("FAIL: Staying in state B failed");
      $finish;
    end

    // Transition to state D
    x = 0; #10;
    if (uut.present_state !== 4'h4 || z !== 1) begin
      $display("FAIL: Transition from B to D failed");
      $finish;
    end

    // Stay in state D
    x = 1; #10;
    if (uut.present_state !== 4'h4 || z !== 1) begin
      $display("FAIL: Staying in state D failed");
      $finish;
    end

    // Transition to state C
    x = 0; #10;
    if (uut.present_state !== 4'h3 || z !== 0) begin
      $display("FAIL: Transition from D to C failed");
      $finish;
    end

    // Transition back to state A
    x = 1; #10;
    if (uut.present_state !== 4'h1 || z !== 0) begin
      $display("FAIL: Transition from C to A failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule