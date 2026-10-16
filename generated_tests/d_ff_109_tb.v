`timescale 1ns/1ps

module tb_d_ff;

  reg clk;
  reg reset;
  reg d;
  wire q;
  wire qbar;

  // Instantiate the D flip-flop
  d_ff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .qbar(qbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;

    // Wait for a clock cycle
    #10;

    // Test 1: Reset functionality
    reset = 0; // Active low reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check D input propagation
    d = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: q did not follow d when reset is low");
      $finish;
    end

    // Test 3: Check reset functionality again
    reset = 1; // Activate reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 4: Check D input propagation again
    reset = 0; // Deactivate reset
    d = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: q did not follow d when reset is low");
      $finish;
    end

    d = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: q did not follow d when reset is low");
      $finish;
    end

    // Final check for qbar
    if (qbar !== ~q) begin
      $display("FAIL: qbar is not the complement of q");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule