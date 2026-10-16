`timescale 1ns/1ps

module tb_first_stage_of_sync;

  // Instantiate the module under test
  first_stage_of_sync uut();

  // Clock and reset signals
  reg clk;
  reg rst_n;

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Reset generation
  initial begin
    rst_n = 0; // Assert reset
    #10;
    rst_n = 1; // Deassert reset
    #10;
    rst_n = 0; // Assert reset again
    #10;
    rst_n = 1; // Deassert reset
  end

  // Test sequence
  initial begin
    // Wait for reset to deassert
    @(negedge rst_n);
    
    // Check the mode parameter
    if (uut.mode !== 0) begin
      $display("FAIL: mode parameter is not 0");
      $finish;
    end

    // Additional test cases can be added here

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule