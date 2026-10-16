`timescale 1ns/1ps

module tb_D_FF_reset;

  reg D;
  reg clk;
  reg reset_n;
  reg clear_n;
  wire Q;

  // Instantiate the D_FF_reset module
  D_FF_reset uut (
    .D(D),
    .clk(clk),
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
    // Initialize inputs
    D = 0;
    reset_n = 1;
    clear_n = 1;

    // Test 1: Check reset functionality
    reset_n = 0; // Assert reset
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Reset did not set Q to 0");
      $finish;
    end
    reset_n = 1; // Deassert reset

    // Test 2: Check D input on falling edge of clock
    D = 1; // Set D to 1
    #10; // Wait for falling edge
    if (Q !== 1'b1) begin
      $display("FAIL: Q did not follow D on falling edge");
      $finish;
    end

    // Test 3: Check clear functionality
    clear_n = 0; // Assert clear
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Clear did not set Q to 0");
      $finish;
    end
    clear_n = 1; // Deassert clear

    // Test 4: Check D input again after clear
    D = 0; // Set D to 0
    #10; // Wait for falling edge
    if (Q !== 1'b0) begin
      $display("FAIL: Q did not follow D on falling edge after clear");
      $finish;
    end

    // Test 5: Check D input with D=1
    D = 1; // Set D to 1
    #10; // Wait for falling edge
    if (Q !== 1'b1) begin
      $display("FAIL: Q did not follow D on falling edge");
      $finish;
    end

    // Test 6: Check reset functionality again
    reset_n = 0; // Assert reset
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Reset did not set Q to 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule