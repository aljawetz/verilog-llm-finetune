`timescale 1ns/1ps

module tb_buffer;

  // Inputs
  reg a;

  // Outputs
  wire s;

  // Instantiate the Unit Under Test (UUT)
  buffer uut (
    .s(s),
    .a(a)
  );

  initial begin
    // Initialize Inputs
    a = 0;

    // Wait for global reset to finish
    #10;

    // Test sequence
    // Test case 1: Check when a = 0
    if (s !== 0) begin
      $display("FAIL: Expected s = 0 when a = 0, got s = %b", s);
      $finish;
    end

    // Test case 2: Check when a = 1
    a = 1;
    #10; // Wait for the output to stabilize
    if (s !== 1) begin
      $display("FAIL: Expected s = 1 when a = 1, got s = %b", s);
      $finish;
    end

    // Test case 3: Check when a toggles back to 0
    a = 0;
    #10; // Wait for the output to stabilize
    if (s !== 0) begin
      $display("FAIL: Expected s = 0 when a = 0, got s = %b", s);
      $finish;
    end

    // Test case 4: Check when a toggles to 1 again
    a = 1;
    #10; // Wait for the output to stabilize
    if (s !== 1) begin
      $display("FAIL: Expected s = 1 when a = 1, got s = %b", s);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule