`timescale 1ns/1ps

module tb_det_110101;

  reg clk;
  reg rstn;
  reg in;
  wire out;

  // Instantiate the module under test
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
    rstn = 1; // Release reset

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
      $display("FAIL: Output should be high after detecting 110101");
      $finish;
    end

    // Reset and check output
    #10 rstn = 0; // Assert reset
    #10 rstn = 1; // Release reset

    // Input: 110101 followed by some noise
    #10 in = 1; // S1
    #10 in = 1; // S11
    #10 in = 0; // S110
    #10 in = 1; // S1101
    #10 in = 0; // S11010
    #10 in = 1; // S110101
    #10;

    // Check output again
    if (uut.out !== 1) begin
      $display("FAIL: Output should be high after detecting 110101 again");
      $finish;
    end

    // Input: 110101 followed by invalid pattern
    #10 in = 0; // Invalid input
    #10 in = 1; // S1
    #10 in = 1; // S11
    #10 in = 0; // S110
    #10 in = 1; // S1101
    #10 in = 0; // S11010
    #10 in = 1; // S110101
    #10;

    // Check output again
    if (uut.out !== 1) begin
      $display("FAIL: Output should be high after detecting 110101 with noise");
      $finish;
    end

    // Final check with no input
    #10 in = 0; // Should not affect output
    #10;

    // Check output should be low
    if (uut.out !== 0) begin
      $display("FAIL: Output should be low after invalid input");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule