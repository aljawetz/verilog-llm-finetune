`timescale 1ns/1ps

module tb_not1;

  reg a;
  wire z;

  // Instantiate the module under test (uut)
  not1 uut (
    .a(a),
    .z(z)
  );

  initial begin
    // Test sequence
    // Test case 1: a = 0, expect z = 1
    a = 0;
    #10;
    if (z !== 1) begin
      $display("FAIL: Test case 1 failed, expected z = 1 but got z = %b", z);
      $finish;
    end

    // Test case 2: a = 1, expect z = 0
    a = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 2 failed, expected z = 0 but got z = %b", z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule