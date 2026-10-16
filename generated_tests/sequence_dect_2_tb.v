`timescale 1ns/1ps

module tb_sequence_dect;

  reg clk;
  reg rst;
  reg dn;
  wire y;

  // Instantiate the module under test
  sequence_dect uut (
    .clk(clk),
    .rst(rst),
    .dn(dn),
    .y(y)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    dn = 0;
    #10; // Wait for a clock cycle
    rst = 0;

    // Test sequence to detect "1100"
    // Expected output: y should go high after receiving "1100"
    #10 dn = 1; // S0 -> S1
    #10 dn = 1; // S1 -> S2
    #10 dn = 0; // S2 -> S3
    #10 dn = 0; // S3 -> S4, y should be high
    #10 if (y !== 1'b1) begin
      $display("FAIL: y should be high after detecting '1100'");
      $finish;
    end

    // Reset the FSM
    #10 rst = 1; 
    #10 rst = 0;

    // Test with a mismatch
    #10 dn = 1; // S0 -> S1
    #10 dn = 0; // S1 -> S0 (mismatch)
    #10 if (y !== 1'b0) begin
      $display("FAIL: y should be low after a mismatch");
      $finish;
    end

    // Test valid sequence again
    #10 dn = 1; // S0 -> S1
    #10 dn = 1; // S1 -> S2
    #10 dn = 0; // S2 -> S3
    #10 dn = 0; // S3 -> S4, y should be high again
    #10 if (y !== 1'b1) begin
      $display("FAIL: y should be high after detecting '1100' again");
      $finish;
    end

    // Test with additional mismatches
    #10 dn = 1; // S4 -> S0 (mismatch)
    #10 if (y !== 1'b0) begin
      $display("FAIL: y should be low after a mismatch from S4");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule