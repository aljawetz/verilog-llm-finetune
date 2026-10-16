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
    // Test case 1: Check initial condition
    in = 1'b0; #10;
    if (out !== 1'b0) begin
      $display("FAIL: Initial output is not as expected");
      $finish;
    end

    // Test case 2: Check when input is 1
    in = 1'b1; #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output does not match input when in = 1");
      $finish;
    end

    // Test case 3: Check when input is 0 again
    in = 1'b0; #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output does not match input when in = 0");
      $finish;
    end

    // Test case 4: Check for stability
    in = 1'b1; #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output does not remain stable when in = 1");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule