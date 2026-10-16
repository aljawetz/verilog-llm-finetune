`timescale 1ns/1ps

module tb_d_ff;

  // Inputs
  reg d;
  reg rst_n;
  reg clk;

  // Outputs
  wire q;
  wire qb;

  // Instantiate the module under test (uut)
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

    // Check reset behavior
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Release reset
    rst_n = 1;
    #10; // Wait for 10ns

    // Test D input
    d = 1; // Set D to 1
    #10; // Wait for 10ns
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: After setting D to 1, q should be 1 and qb should be 0");
      $finish;
    end

    // Change D input
    d = 0; // Set D to 0
    #10; // Wait for 10ns
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: After setting D to 0, q should be 0 and qb should be 1");
      $finish;
    end

    // Assert reset again
    rst_n = 0; // Assert reset
    #10; // Wait for 10ns
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1 again");
      $finish;
    end

    // Release reset and test again
    rst_n = 1;
    #10; // Wait for 10ns
    d = 1; // Set D to 1
    #10; // Wait for 10ns
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: After setting D to 1 again, q should be 1 and qb should be 0");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end

endmodule