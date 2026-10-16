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

  // Clock and Reset Generation
  initial begin
    // Initialize inputs
    in_0 = 0;

    // Test sequence
    #10; // Wait for 10 ns
    in_0 = 1; // Test case 1
    #10;
    if (outsig !== 1) begin
      $display("FAIL: Output did not match input for in_0 = 1");
      $finish;
    end

    #10; // Wait for 10 ns
    in_0 = 0; // Test case 2
    #10;
    if (outsig !== 0) begin
      $display("FAIL: Output did not match input for in_0 = 0");
      $finish;
    end

    #10; // Wait for 10 ns
    in_0 = 1; // Test case 3
    #10;
    if (outsig !== 1) begin
      $display("FAIL: Output did not match input for in_0 = 1");
      $finish;
    end

    #10; // Wait for 10 ns
    in_0 = 0; // Test case 4
    #10;
    if (outsig !== 0) begin
      $display("FAIL: Output did not match input for in_0 = 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule