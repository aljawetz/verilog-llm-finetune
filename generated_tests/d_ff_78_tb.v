`timescale 1ns/1ps

module tb_d_ff;

  reg clock;
  reg reset;
  reg d_in;
  wire Q_out;
  wire Qb_out;

  // Instantiate the D Flip-Flop
  d_ff uut (
    .clock(clock),
    .reset(reset),
    .d_in(d_in),
    .Q_out(Q_out),
    .Qb_out(Qb_out)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    d_in = 0;

    // Apply reset
    #10;
    reset = 0;

    // Test case 1: Check reset functionality
    #10;
    if (Q_out !== 0 || Qb_out !== 1) begin
      $display("FAIL: Reset did not set Q_out to 0 and Qb_out to 1");
      $finish;
    end

    // Test case 2: Check D input propagation
    d_in = 1;
    #10;
    if (Q_out !== 1 || Qb_out !== 0) begin
      $display("FAIL: D input did not propagate correctly");
      $finish;
    end

    // Test case 3: Check D input change
    d_in = 0;
    #10;
    if (Q_out !== 0 || Qb_out !== 1) begin
      $display("FAIL: D input did not propagate correctly on change");
      $finish;
    end

    // Test case 4: Check reset functionality again
    reset = 1;
    #10;
    if (Q_out !== 0 || Qb_out !== 1) begin
      $display("FAIL: Reset did not set Q_out to 0 and Qb_out to 1");
      $finish;
    end

    // Final check
    reset = 0;
    d_in = 1;
    #10;
    if (Q_out !== 1 || Qb_out !== 0) begin
      $display("FAIL: Final state did not match expected values");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule