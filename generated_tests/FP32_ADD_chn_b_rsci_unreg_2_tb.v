`timescale 1ns/1ps

module tb_FP32_ADD_chn_b_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP32_ADD_chn_b_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  // Test sequence
  initial begin
    // Test case 1: Check pass-through functionality
    in_0 = 1'b0;  // Set input to 0
    #10;          // Wait for 10 time units
    if (outsig !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected outsig = 0, got outsig = %b", outsig);
      $finish;
    end

    in_0 = 1'b1;  // Set input to 1
    #10;          // Wait for 10 time units
    if (outsig !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected outsig = 1, got outsig = %b", outsig);
      $finish;
    end

    // Additional test cases can be added here

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule