`timescale 1ns/1ps

module tb_intra_lambda;

  reg [5:0] qp_i;
  wire [6:0] lambda_o;

  intra_lambda uut (
    .qp_i(qp_i),
    .lambda_o(lambda_o)
  );

  initial begin
    // Test cases
    qp_i = 6'd0; #10; if (lambda_o !== 7'd1) $display("FAIL: Expected 1 for qp_i=0, got %d", lambda_o);
    qp_i = 6'd15; #10; if (lambda_o !== 7'd1) $display("FAIL: Expected 1 for qp_i=15, got %d", lambda_o);
    qp_i = 6'd16; #10; if (lambda_o !== 7'd2) $display("FAIL: Expected 2 for qp_i=16, got %d", lambda_o);
    qp_i = 6'd20; #10; if (lambda_o !== 7'd3) $display("FAIL: Expected 3 for qp_i=20, got %d", lambda_o);
    qp_i = 6'd23; #10; if (lambda_o !== 7'd4) $display("FAIL: Expected 4 for qp_i=23, got %d", lambda_o);
    qp_i = 6'd27; #10; if (lambda_o !== 7'd6) $display("FAIL: Expected 6 for qp_i=27, got %d", lambda_o);
    qp_i = 6'd30; #10; if (lambda_o !== 7'd8) $display("FAIL: Expected 8 for qp_i=30, got %d", lambda_o);
    qp_i = 6'd39; #10; if (lambda_o !== 7'd23) $display("FAIL: Expected 23 for qp_i=39, got %d", lambda_o);
    qp_i = 6'd45; #10; if (lambda_o !== 7'd45) $display("FAIL: Expected 45 for qp_i=45, got %d", lambda_o);
    qp_i = 6'd50; #10; if (lambda_o !== 7'd81) $display("FAIL: Expected 81 for qp_i=50, got %d", lambda_o);
    qp_i = 6'd51; #10; if (lambda_o !== 7'd91) $display("FAIL: Expected 91 for qp_i=51, got %d", lambda_o);
    qp_i = 6'd52; #10; if (lambda_o !== 7'd0) $display("FAIL: Expected 0 for qp_i=52, got %d", lambda_o);

    $display("PASS");
    $finish;
  end

endmodule