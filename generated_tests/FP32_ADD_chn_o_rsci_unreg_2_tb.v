`timescale 1ns/1ps

module tb_FP32_ADD_chn_o_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP32_ADD_chn_o_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  initial begin
    // Initialize Inputs
    in_0 = 0;

    // Wait for global reset to finish
    #10;

    // Test case 1: Check output when in_0 is 0
    if (outsig !== 0) begin
      $display("FAIL: Test case 1 failed, expected outsig = 0, got outsig = %b", outsig);
      $finish;
    end

    // Test case 2: Check output when in_0 is 1
    in_0 = 1;
    #10; // Wait for the output to settle
    if (outsig !== 1) begin
      $display("FAIL: Test case 2 failed, expected outsig = 1, got outsig = %b", outsig);
      $finish;
    end

    // Test case 3: Check output when in_0 is toggled back to 0
    in_0 = 0;
    #10; // Wait for the output to settle
    if (outsig !== 0) begin
      $display("FAIL: Test case 3 failed, expected outsig = 0, got outsig = %b", outsig);
      $finish;
    end

    // Test case 4: Check output when in_0 is toggled to 1 again
    in_0 = 1;
    #10; // Wait for the output to settle
    if (outsig !== 1) begin
      $display("FAIL: Test case 4 failed, expected outsig = 1, got outsig = %b", outsig);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule