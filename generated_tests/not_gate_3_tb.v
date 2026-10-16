`timescale 1ns/1ps

module tb_not_gate;

  // Inputs
  reg a3;

  // Outputs
  wire b3;

  // Instantiate the Unit Under Test (UUT)
  not_gate uut (
    .a3(a3), 
    .b3(b3)
  );

  initial begin
    // Test case 1: Input is 0
    a3 = 0;
    #10; // Wait for 10 time units
    if (b3 !== 1) begin
      $display("FAIL: Test case 1 failed, expected b3 = 1, got b3 = %b", b3);
      $finish;
    end

    // Test case 2: Input is 1
    a3 = 1;
    #10; // Wait for 10 time units
    if (b3 !== 0) begin
      $display("FAIL: Test case 2 failed, expected b3 = 0, got b3 = %b", b3);
      $finish;
    end

    // Test case 3: Input is toggled
    a3 = 0;
    #10; // Wait for 10 time units
    if (b3 !== 1) begin
      $display("FAIL: Test case 3 failed, expected b3 = 1, got b3 = %b", b3);
      $finish;
    end

    a3 = 1;
    #10; // Wait for 10 time units
    if (b3 !== 0) begin
      $display("FAIL: Test case 4 failed, expected b3 = 0, got b3 = %b", b3);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule