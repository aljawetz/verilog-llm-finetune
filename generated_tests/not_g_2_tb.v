`timescale 1ns/1ps

module tb_not_g;

  // Inputs
  reg a;

  // Outputs
  wire out;

  // Instantiate the module under test (uut)
  not_g uut (
    .a(a),
    .out(out)
  );

  initial begin
    // Test sequence
    // Test case 1: a = 0, expect out = 1
    a = 0;
    #10; // Wait for 10 time units
    if (out !== 1'b1) begin
      $display("FAIL: Expected out = 1 when a = 0, got out = %b", out);
      $finish;
    end

    // Test case 2: a = 1, expect out = 0
    a = 1;
    #10; // Wait for 10 time units
    if (out !== 1'b0) begin
      $display("FAIL: Expected out = 0 when a = 1, got out = %b", out);
      $finish;
    end

    // Test case 3: a = 0 again, expect out = 1
    a = 0;
    #10; // Wait for 10 time units
    if (out !== 1'b1) begin
      $display("FAIL: Expected out = 1 when a = 0, got out = %b", out);
      $finish;
    end

    // Test case 4: a = 1 again, expect out = 0
    a = 1;
    #10; // Wait for 10 time units
    if (out !== 1'b0) begin
      $display("FAIL: Expected out = 0 when a = 1, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule