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

    // Test case 1: Check output when input is 0
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Expected out = 0, got out = %b", out);
      $finish;
    end

    // Test case 2: Check output when input is 1
    in = 1'b1;
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Expected out = 1, got out = %b", out);
      $finish;
    end

    // Test case 3: Check output when input is toggled
    in = 1'b0;
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Expected out = 0, got out = %b", out);
      $finish;
    end

    in = 1'b1;
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Expected out = 1, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule