`timescale 1ns/1ps

module tb_FP32_MUL_chn_b_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP32_MUL_chn_b_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  initial begin
    // Test sequence
    // Test case 1: Check when in_0 is 0
    in_0 = 0;
    #10; // Wait for 10 time units
    if (outsig !== 0) begin
      $display("FAIL: Expected outsig to be 0 when in_0 is 0, got %b", outsig);
      $finish;
    end

    // Test case 2: Check when in_0 is 1
    in_0 = 1;
    #10; // Wait for 10 time units
    if (outsig !== 1) begin
      $display("FAIL: Expected outsig to be 1 when in_0 is 1, got %b", outsig);
      $finish;
    end

    // Test case 3: Check when in_0 is toggled
    in_0 = 0;
    #10; // Wait for 10 time units
    if (outsig !== 0) begin
      $display("FAIL: Expected outsig to be 0 when in_0 is toggled to 0, got %b", outsig);
      $finish;
    end

    in_0 = 1;
    #10; // Wait for 10 time units
    if (outsig !== 1) begin
      $display("FAIL: Expected outsig to be 1 when in_0 is toggled to 1, got %b", outsig);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule