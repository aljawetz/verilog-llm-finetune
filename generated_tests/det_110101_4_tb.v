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
    // Initialize
    rstn = 0;
    in = 0;
    #10; // Wait for some time

    // Release reset
    rstn = 1;
    #10;

    // Test sequence to detect 110101
    // Input: 110101
    in = 1; #10; // S1
    in = 1; #10; // S11
    in = 0; #10; // S110
    in = 1; #10; // S1101
    in = 0; #10; // S11010
    in = 1; #10; // S110101

    // Check output
    if (out !== 1) begin
      $display("FAIL: Output should be high after detecting 110101");
      $finish;
    end

    // Reset and check output
    rstn = 0; #10;
    rstn = 1; #10;

    // Input: 110101 followed by other bits
    in = 1; #10; // S1
    in = 1; #10; // S11
    in = 0; #10; // S110
    in = 1; #10; // S1101
    in = 0; #10; // S11010
    in = 1; #10; // S110101

    // Check output
    if (out !== 1) begin
      $display("FAIL: Output should be high after detecting 110101");
      $finish;
    end

    // Input: 110101 followed by 0
    in = 0; #10; // Transition to IDLE
    if (out !== 0) begin
      $display("FAIL: Output should be low after transition to IDLE");
      $finish;
    end

    // Input: 110101 again
    in = 1; #10; // S1
    in = 1; #10; // S11
    in = 0; #10; // S110
    in = 1; #10; // S1101
    in = 0; #10; // S11010
    in = 1; #10; // S110101

    // Final check
    if (out !== 1) begin
      $display("FAIL: Output should be high after detecting 110101");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule