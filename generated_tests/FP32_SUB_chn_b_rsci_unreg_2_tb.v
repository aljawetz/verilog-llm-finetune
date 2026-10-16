`timescale 1ns/1ps

module tb_FP32_SUB_chn_b_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP32_SUB_chn_b_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  // Clock and Reset Generation
  initial begin
    // Initialize inputs
    in_0 = 0;

    // Test sequence
    #10; // Wait for 10 time units
    in_0 = 1; // Drive input high
    #10; // Wait for 10 time units
    if (outsig !== 1) begin
      $display("FAIL: Output did not match input when in_0 was 1");
      $finish;
    end

    in_0 = 0; // Drive input low
    #10; // Wait for 10 time units
    if (outsig !== 0) begin
      $display("FAIL: Output did not match input when in_0 was 0");
      $finish;
    end

    // Additional test cases can be added here

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule