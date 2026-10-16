`timescale 1ns/1ps

module tb_lambda_tab;

  reg [5:0] qp_i;
  wire [6:0] lambda_o;

  // Instantiate the module under test
  lambda_tab uut (
    .qp_i(qp_i),
    .lambda_o(lambda_o)
  );

  initial begin
    // Test cases
    qp_i = 0; #10; if (lambda_o !== 7'd1) $display("FAIL: Expected 1 for qp_i=0, got %d", lambda_o);
    qp_i = 15; #10; if (lambda_o !== 7'd1) $display("FAIL: Expected 1 for qp_i=15, got %d", lambda_o);
    qp_i = 16; #10; if (lambda_o !== 7'd2) $display("FAIL: Expected 2 for qp_i=16, got %d", lambda_o);
    qp_i = 20; #10; if (lambda_o !== 7'd3) $display("FAIL: Expected 3 for qp_i=20, got %d", lambda_o);
    qp_i = 27; #10; if (lambda_o !== 7'd6) $display("FAIL: Expected 6 for qp_i=27, got %d", lambda_o);
    qp_i = 30; #10; if (lambda_o !== 7'd8) $display("FAIL: Expected 8 for qp_i=30, got %d", lambda_o);
    qp_i = 39; #10; if (lambda_o !== 7'd23) $display("FAIL: Expected 23 for qp_i=39, got %d", lambda_o);
    qp_i = 45; #10; if (lambda_o !== 7'd45) $display("FAIL: Expected 45 for qp_i=45, got %d", lambda_o);
    qp_i = 51; #10; if (lambda_o !== 7'd91) $display("FAIL: Expected 91 for qp_i=51, got %d", lambda_o);
    qp_i = 52; #10; if (lambda_o !== 7'd0) $display("FAIL: Expected 0 for qp_i=52, got %d", lambda_o);
    qp_i = 63; #10; if (lambda_o !== 7'd0) $display("FAIL: Expected 0 for qp_i=63, got %d", lambda_o);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule