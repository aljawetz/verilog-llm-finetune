`timescale 1ns/1ps

module tb_ca_prng;

  // Parameters
  reg clk;
  reg reset_n;
  reg [31:0] init_pattern_data;
  reg load_init_pattern;
  reg next_pattern;
  reg [7:0] update_rule;
  reg load_update_rule;
  wire [31:0] prng_data;

  // Instantiate the Unit Under Test (UUT)
  ca_prng uut (
    .clk(clk),
    .reset_n(reset_n),
    .init_pattern_data(init_pattern_data),
    .load_init_pattern(load_init_pattern),
    .next_pattern(next_pattern),
    .update_rule(update_rule),
    .load_update_rule(load_update_rule),
    .prng_data(prng_data)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset_n = 0;
    init_pattern_data = 32'h00000001; // Initial pattern
    load_init_pattern = 0;
    next_pattern = 0;
    update_rule = 8'b00011110; // Default Rule 30
    load_update_rule = 0;

    // Apply reset
    #10 reset_n = 1; // Release reset
    #10;

    // Load initial pattern
    load_init_pattern = 1;
    #10 load_init_pattern = 0; // Clear load signal

    // Check initial state
    if (prng_data !== 32'h00000001) begin
      $display("FAIL: Initial state mismatch");
      $finish;
    end

    // Generate next pattern
    next_pattern = 1;
    #10 next_pattern = 0; // Clear next pattern signal

    // Check next state
    if (prng_data === 32'h00000001) begin
      $display("FAIL: Next state should not be the same as initial state");
      $finish;
    end

    // Change update rule
    load_update_rule = 1;
    #10 load_update_rule = 0; // Clear load update rule signal

    // Generate next pattern again
    next_pattern = 1;
    #10 next_pattern = 0; // Clear next pattern signal

    // Check that the output changes again
    if (prng_data === 32'h00000001) begin
      $display("FAIL: Next state should not revert to initial state");
      $finish;
    end

    // Test with different initial pattern
    init_pattern_data = 32'hFFFFFFFF; // New initial pattern
    load_init_pattern = 1;
    #10 load_init_pattern = 0; // Clear load signal

    // Check new initial state
    if (prng_data !== 32'hFFFFFFFF) begin
      $display("FAIL: New initial state mismatch");
      $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
  end

endmodule