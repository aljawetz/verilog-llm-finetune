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

    // Check if output Y is 0
    if (Y !== 1'b0) begin
      $display("FAIL: Output Y is not 0");
      $finish;
    end

    // Additional checks can be added here if needed

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule