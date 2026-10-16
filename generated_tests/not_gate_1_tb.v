`timescale 1ns/1ps

module tb_not_gate;

  // Inputs
  reg a;

  // Outputs
  wire z;

  // Instantiate the Unit Under Test (UUT)
  not_gate uut (
    .a(a),
    .z(z)
  );

  initial begin
    // Test case 1: a = 0, expect z = 1
    a = 0;
    #10; // Wait for 10 time units
    if (z !== 1) begin
      $display("FAIL: Test case 1 failed, expected z = 1 but got z = %b", z);
      $finish;
    end

    // Test case 2: a = 1, expect z = 0
    a = 1;
    #10; // Wait for 10 time units
    if (z !== 0) begin
      $display("FAIL: Test case 2 failed, expected z = 0 but got z = %b", z);
      $finish;
    end

    // Test case 3: a = 0 again, expect z = 1
    a = 0;
    #10; // Wait for 10 time units
    if (z !== 1) begin
      $display("FAIL: Test case 3 failed, expected z = 1 but got z = %b", z);
      $finish;
    end

    // Test case 4: a = 1 again, expect z = 0
    a = 1;
    #10; // Wait for 10 time units
    if (z !== 0) begin
      $display("FAIL: Test case 4 failed, expected z = 0 but got z = %b", z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule