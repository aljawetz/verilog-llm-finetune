`timescale 1ns/1ps

module tb_inv_d_1;

  reg inp;
  wire out_l;

  // Instantiate the module under test (uut)
  inv_d_1 uut (
    .inp(inp),
    .out_l(out_l)
  );

  initial begin
    // Test sequence
    // Test case 1: inp = 0
    inp = 0;
    #10; // Wait for 10 time units
    if (out_l !== 1) begin
      $display("FAIL: Test case 1 failed, expected out_l = 1, got out_l = %b", out_l);
      $finish;
    end

    // Test case 2: inp = 1
    inp = 1;
    #10; // Wait for 10 time units
    if (out_l !== 0) begin
      $display("FAIL: Test case 2 failed, expected out_l = 0, got out_l = %b", out_l);
      $finish;
    end

    // Test case 3: inp = 0 again
    inp = 0;
    #10; // Wait for 10 time units
    if (out_l !== 1) begin
      $display("FAIL: Test case 3 failed, expected out_l = 1, got out_l = %b", out_l);
      $finish;
    end

    // Test case 4: inp = 1 again
    inp = 1;
    #10; // Wait for 10 time units
    if (out_l !== 0) begin
      $display("FAIL: Test case 4 failed, expected out_l = 0, got out_l = %b", out_l);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule