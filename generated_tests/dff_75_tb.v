`timescale 1ns/1ps

module tb_dff;

  reg clk;
  reg reset;
  reg d;
  wire q;

  // Instantiate the D Flip-Flop
  dff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
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
    reset = 1;
    d = 0;

    // Wait for a clock edge
    #10;

    // Release reset
    reset = 0;

    // Test case 1: Check reset functionality
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test case 2: Check D input propagation
    d = 1;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: D input did not propagate to q");
      $finish;
    end

    // Test case 3: Check reset functionality again
    reset = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 after D input");
      $finish;
    end

    // Test case 4: Check D input propagation after reset
    reset = 0;
    d = 0;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: D input did not propagate to q after reset");
      $finish;
    end

    d = 1;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: D input did not propagate to q");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule