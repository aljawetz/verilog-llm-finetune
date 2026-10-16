`timescale 1ns/1ps

module tb_and_gate;

  // Inputs
  reg a2;
  reg b2;

  // Outputs
  wire c2;

  // Instantiate the Unit Under Test (UUT)
  and_gate uut (
    .a2(a2), 
    .b2(b2), 
    .c2(c2)
  );

  initial begin
    // Test case 1: 0 AND 0
    a2 = 0; b2 = 0;
    #10;
    if (c2 !== 0) begin
      $display("FAIL: Test case 1 failed (0 AND 0)");
      $finish;
    end

    // Test case 2: 0 AND 1
    a2 = 0; b2 = 1;
    #10;
    if (c2 !== 0) begin
      $display("FAIL: Test case 2 failed (0 AND 1)");
      $finish;
    end

    // Test case 3: 1 AND 0
    a2 = 1; b2 = 0;
    #10;
    if (c2 !== 0) begin
      $display("FAIL: Test case 3 failed (1 AND 0)");
      $finish;
    end

    // Test case 4: 1 AND 1
    a2 = 1; b2 = 1;
    #10;
    if (c2 !== 1) begin
      $display("FAIL: Test case 4 failed (1 AND 1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule