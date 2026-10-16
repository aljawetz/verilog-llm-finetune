`timescale 1ns/1ps

module tb_UINT16_TO_FP17_chn_o_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  UINT16_TO_FP17_chn_o_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  initial begin
    // Initialize Inputs
    in_0 = 0;

    // Wait for global reset to finish
    #10;

    // Test case 1: Check if output matches input when input is 0
    in_0 = 0;
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Test case 1 failed, expected outsig = %b, got outsig = %b", in_0, outsig);
      $finish;
    end

    // Test case 2: Check if output matches input when input is 1
    in_0 = 1;
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Test case 2 failed, expected outsig = %b, got outsig = %b", in_0, outsig);
      $finish;
    end

    // Test case 3: Check if output matches input when input is 0 again
    in_0 = 0;
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Test case 3 failed, expected outsig = %b, got outsig = %b", in_0, outsig);
      $finish;
    end

    // Test case 4: Check if output matches input when input is 1 again
    in_0 = 1;
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