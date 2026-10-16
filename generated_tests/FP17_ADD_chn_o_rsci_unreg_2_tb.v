`timescale 1ns/1ps

module tb_FP17_ADD_chn_o_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP17_ADD_chn_o_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  initial begin
    // Initialize Inputs
    in_0 = 0;

    // Wait for a moment and check the output
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Output does not match input at time 10ns");
      $finish;
    end

    // Test case 1: Set in_0 to 1
    in_0 = 1;
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Output does not match input at time 20ns");
      $finish;
    end

    // Test case 2: Set in_0 to 0
    in_0 = 0;
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Output does not match input at time 30ns");
      $finish;
    end

    // Test case 3: Set in_0 to 1 again
    in_0 = 1;
    #10;
    if (outsig !== in_0) begin
      $display("FAIL: Output does not match input at time 40ns");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule