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
    load_init_pattern = 0;
    next_pattern = 0;
    load_update_rule = 0;
    update_rule = 8'b00011110; // Default Rule 30
    init_pattern_data = 32'b00000000000000000000000000000001; // Initial pattern

    // Apply reset
    #10;
    reset_n = 1; // Release reset

    // Test 1: Load initial pattern
    load_init_pattern = 1;
    #10;
    load_init_pattern = 0;
    #10;

    // Check if the initial pattern is loaded correctly
    if (prng_data !== init_pattern_data) begin
      $display("FAIL: Initial pattern not loaded correctly");
      $finish;
    end

    // Test 2: Generate next pattern
    next_pattern = 1;
    #10;
    next_pattern = 0;
    #10;

    // Check if the next pattern is generated correctly
    if (prng_data === init_pattern_data) begin
      $display("FAIL: Next pattern should not be the same as initial pattern");
      $finish;
    end

    // Test 3: Load a new update rule
    load_update_rule = 1;
    update_rule = 8'b00011010; // New rule
    #10;
    load_update_rule = 0;
    #10;

    // Test 4: Generate next pattern with new rule
    next_pattern = 1;
    #10;
    next_pattern = 0;
    #10;

    // Check if the new pattern is generated correctly
    if (prng_data === init_pattern_data) begin
      $display("FAIL: Next pattern should not be the same as initial pattern after rule change");
      $finish;
    end

    // Test 5: Reset the module
    reset_n = 0;
    #10;
    reset_n = 1;
    #10;

    // Check if the state is reset
    if (prng_data !== 32'b00000000000000000000000000000000) begin
      $display("FAIL: State not reset correctly");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule