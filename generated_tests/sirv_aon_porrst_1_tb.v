`timescale 1ns/1ps

module tb_sirv_aon_porrst;

  // Instantiate the module under test (uut)
  wire porrst_n;
  sirv_aon_porrst uut (
    .porrst_n(porrst_n)
  );

  initial begin
    // Wait for a short time to stabilize
    #10;

    // Check the output
    if (porrst_n !== 1'b1) begin
      $display("FAIL: porrst_n is not 1'b1");
      $finish;
    end

    // Additional checks can be added here if necessary

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule