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
    // Initialize Inputs
    in = 1'b0;

    // Wait for global reset
    #10;

    // Test case 1: Check output when input is 0
    in = 1'b0;
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected out = 0, got out = %b", out);
      $finish;
    end

    // Test case 2: Check output when input is 1
    in = 1'b1;
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // Test case 3: Check output when input changes from 0 to 1
    in = 1'b0;
    #10;
    in = 1'b1;
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // Test case 4: Check output when input changes from 1 to 0
    in = 1'b1;
    #10;
    in = 1'b0;
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