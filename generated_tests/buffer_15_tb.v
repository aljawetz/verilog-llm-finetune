`timescale 1ns/1ps

module tb_buffer;

  // Inputs
  reg a;

  // Outputs
  wire s;

  // Instantiate the Unit Under Test (UUT)
  buffer uut (
    .a(a),
    .s(s)
  );

  initial begin
    // Initialize Inputs
    a = 0;

    // Wait for global reset to finish
    #10;

    // Test sequence
    // Test case 1: Check when a = 0
    a = 0;
    #10;
    if (s !== 0) begin
      $display("FAIL: Expected s = 0 when a = 0, got s = %b", s);
      $finish;
    end

    // Test case 2: Check when a = 1
    a = 1;
    #10;
    if (s !== 1) begin
      $display("FAIL: Expected s = 1 when a = 1, got s = %b", s);
      $finish;
    end

    // Test case 3: Check when a = 0 again
    a = 0;
    #10;
    if (s !== 0) begin
      $display("FAIL: Expected s = 0 when a = 0, got s = %b", s);
      $finish;
    end

    // Test case 4: Check when a = 1 again
    a = 1;
    #10;
    if (s !== 1) begin
      $display("FAIL: Expected s = 1 when a = 1, got s = %b", s);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule