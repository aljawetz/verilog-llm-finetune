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

  // Test procedure
  initial begin
    // Test case 1: Check with in_0 = 0
    in_0 = 0;
    #10; // Wait for 10 time units
    if (outsig !== in_0) begin
      $display("FAIL: Test case 1 failed, expected outsig = %b, got outsig = %b", in_0, outsig);
      $finish;
    end

    // Test case 2: Check with in_0 = 1
    in_0 = 1;
    #10; // Wait for 10 time units
    if (outsig !== in_0) begin
      $display("FAIL: Test case 2 failed, expected outsig = %b, got outsig = %b", in_0, outsig);
      $finish;
    end

    // Test case 3: Check with in_0 = 0 again
    in_0 = 0;
    #10; // Wait for 10 time units
    if (outsig !== in_0) begin
      $display("FAIL: Test case 3 failed, expected outsig = %b, got outsig = %b", in_0, outsig);
      $finish;
    end

    // Test case 4: Check with in_0 = 1 again
    in_0 = 1;
    #10; // Wait for 10 time units
    if (outsig !== in_0) begin
      $display("FAIL: Test case 4 failed, expected outsig = %b, got outsig = %b", in_0, outsig);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule