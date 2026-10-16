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

    // Apply test sequences
    #10 x = 1; // Test case 1: Set x to 1
    #10 if (z !== 1) begin
      $display("FAIL: Expected z to be 1 when x is 1, but got z = %b", z);
      $finish;
    end

    #10 x = 0; // Test case 2: Set x to 0
    #10 if (z !== 0) begin
      $display("FAIL: Expected z to be 0 when x is 0, but got z = %b", z);
      $finish;
    end

    #10 x = 1; // Test case 3: Set x to 1 again
    #10 if (z !== 1) begin
      $display("FAIL: Expected z to be 1 when x is 1, but got z = %b", z);
      $finish;
    end

    #10 x = 0; // Test case 4: Set x to 0 again
    #10 if (z !== 0) begin
      $display("FAIL: Expected z to be 0 when x is 0, but got z = %b", z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule