`timescale 1ns/1ps

module tb_CDP_ICVT_chn_data_in_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  CDP_ICVT_chn_data_in_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  // Test procedure
  initial begin
    // Initialize input
    in_0 = 0;

    // Wait for a short time
    #10;

    // Test case 1: Check when in_0 is 0
    if (outsig !== 0) begin
      $display("FAIL: Expected outsig to be 0 when in_0 is 0, got %b", outsig);
      $finish;
    end

    // Test case 2: Check when in_0 is 1
    in_0 = 1;
    #10; // Wait for the output to stabilize

    if (outsig !== 1) begin
      $display("FAIL: Expected outsig to be 1 when in_0 is 1, got %b", outsig);
      $finish;
    end

    // Test case 3: Check when in_0 toggles
    in_0 = 0;
    #10; // Wait for the output to stabilize

    if (outsig !== 0) begin
      $display("FAIL: Expected outsig to be 0 when in_0 is 0, got %b", outsig);
      $finish;
    end

    in_0 = 1;
    #10; // Wait for the output to stabilize

    if (outsig !== 1) begin
      $display("FAIL: Expected outsig to be 1 when in_0 is 1, got %b", outsig);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule