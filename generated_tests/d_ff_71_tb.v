`timescale 1ns/1ps

module tb_d_ff;

  // Inputs
  reg d;
  reg rst_n;
  reg clk;

  // Outputs
  wire q;
  wire qb;

  // Instantiate the Unit Under Test (UUT)
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
    // Initialize inputs
    d = 0;
    rst_n = 0; // Assert reset
    #10; // Wait for 10ns
    rst_n = 1; // Deassert reset
    #10;

    // Test case 1: Check reset behavior
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test case 2: Check D flip-flop behavior
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: D flip-flop did not set q to 1 and qb to 0");
      $finish;
    end

    // Test case 3: Change D to 0
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: D flip-flop did not set q to 0 and qb to 1");
      $finish;
    end

    // Test case 4: Assert reset again
    rst_n = 0; // Assert reset
    #10; // Wait for reset to take effect
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1 again");
      $finish;
    end

    // Test case 5: Deassert reset and check D input
    rst_n = 1; // Deassert reset
    #10;
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: D flip-flop did not set q to 1 and qb to 0 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule