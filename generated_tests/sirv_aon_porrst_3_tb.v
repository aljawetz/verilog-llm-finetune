`timescale 1ns/1ps

module tb_sirv_aon_porrst;

  // Instantiate the unit under test (UUT)
  wire porrst_n;
  sirv_aon_porrst uut (
    .porrst_n(porrst_n)
  );

  // Testbench signals
  reg clk;
  reg rst;

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Reset generation
  initial begin
    rst = 1; // Assert reset
    #10;
    rst = 0; // Deassert reset
    #10;
    rst = 1; // Assert reset again
    #10;
    rst = 0; // Deassert reset again
  end

  // Test sequence
  initial begin
    // Wait for a few clock cycles
    #20;

    // Check the output
    if (porrst_n !== 1'b1) begin
      $display("FAIL: porrst_n is not high as expected");
      $finish;
    end

    // Wait for more clock cycles
    #20;

    // Check the output again
    if (porrst_n !== 1'b1) begin
      $display("FAIL: porrst_n is not high as expected after more cycles");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule