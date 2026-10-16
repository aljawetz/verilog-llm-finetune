`timescale 1ns/1ps

module tb_d_ff;

  // Testbench signals
  reg d;
  reg rst_n;
  reg clk;
  wire q;
  wire qb;

  // Instantiate the D flip-flop
  d_ff uut (
    .q(q),
    .qb(qb),
    .d(d),
    .rst_n(rst_n),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0; // Assert reset
    d = 0;
    #10; // Wait for 10ns

    // Release reset
    rst_n = 1;
    #10; // Wait for 10ns

    // Test case 1: Load D = 0
    d = 0;
    #10; // Wait for 10ns
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Test case 1 failed (D=0)");
      $finish;
    end

    // Test case 2: Load D = 1
    d = 1;
    #10; // Wait for 10ns
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: Test case 2 failed (D=1)");
      $finish;
    end

    // Test case 3: Assert reset
    rst_n = 0;
    #10; // Wait for 10ns
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Test case 3 failed (reset asserted)");
      $finish;
    end

    // Test case 4: Release reset and load D = 0
    rst_n = 1;
    d = 0;
    #10; // Wait for 10ns
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Test case 4 failed (D=0 after reset)");
      $finish;
    end

    // Test case 5: Load D = 1 again
    d = 1;
    #10; // Wait for 10ns
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: Test case 5 failed (D=1 after reset)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule