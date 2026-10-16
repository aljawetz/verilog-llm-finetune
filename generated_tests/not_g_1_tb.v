`timescale 1ns/1ps

module tb_not_g;

  // Inputs
  reg a;

  // Outputs
  wire out;

  // Instantiate the Unit Under Test (UUT)
  not_g uut (
    .a(a),
    .out(out)
  );

  initial begin
    // Test case 1: Check output when a = 0
    a = 0;
    #10; // Wait for 10 time units
    if (out !== 1) begin
      $display("FAIL: Expected out = 1 when a = 0, got out = %b", out);
      $finish;
    end

    // Test case 2: Check output when a = 1
    a = 1;
    #10; // Wait for 10 time units
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 when a = 1, got out = %b", out);
      $finish;
    end

    // Test case 3: Check output stability
    a = 0;
    #10; // Wait for 10 time units
    if (out !== 1) begin
      $display("FAIL: Expected out = 1 when a = 0, got out = %b", out);
      $finish;
    end

    a = 1;
    #10; // Wait for 10 time units
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 when a = 1, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule