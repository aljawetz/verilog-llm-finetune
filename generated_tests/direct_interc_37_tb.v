`timescale 1ns/1ps

module tb_direct_interc;

  // Inputs
  reg [0:0] in;

  // Outputs
  wire [0:0] out;

  // Instantiate the Unit Under Test (UUT)
  direct_interc uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Initialize input
    in = 1'b0;

    // Test case 1: Check when input is 0
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output should be 0 when input is 0");
      $finish;
    end

    // Test case 2: Check when input is 1
    in = 1'b1;
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output should be 1 when input is 1");
      $finish;
    end

    // Test case 3: Check when input toggles
    in = 1'b0;
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output should be 0 when input is 0");
      $finish;
    end

    in = 1'b1;
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output should be 1 when input is 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule