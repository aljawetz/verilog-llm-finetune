`timescale 1ns/1ps

module tb_not_gate;

  // Inputs
  reg e;

  // Outputs
  wire d;

  // Instantiate the Unit Under Test (UUT)
  not_gate uut (
    .d(d),
    .e(e)
  );

  initial begin
    // Test sequence
    // Test case 1: e = 0, expect d = 1
    e = 0;
    #10;
    if (d !== 1) begin
      $display("FAIL: Test case 1 failed. Expected d = 1, got d = %b", d);
      $finish;
    end

    // Test case 2: e = 1, expect d = 0
    e = 1;
    #10;
    if (d !== 0) begin
      $display("FAIL: Test case 2 failed. Expected d = 0, got d = %b", d);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule