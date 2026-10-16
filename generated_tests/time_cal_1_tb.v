`timescale 1ns/1ps

module tb_time_cal;

  // Inputs
  reg x;

  // Outputs
  wire z;

  // Instantiate the Unit Under Test (UUT)
  time_cal uut (
    .z(z),
    .x(x)
  );

  // Clock and reset generation
  initial begin
    // Initialize inputs
    x = 0;

    // Wait for global reset
    #10;

    // Test sequence
    // Test case 1: Check when x = 0
    if (z !== 0) begin
      $display("FAIL: Expected z = 0 when x = 0, got z = %b", z);
      $finish;
    end

    // Test case 2: Check when x = 1
    x = 1;
    #10; // Wait for a short time to observe the output
    if (z !== 1) begin
      $display("FAIL: Expected z = 1 when x = 1, got z = %b", z);
      $finish;
    end

    // Test case 3: Check when x toggles back to 0
    x = 0;
    #10; // Wait for a short time to observe the output
    if (z !== 0) begin
      $display("FAIL: Expected z = 0 when x = 0, got z = %b", z);
      $finish;
    end

    // Test case 4: Check when x toggles to 1 again
    x = 1;
    #10; // Wait for a short time to observe the output
    if (z !== 1) begin
      $display("FAIL: Expected z = 1 when x = 1, got z = %b", z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule