`timescale 1ns/1ps

module tb_dff_mux;

  reg s;
  reg in0;
  reg in1;
  wire out;

  // Instantiate the module under test
  dff_mux uut (
    .s(s),
    .in0(in0),
    .in1(in1),
    .out(out)
  );

  initial begin
    // Test sequence
    // Test case 1: s = 0, in0 = 0, in1 = 0
    s = 0; in0 = 0; in1 = 0;
    #10;
    if (out !== 0) begin
      $display("FAIL: Test case 1 failed, expected out = 0, got out = %b", out);
      $finish;
    end

    // Test case 2: s = 0, in0 = 1, in1 = 0
    s = 0; in0 = 1; in1 = 0;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // Test case 3: s = 1, in0 = 0, in1 = 1
    s = 1; in0 = 0; in1 = 1;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // Test case 4: s = 1, in0 = 1, in1 = 0
    s = 1; in0 = 1; in1 = 0;
    #10;
    if (out !== 0) begin
      $display("FAIL: Test case 4 failed, expected out = 0, got out = %b", out);
      $finish;
    end

    // Test case 5: s = 0, in0 = 0, in1 = 1
    s = 0; in0 = 0; in1 = 1;
    #10;
    if (out !== 0) begin
      $display("FAIL: Test case 5 failed, expected out = 0, got out = %b", out);
      $finish;
    end

    // Test case 6: s = 1, in0 = 1, in1 = 1
    s = 1; in0 = 1; in1 = 1;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test case 6 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule