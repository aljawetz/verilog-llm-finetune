`timescale 1ns/1ps

module tb_direct_interc;

  // Testbench signals
  reg [0:0] in;
  wire [0:0] out;

  // Instantiate the module under test (uut)
  direct_interc uut (
    .in(in),
    .out(out)
  );

  // Test procedure
  initial begin
    // Test case 1: Check when input is 0
    in = 1'b0; #10;
    if (out !== 1'b0) begin
      $display("FAIL: Expected out = 0 when in = 0, got out = %b", out);
      $finish;
    end

    // Test case 2: Check when input is 1
    in = 1'b1; #10;
    if (out !== 1'b1) begin
      $display("FAIL: Expected out = 1 when in = 1, got out = %b", out);
      $finish;
    end

    // Test case 3: Check for stable output
    in = 1'b0; #10;
    if (out !== 1'b0) begin
      $display("FAIL: Expected out = 0 when in = 0, got out = %b", out);
      $finish;
    end

    in = 1'b1; #10;
    if (out !== 1'b1) begin
      $display("FAIL: Expected out = 1 when in = 1, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule