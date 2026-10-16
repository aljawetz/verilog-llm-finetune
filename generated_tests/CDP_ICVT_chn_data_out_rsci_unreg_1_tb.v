`timescale 1ns/1ps

module tb_CDP_ICVT_chn_data_out_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  CDP_ICVT_chn_data_out_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  initial begin
    // Initialize Inputs
    in_0 = 0;

    // Wait for global reset to finish
    #10;

    // Test case 1: Check when in_0 is 0
    if (outsig !== 0) begin
      $display("FAIL: Expected outsig to be 0 when in_0 is 0");
      $finish;
    end

    // Test case 2: Check when in_0 is 1
    in_0 = 1;
    #10; // Wait for a short time to observe the output

    if (outsig !== 1) begin
      $display("FAIL: Expected outsig to be 1 when in_0 is 1");
      $finish;
    end

    // Test case 3: Check when in_0 toggles back to 0
    in_0 = 0;
    #10; // Wait for a short time to observe the output

    if (outsig !== 0) begin
      $display("FAIL: Expected outsig to be 0 when in_0 is toggled back to 0");
      $finish;
    end

    // Test case 4: Check when in_0 toggles to 1 again
    in_0 = 1;
    #10; // Wait for a short time to observe the output

    if (outsig !== 1) begin
      $display("FAIL: Expected outsig to be 1 when in_0 is toggled to 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule