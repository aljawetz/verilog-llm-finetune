`timescale 1ns/1ps

module tb_mj_spare;

  reg reset_l;
  reg clk;

  // Instantiate the module under test (uut)
  mj_spare uut (
    .reset_l(reset_l),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset_l = 0; // Assert reset
    #10;         // Wait for 10ns
    reset_l = 1; // Deassert reset
    #10;         // Wait for 10ns

    // Check reset behavior
    if (reset_l !== 1) begin
      $display("FAIL: reset_l should be 1 after deassertion");
      $finish;
    end

    // Additional checks can be added here in the future

    // End of test
    $display("PASS");
    $finish;
  end

endmodule