`timescale 1ns/1ps

module tb_FP32_TO_FP17_chn_o_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP32_TO_FP17_chn_o_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  // Test procedure
  initial begin
    // Initialize inputs
    in_0 = 0;

    // Wait for a short time
    #10;

    // Test case 1: Check if output matches input
    in_0 = 1'b0;
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Test case 1 failed, expected outsig = %b, got outsig = %b", in_0, outsig);
      $finish;
    end

    // Test case 2: Check if output matches input
    in_0 = 1'b1;
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Test case 2 failed, expected outsig = %b, got outsig = %b", in_0, outsig);
      $finish;
    end

    // Test case 3: Check if output matches input
    in_0 = 1'b0;
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Test case 3 failed, expected outsig = %b, got outsig = %b", in_0, outsig);
      $finish;
    end

    // Test case 4: Check if output matches input
    in_0 = 1'b1;
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Test case 4 failed, expected outsig = %b, got outsig = %b", in_0, outsig);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule