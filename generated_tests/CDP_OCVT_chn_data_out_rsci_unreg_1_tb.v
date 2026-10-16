`timescale 1ns/1ps

module tb_CDP_OCVT_chn_data_out_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  CDP_OCVT_chn_data_out_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  // Clock and Reset Generation
  initial begin
    // Initialize inputs
    in_0 = 0;

    // Test sequence
    #10;
    in_0 = 1; // Test case 1: Set in_0 to 1
    #10;
    if (outsig !== 1) begin
      $display("FAIL: Expected outsig to be 1 when in_0 is 1, got %b", outsig);
      $finish;
    end

    #10;
    in_0 = 0; // Test case 2: Set in_0 to 0
    #10;
    if (outsig !== 0) begin
      $display("FAIL: Expected outsig to be 0 when in_0 is 0, got %b", outsig);
      $finish;
    end

    #10;
    in_0 = 1; // Test case 3: Set in_0 to 1 again
    #10;
    if (outsig !== 1) begin
      $display("FAIL: Expected outsig to be 1 when in_0 is 1, got %b", outsig);
      $finish;
    end

    #10;
    in_0 = 0; // Test case 4: Set in_0 to 0 again
    #10;
    if (outsig !== 0) begin
      $display("FAIL: Expected outsig to be 0 when in_0 is 0, got %b", outsig);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule