`timescale 1ns/1ps

module tb_more_non_ovr;
  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
  more_non_ovr uut (
    .clk(clk),
    .rst_n(rst_n),
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
    // Initialize signals
    rst_n = 0;
    x = 0;

    // Apply reset
    #10;
    rst_n = 1;

    // Test sequence
    // Check initial state (should be S0, z should be 0)
    #10;
    if (z !== 0) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Transition to S1
    x = 1; // S0 -> S0
    #10;
    if (z !== 0) begin
      $display("FAIL: State S0 check failed");
      $finish;
    end

    // Transition to S1
    x = 0; // S0 -> S1
    #10;
    if (z !== 0) begin
      $display("FAIL: State S1 check failed");
      $finish;
    end

    // Transition to S2
    x = 1; // S1 -> S2
    #10;
    if (z !== 0) begin
      $display("FAIL: State S2 check failed");
      $finish;
    end

    // Transition to S3
    x = 1; // S2 -> S3
    #10;
    if (z !== 0) begin
      $display("FAIL: State S3 check failed");
      $finish;
    end

    // Transition to S4
    x = 0; // S3 -> S4
    #10;
    if (z !== 1) begin
      $display("FAIL: State S4 check failed");
      $finish;
    end

    // Transition back to S0
    x = 1; // S4 -> S0
    #10;
    if (z !== 0) begin
      $display("FAIL: State S0 after S4 check failed");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule