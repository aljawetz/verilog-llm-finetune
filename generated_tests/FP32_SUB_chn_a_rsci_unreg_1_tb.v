`timescale 1ns/1ps

module tb_FP32_SUB_chn_a_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP32_SUB_chn_a_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  // Clock and Reset
  initial begin
    // Initialize inputs
    in_0 = 0;

    // Test sequence
    #10; // Wait for 10 time units
    in_0 = 1; // Test case 1
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Test case 1 failed, expected %b but got %b", in_0, outsig);
      $finish;
    end

    #10; // Wait for 10 time units
    in_0 = 0; // Test case 2
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Test case 2 failed, expected %b but got %b", in_0, outsig);
      $finish;
    end

    #10; // Wait for 10 time units
    in_0 = 1; // Test case 3
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Test case 3 failed, expected %b but got %b", in_0, outsig);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule