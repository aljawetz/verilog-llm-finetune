`timescale 1ns/1ps

module tb_FP32_TO_FP17_chn_a_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP32_TO_FP17_chn_a_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  // Clock and Reset Generation
  initial begin
    // Initialize inputs
    in_0 = 0;

    // Test sequence
    #10; // Wait for 10 time units
    in_0 = 1; // Test with in_0 = 1
    #10; // Wait for 10 time units
    if (outsig !== 1) begin
      $display("FAIL: Expected outsig to be 1 when in_0 is 1");
      $finish;
    end

    in_0 = 0; // Test with in_0 = 0
    #10; // Wait for 10 time units
    if (outsig !== 0) begin
      $display("FAIL: Expected outsig to be 0 when in_0 is 0");
      $finish;
    end

    // Additional tests can be added here

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule