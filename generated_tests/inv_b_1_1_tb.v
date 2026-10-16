`timescale 1ns/1ps

module tb_inv_b_1;

  reg inp;
  wire out_l;

  // Instantiate the module under test (uut)
  inv_b_1 uut (
    .inp(inp),
    .out_l(out_l)
  );

  initial begin
    // Test sequence
    // Test case 1: Check when inp is 0
    inp = 0;
    #10; // Wait for 10 time units
    if (out_l !== 1) begin
      $display("FAIL: Expected out_l to be 1 when inp is 0");
      $finish;
    end

    // Test case 2: Check when inp is 1
    inp = 1;
    #10; // Wait for 10 time units
    if (out_l !== 0) begin
      $display("FAIL: Expected out_l to be 0 when inp is 1");
      $finish;
    end

    // Test case 3: Check toggling inp
    inp = 0;
    #10; // Wait for 10 time units
    if (out_l !== 1) begin
      $display("FAIL: Expected out_l to be 1 when inp is 0");
      $finish;
    end

    inp = 1;
    #10; // Wait for 10 time units
    if (out_l !== 0) begin
      $display("FAIL: Expected out_l to be 0 when inp is 1");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule