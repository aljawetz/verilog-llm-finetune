`timescale 1ns/1ps

module tb_dff;

  reg d;
  reg clk;
  reg reset;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .d(d),
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
    // Initialize signals
    d = 0;
    reset = 0;

    // Test 1: Check reset functionality
    reset = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check D input transfer
    reset = 0; // Deactivate reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d when reset is inactive");
      $finish;
    end

    // Test 3: Check D input transfer with reset
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d when reset is inactive");
      $finish;
    end

    // Test 4: Check reset functionality again
    reset = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Test 5: Check D input transfer after reset
    reset = 0; // Deactivate reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d after reset is deactivated");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule