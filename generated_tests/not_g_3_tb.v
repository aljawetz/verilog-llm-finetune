`timescale 1ns/1ps

module tb_not_g;
  reg a;
  wire out;

  // Instantiate the module under test
  not_g uut (
    .a(a),
    .out(out)
  );

  initial begin
    // Test sequence
    // Test case 1: a = 0, expect out = 1
    a = 0;
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // Test case 2: a = 1, expect out = 0
    a = 1;
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected out = 0, got out = %b", out);
      $finish;
    end

    // Test case 3: a = 0, expect out = 1 again
    a = 0;
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // Test case 4: a = 1, expect out = 0 again
    a = 1;
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected out = 0, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule