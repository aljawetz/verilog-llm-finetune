`timescale 1ns/1ps

module tb_inv;

  reg in;
  wire out;

  // Instantiate the module under test (uut)
  inv uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test sequence
    // Test case 1: Check when input is 0
    in = 0; #10;
    if (out !== 1) begin
      $display("FAIL: Expected out = 1 when in = 0, got out = %b", out);
      $finish;
    end

    // Test case 2: Check when input is 1
    in = 1; #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 when in = 1, got out = %b", out);
      $finish;
    end

    // Test case 3: Check when input toggles
    in = 0; #10;
    if (out !== 1) begin
      $display("FAIL: Expected out = 1 when in = 0, got out = %b", out);
      $finish;
    end

    in = 1; #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 when in = 1, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule