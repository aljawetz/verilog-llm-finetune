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
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset_n = 0;
    init_pattern_data = 32'b0;
    load_init_pattern = 0;
    next_pattern = 0;
    update_rule = 8'b0;
    load_update_rule = 0;

    // Apply reset
    #10;
    reset_n = 1;

    // Test 1: Load initial pattern
    init_pattern_data = 32'b10101010101010101010101010101010; // Example pattern
    load_init_pattern = 1;
    #10;
    load_init_pattern = 0; // Clear load signal

    // Check if the initial pattern is loaded correctly
    if (prng_data !== 32'b10101010101010101010101010101010) begin
      $display("FAIL: Initial pattern not loaded correctly");
      $finish;
    end

    // Test 2: Update rule loading
    update_rule = 8'b11110000; // Example update rule
    load_update_rule = 1;
    #10;
    load_update_rule = 0; // Clear load signal

    // Test 3: Generate next pattern
    next_pattern = 1;
    #10;
    next_pattern = 0; // Clear next pattern signal

    // Check if the pattern has changed (this is a simple check, actual expected value may vary)
    if (prng_data === 32'b10101010101010101010101010101010) begin
      $display("FAIL: Pattern did not change after next_pattern signal");
      $finish;
    end

    // Test 4: Reset functionality
    reset_n = 0;
    #10;
    reset_n = 1;

    // Check if the output is reset
    if (prng_data !== 32'b0) begin
      $display("FAIL: Output not reset to zero");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule