`timescale 1ns/1ps

module tb_d_flipflop;

  reg d;
  reg clk;
  reg enable;
  reg reset;
  wire out;

  // Instantiate the D Flip-Flop
  d_flipflop uut (
    .d(d),
    .clk(clk),
    .enable(enable),
    .reset(reset),
    .out(out)
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
    enable = 0;
    reset = 1; // Start with reset active
    #10; // Wait for 10ns

    // Deactivate reset
    reset = 0;
    #10;

    // Test case 1: Check reset functionality
    if (out !== 0) begin
      $display("FAIL: Reset did not set output to 0");
      $finish;
    end

    // Test case 2: Enable and set d
    enable = 1;
    d = 1;
    #10; // Wait for one clock cycle
    if (out !== 1) begin
      $display("FAIL: Output did not follow d when enabled");
      $finish;
    end

    // Test case 3: Change d while enabled
    d = 0;
    #10; // Wait for one clock cycle
    if (out !== 0) begin
      $display("FAIL: Output did not follow d when enabled");
      $finish;
    end

    // Test case 4: Disable enable
    enable = 0;
    d = 1; // Change d but should not affect output
    #10; // Wait for one clock cycle
    if (out !== 0) begin
      $display("FAIL: Output changed when enable was low");
      $finish;
    end

    // Test case 5: Re-enable and set d
    enable = 1;
    d = 1;
    #10; // Wait for one clock cycle
    if (out !== 1) begin
      $display("FAIL: Output did not follow d when re-enabled");
      $finish;
    end

    // Test case 6: Assert reset again
    reset = 1;
    #10; // Wait for reset to take effect
    if (out !== 0) begin
      $display("FAIL: Reset did not set output to 0");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule