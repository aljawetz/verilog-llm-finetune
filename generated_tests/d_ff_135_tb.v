`timescale 1ns/1ps

module tb_d_ff;

  reg din;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
    .q(q),
    .din(din),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    din = 0;
    rst = 0;

    // Test case 1: Reset the flip-flop
    rst = 1; // Assert reset
    #10;     // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test case 2: Capture data
    rst = 0; // Deassert reset
    din = 1; // Set input data
    #10;     // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not capture din when rst is low");
      $finish;
    end

    // Test case 3: Change input data
    din = 0; // Change input data
    #10;     // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not capture new din value");
      $finish;
    end

    // Test case 4: Assert reset again
    rst = 1; // Assert reset
    #10;     // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Test case 5: Check if flip-flop holds value when reset is low
    rst = 0; // Deassert reset
    din = 1; // Set input data
    #10;     // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not capture din after reset");
      $finish;
    end

    // Final check: Ensure q holds value
    #10;     // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q changed unexpectedly when it should hold value");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule