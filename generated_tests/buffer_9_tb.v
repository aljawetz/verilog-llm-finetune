`timescale 1ns/1ps

module tb_buffer;

  reg a;
  wire s;

  // Instantiate the module under test (uut)
  buffer uut (
    .a(a),
    .s(s)
  );

  initial begin
    // Test sequence
    // Test case 1: Check when a = 0
    a = 0;
    #10; // Wait for 10 time units
    if (s !== 0) begin
      $display("FAIL: Expected s = 0 when a = 0, got s = %b", s);
      $finish;
    end

    // Test case 2: Check when a = 1
    a = 1;
    #10; // Wait for 10 time units
    if (s !== 1) begin
      $display("FAIL: Expected s = 1 when a = 1, got s = %b", s);
      $finish;
    end

    // Additional checks can be added here

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule