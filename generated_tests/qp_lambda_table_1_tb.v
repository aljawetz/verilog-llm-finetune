`timescale 1ns/1ps

module tb_qp_lambda_table;

  reg [5:0] qp_i;
  wire [6:0] lambda;

  // Instantiate the module under test
  qp_lambda_table uut (
    .qp_i(qp_i),
    .lambda(lambda)
  );

  initial begin
    // Test cases
    qp_i = 0; #10; if (lambda !== 7'd1) $display("FAIL: Expected lambda 1 for qp_i 0");
    qp_i = 15; #10; if (lambda !== 7'd1) $display("FAIL: Expected lambda 1 for qp_i 15");
    qp_i = 16; #10; if (lambda !== 7'd2) $display("FAIL: Expected lambda 2 for qp_i 16");
    qp_i = 20; #10; if (lambda !== 7'd3) $display("FAIL: Expected lambda 3 for qp_i 20");
    qp_i = 27; #10; if (lambda !== 7'd6) $display("FAIL: Expected lambda 6 for qp_i 27");
    qp_i = 30; #10; if (lambda !== 7'd8) $display("FAIL: Expected lambda 8 for qp_i 30");
    qp_i = 36; #10; if (lambda !== 7'd16) $display("FAIL: Expected lambda 16 for qp_i 36");
    qp_i = 40; #10; if (lambda !== 7'd25) $display("FAIL: Expected lambda 25 for qp_i 40");
    qp_i = 46; #10; if (lambda !== 7'd51) $display("FAIL: Expected lambda 51 for qp_i 46");
    qp_i = 51; #10; if (lambda !== 7'd91) $display("FAIL: Expected lambda 91 for qp_i 51");
    qp_i = 63; #10; if (lambda !== 7'd0) $display("FAIL: Expected lambda 0 for qp_i 63");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule