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

    // Test case 1: Check if output matches input when input is 0
    if (out !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected out = 0, got out = %b", out);
      $finish;
    end

    // Test case 2: Check if output matches input when input is 1
    in = 1'b1;
    #10; // Wait for a time to observe output

    if (out !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // Test case 3: Check if output matches input when input is toggled
    in = 1'b0;
    #10; // Wait for a time to observe output

    if (out !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected out = 0, got out = %b", out);
      $finish;
    end

    in = 1'b1;
    #10; // Wait for a time to observe output

    if (out !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule