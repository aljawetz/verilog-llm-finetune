`timescale 1ns/1ps

module tb_FP17_SUB_chn_a_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP17_SUB_chn_a_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  // Test sequence
  initial begin
    // Test case 1: Check initial condition
    in_0 = 0;
    #10;
    if (outsig !== 0) begin
      $display("FAIL: Initial condition failed");
      $finish;
    end

    // Test case 2: Check when in_0 is 1
    in_0 = 1;
    #10;
    if (outsig !== 1) begin
      $display("FAIL: Output did not match input when in_0 is 1");
      $finish;
    end

    // Test case 3: Check when in_0 is 0 again
    in_0 = 0;
    #10;
    if (outsig !== 0) begin
      $display("FAIL: Output did not match input when in_0 is 0");
      $finish;
    end

    // Test case 4: Check for stability
    in_0 = 1;
    #10;
    if (outsig !== 1) begin
      $display("FAIL: Output did not remain stable when in_0 is 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule