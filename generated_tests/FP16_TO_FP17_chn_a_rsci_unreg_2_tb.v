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

  // Test procedure
  initial begin
    // Initialize inputs
    in_0 = 0;

    // Wait for a short time
    #10;

    // Test case 1: Check if output matches input
    in_0 = 1'b0; // Set input to 0
    #10; // Wait for output to settle
    if (outsig !== in_0) begin
      $display("FAIL: Output does not match input for in_0 = %b", in_0);
      $finish;
    end

    // Test case 2: Check if output matches input
    in_0 = 1'b1; // Set input to 1
    #10; // Wait for output to settle
    if (outsig !== in_0) begin
      $display("FAIL: Output does not match input for in_0 = %b", in_0);
      $finish;
    end

    // Test case 3: Check if output matches input
    in_0 = 1'b0; // Set input to 0 again
    #10; // Wait for output to settle
    if (outsig !== in_0) begin
      $display("FAIL: Output does not match input for in_0 = %b", in_0);
      $finish;
    end

    // Test case 4: Check if output matches input
    in_0 = 1'b1; // Set input to 1 again
    #10; // Wait for output to settle
    if (outsig !== in_0) begin
      $display("FAIL: Output does not match input for in_0 = %b", in_0);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule