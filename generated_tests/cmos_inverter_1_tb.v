`timescale 1ns/1ps

module tb_cmos_inverter;

  reg a;
  wire y;

  // Instantiate the module under test
  cmos_inverter uut (
    .a(a),
    .y(y)
  );

  initial begin
    // Test sequence
    // Test case 1: Input is low (0), output should be high (1)
    a = 0;
    #10; // Wait for 10 time units
    if (y !== 1) begin
      $display("FAIL: Expected output 1 for input 0, got %b", y);
      $finish;
    end

    // Test case 2: Input is high (1), output should be low (0)
    a = 1;
    #10; // Wait for 10 time units
    if (y !== 0) begin
      $display("FAIL: Expected output 0 for input 1, got %b", y);
      $finish;
    end

    // Test case 3: Check for stable output when input remains the same
    a = 0;
    #10; // Wait for 10 time units
    if (y !== 1) begin
      $display("FAIL: Expected output 1 for input 0, got %b", y);
      $finish;
    end

    a = 1;
    #10; // Wait for 10 time units
    if (y !== 0) begin
      $display("FAIL: Expected output 0 for input 1, got %b", y);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule