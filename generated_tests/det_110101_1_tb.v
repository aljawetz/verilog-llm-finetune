`timescale 1ns/1ps

module tb_det_110101;

  reg clk;
  reg rstn;
  reg in;
  wire out;

  // Instantiate the module under test (uut)
  det_110101 uut (
    .clk(clk),
    .rstn(rstn),
    .in(in),
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
    rstn = 0;
    in = 0;

    // Apply reset
    #10;
    rstn = 1;

    // Test sequence to detect 110101
    // Input: 110101
    #10 in = 1; // S1
    #10 in = 1; // S11
    #10 in = 0; // S110
    #10 in = 1; // S1101
    #10 in = 0; // S11010
    #10 in = 1; // S110101
    #10;

    // Check output
    if (uut.out !== 1) begin
      $display("FAIL: Output should be 1 after detecting 110101");
      $finish;
    end

    // Reset and test with a non-matching sequence
    #10;
    rstn = 0;
    #10;
    rstn = 1;

    // Input: 111
    #10 in = 1; // S1
    #10 in = 1; // S11
    #10 in = 1; // S11 (should not transition to next state)
    #10;

    // Check output
    if (uut.out !== 0) begin
      $display("FAIL: Output should be 0 for non-matching sequence");
      $finish;
    end

    // Input: 11010
    #10 in = 1; // S1
    #10 in = 1; // S11
    #10 in = 0; // S110
    #10 in = 1; // S1101
    #10 in = 0; // S11010
    #10;

    // Check output
    if (uut.out !== 0) begin
      $display("FAIL: Output should be 0 for non-matching sequence");
      $finish;
    end

    // Input: 110101 again
    #10 in = 1; // S1
    #10 in = 1; // S11
    #10 in = 0; // S110
    #10 in = 1; // S1101
    #10 in = 0; // S11010
    #10 in = 1; // S110101
    #10;

    // Check output
    if (uut.out !== 1) begin
      $display("FAIL: Output should be 1 after detecting 110101");
      $finish;
    end

    // Final check with reset
    #10;
    rstn = 0;
    #10;
    rstn = 1;

    // Input: 0
    #10 in = 0; // Should remain in IDLE
    #10;

    // Check output
    if (uut.out !== 0) begin
      $display("FAIL: Output should be 0 in IDLE state");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule