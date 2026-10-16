`timescale 1ns/1ps

module tb_NV_BLKBOX_SRC0_X;

  // Output wire
  wire Y;

  // Instantiate the module under test (uut)
  NV_BLKBOX_SRC0_X uut (
    .Y(Y)
  );

  // Test procedure
  initial begin
    // Wait for a short time to stabilize
    #10;

    // Check the output Y
    if (Y !== 1'b0) begin
      $display("FAIL: Output Y is not 0");
      $finish;
    end

    // Additional checks can be added here if needed

    // If all checks pass
    $display("PASS");
    $finish;
  end

  // Clock generation (not needed for this specific module but included for completeness)
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Reset logic (not needed for this specific module but included for completeness)
  reg rst_n;
  initial begin
    rst_n = 0; // Assert reset
    #15;
    rst_n = 1; // Deassert reset
  end

endmodule