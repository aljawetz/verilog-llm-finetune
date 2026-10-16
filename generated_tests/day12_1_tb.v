`timescale 1ns/1ps

module tb_day12;

  reg clk;
  reg reset;
  reg x_i;
  wire det_o;

  // Instantiate the module under test (uut)
  day12 uut (
    .clk(clk),
    .reset(reset),
    .x_i(x_i),
    .det_o(det_o)
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
    x_i = 0;
    #10; // Wait for 10ns
    reset = 0;

    // Test sequence to check for detection of the pattern 1110_1101_1011
    // Shift in bits to form the pattern
    x_i = 1; #10; // 1
    x_i = 1; #10; // 1
    x_i = 1; #10; // 1
    x_i = 0; #10; // 0
    x_i = 1; #10; // 1
    x_i = 1; #10; // 1
    x_i = 0; #10; // 0
    x_i = 1; #10; // 1
    x_i = 1; #10; // 1
    x_i = 0; #10; // 0
    x_i = 1; #10; // 1
    x_i = 1; #10; // 1

    // Check if the output is high when the pattern is matched
    if (det_o !== 1) begin
      $display("FAIL: Pattern not detected when expected.");
      $finish;
    end

    // Reset the module
    reset = 1; #10;
    reset = 0; #10;

    // Test with a different sequence that should not match
    x_i = 0; #10; // 0
    x_i = 0; #10; // 0
    x_i = 0; #10; // 0
    x_i = 0; #10; // 0
    x_i = 0; #10; // 0
    x_i = 0; #10; // 0
    x_i = 0; #10; // 0
    x_i = 0; #10; // 0
    x_i = 0; #10; // 0
    x_i = 0; #10; // 0
    x_i = 0; #10; // 0
    x_i = 0; #10; // 0

    // Check if the output is low when the pattern is not matched
    if (det_o !== 0) begin
      $display("FAIL: False positive detected.");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule