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
    // Test case 1: Check initial state
    in = 1'b0; #10;
    if (out !== 1'b0) begin
      $display("FAIL: Initial output is not as expected");
      $finish;
    end

    // Test case 2: Check output when input is 1
    in = 1'b1; #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output is not as expected when input is 1");
      $finish;
    end

    // Test case 3: Check output when input is 0 again
    in = 1'b0; #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output is not as expected when input is 0 again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule