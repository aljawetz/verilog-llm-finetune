`timescale 1ns/1ps

module tb_mux_2x1;

  reg x1;
  reg x2;
  reg s;
  wire f;

  // Instantiate the module under test (uut)
  mux_2x1 uut (
    .x1(x1),
    .x2(x2),
    .s(s),
    .f(f)
  );

  initial begin
    // Test sequence
    // Test case 1: s = 0, expect f = x1
    x1 = 1'b0; x2 = 1'b1; s = 1'b0;
    #10;
    if (f !== x1) begin
      $display("FAIL: Test case 1 failed, expected f = %b, got f = %b", x1, f);
      $finish;
    end

    // Test case 2: s = 1, expect f = x2
    x1 = 1'b0; x2 = 1'b1; s = 1'b1;
    #10;
    if (f !== x2) begin
      $display("FAIL: Test case 2 failed, expected f = %b, got f = %b", x2, f);
      $finish;
    end

    // Test case 3: s = 0, expect f = x1
    x1 = 1'b1; x2 = 1'b0; s = 1'b0;
    #10;
    if (f !== x1) begin
      $display("FAIL: Test case 3 failed, expected f = %b, got f = %b", x1, f);
      $finish;
    end

    // Test case 4: s = 1, expect f = x2
    x1 = 1'b1; x2 = 1'b0; s = 1'b1;
    #10;
    if (f !== x2) begin
      $display("FAIL: Test case 4 failed, expected f = %b, got f = %b", x2, f);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule