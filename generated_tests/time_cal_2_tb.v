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

  // Clock and Reset
  initial begin
    // Initialize inputs
    x = 0;

    // Test sequence
    #10; // Wait for 10 time units
    x = 1; // Change input to 1
    #10; // Wait for 10 time units
    if (z !== 1) begin
      $display("FAIL: Output z is not equal to input x when x = 1");
      $finish;
    end

    x = 0; // Change input back to 0
    #10; // Wait for 10 time units
    if (z !== 0) begin
      $display("FAIL: Output z is not equal to input x when x = 0");
      $finish;
    end

    // Additional checks
    x = 1; // Set input to 1 again
    #10; // Wait for 10 time units
    if (z !== 1) begin
      $display("FAIL: Output z is not equal to input x when x = 1");
      $finish;
    end

    x = 0; // Set input to 0 again
    #10; // Wait for 10 time units
    if (z !== 0) begin
      $display("FAIL: Output z is not equal to input x when x = 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule