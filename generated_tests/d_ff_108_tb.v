`timescale 1ns/1ps

module tb_d_ff;

  reg clock;
  reg reset;
  reg d_in;
  wire Q_out;
  wire Qb_out;

  // Instantiate the D flip-flop
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

    // Wait for a clock edge
    #10;

    // Test reset functionality
    reset = 1; // Assert reset
    #10;
    if (Q_out !== 1'b0 || Qb_out !== 1'b1) begin
      $display("FAIL: Reset did not set Q_out to 0 and Qb_out to 1");
      $finish;
    end

    // Release reset and test D input
    reset = 0; // Deassert reset
    d_in = 1;  // Set D input to 1
    #10; // Wait for clock edge
    if (Q_out !== 1'b1 || Qb_out !== 1'b0) begin
      $display("FAIL: Q_out did not follow d_in when reset is deasserted");
      $finish;
    end

    // Change D input
    d_in = 0;  // Set D input to 0
    #10; // Wait for clock edge
    if (Q_out !== 1'b0 || Qb_out !== 1'b1) begin
      $display("FAIL: Q_out did not follow d_in when D input changed");
      $finish;
    end

    // Assert reset again
    reset = 1; // Assert reset
    #10;
    if (Q_out !== 1'b0 || Qb_out !== 1'b1) begin
      $display("FAIL: Reset did not set Q_out to 0 and Qb_out to 1 again");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule