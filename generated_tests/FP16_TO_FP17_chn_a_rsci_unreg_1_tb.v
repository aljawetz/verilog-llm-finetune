`timescale 1ns/1ps

module tb_FP16_TO_FP17_chn_a_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP16_TO_FP17_chn_a_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  initial begin
    // Initialize Inputs
    in_0 = 0;

    // Test case 1: Check with in_0 = 0
    #10;
    if (outsig !== 0) begin
      $display("FAIL: Test case 1 failed, expected outsig = 0, got outsig = %b", outsig);
      $finish;
    end

    // Test case 2: Check with in_0 = 1
    in_0 = 1;
    #10;
    if (outsig !== 1) begin
      $display("FAIL: Test case 2 failed, expected outsig = 1, got outsig = %b", outsig);
      $finish;
    end

    // Test case 3: Check with in_0 = 0 again
    in_0 = 0;
    #10;
    if (outsig !== 0) begin
      $display("FAIL: Test case 3 failed, expected outsig = 0, got outsig = %b", outsig);
      $finish;
    end

    // Test case 4: Check with in_0 = 1 again
    in_0 = 1;
    #10;
    if (outsig !== 1) begin
      $display("FAIL: Test case 4 failed, expected outsig = 1, got outsig = %b", outsig);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule