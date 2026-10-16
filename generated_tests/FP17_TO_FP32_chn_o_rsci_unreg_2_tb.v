`timescale 1ns/1ps

module tb_FP17_TO_FP32_chn_o_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP17_TO_FP32_chn_o_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  // Clock and Reset (not used in this simple module, but included for completeness)
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  initial begin
    // Initialize Inputs
    in_0 = 0;

    // Wait for global reset to finish
    #10;

    // Test case 1: Check if output follows input
    in_0 = 1;
    #10;
    if (outsig !== 1) begin
      $display("FAIL: Test case 1 failed, expected outsig = 1, got outsig = %b", outsig);
      $finish;
    end

    // Test case 2: Check if output follows input
    in_0 = 0;
    #10;
    if (outsig !== 0) begin
      $display("FAIL: Test case 2 failed, expected outsig = 0, got outsig = %b", outsig);
      $finish;
    end

    // Test case 3: Check if output follows input
    in_0 = 1;
    #10;
    if (outsig !== 1) begin
      $display("FAIL: Test case 3 failed, expected outsig = 1, got outsig = %b", outsig);
      $finish;
    end

    // Test case 4: Check if output follows input
    in_0 = 0;
    #10;
    if (outsig !== 0) begin
      $display("FAIL: Test case 4 failed, expected outsig = 0, got outsig = %b", outsig);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule