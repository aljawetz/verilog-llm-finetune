`timescale 1ns/1ps

module tb_buffer;

  reg a;
  wire z;

  // Instantiate the module under test
  buffer uut (
    .a(a),
    .z(z)
  );

  initial begin
    // Test sequence
    // Test case 1: Check when a = 0
    a = 0;
    #10; // Wait for 10 time units
    if (z !== 0) begin
      $display("FAIL: Expected z = 0 when a = 0, but got z = %b", z);
      $finish;
    end

    // Test case 2: Check when a = 1
    a = 1;
    #10; // Wait for 10 time units
    if (z !== 1) begin
      $display("FAIL: Expected z = 1 when a = 1, but got z = %b", z);
      $finish;
    end

    // Test case 3: Check when a toggles
    a = 0;
    #10; // Wait for 10 time units
    if (z !== 0) begin
      $display("FAIL: Expected z = 0 when a = 0, but got z = %b", z);
      $finish;
    end

    a = 1;
    #10; // Wait for 10 time units
    if (z !== 1) begin
      $display("FAIL: Expected z = 1 when a = 1, but got z = %b", z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule