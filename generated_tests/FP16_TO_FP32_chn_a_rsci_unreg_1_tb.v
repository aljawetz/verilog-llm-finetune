`timescale 1ns/1ps

module tb_FP16_TO_FP32_chn_a_rsci_unreg;

  // Inputs
  reg in_0;

  // Outputs
  wire outsig;

  // Instantiate the Unit Under Test (UUT)
  FP16_TO_FP32_chn_a_rsci_unreg uut (
    .in_0(in_0),
    .outsig(outsig)
  );

  // Clock and Reset (not used in this simple module, but included for completeness)
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Test case 1: Check with in_0 = 0
    in_0 = 0;
    #10; // Wait for 10ns
    if (outsig !== 0) begin
      $display("FAIL: Expected outsig = 0, got %b", outsig);
      $finish;
    end

    // Test case 2: Check with in_0 = 1
    in_0 = 1;
    #10; // Wait for 10ns
    if (outsig !== 1) begin
      $display("FAIL: Expected outsig = 1, got %b", outsig);
      $finish;
    end

    // Test case 3: Check with in_0 = 0 again
    in_0 = 0;
    #10; // Wait for 10ns
    if (outsig !== 0) begin
      $display("FAIL: Expected outsig = 0, got %b", outsig);
      $finish;
    end

    // Test case 4: Check with in_0 = 1 again
    in_0 = 1;
    #10; // Wait for 10ns
    if (outsig !== 1) begin
      $display("FAIL: Expected outsig = 1, got %b", outsig);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule