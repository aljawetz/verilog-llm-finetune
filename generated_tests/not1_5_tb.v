`timescale 1ns/1ps

module tb_not1;

  // Inputs
  reg a;

  // Outputs
  wire y;

  // Instantiate the Unit Under Test (UUT)
  not1 uut (
    .a(a),
    .y(y)
  );

  initial begin
    // Test sequence
    // Test case 1: a = 0, expect y = 1
    a = 0;
    #10;
    if (y !== 1) begin
      $display("FAIL: Test case 1 failed, expected y = 1 but got y = %b", y);
      $finish;
    end

    // Test case 2: a = 1, expect y = 0
    a = 1;
    #10;
    if (y !== 0) begin
      $display("FAIL: Test case 2 failed, expected y = 0 but got y = %b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule