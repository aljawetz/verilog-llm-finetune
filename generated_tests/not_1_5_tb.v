`timescale 1ns/1ps

module tb_not_1;

  // Inputs
  reg a;

  // Outputs
  wire b;

  // Instantiate the Unit Under Test (UUT)
  not_1 uut (
    .a(a),
    .b(b)
  );

  initial begin
    // Test case 1: a = 0, expect b = 1
    a = 0;
    #10;
    if (b !== 1) begin
      $display("FAIL: Test case 1 failed, expected b = 1 but got b = %b", b);
      $finish;
    end

    // Test case 2: a = 1, expect b = 0
    a = 1;
    #10;
    if (b !== 0) begin
      $display("FAIL: Test case 2 failed, expected b = 0 but got b = %b", b);
      $finish;
    end

    // Test case 3: a = 0 again, expect b = 1
    a = 0;
    #10;
    if (b !== 1) begin
      $display("FAIL: Test case 3 failed, expected b = 1 but got b = %b", b);
      $finish;
    end

    // Test case 4: a = 1 again, expect b = 0
    a = 1;
    #10;
    if (b !== 0) begin
      $display("FAIL: Test case 4 failed, expected b = 0 but got b = %b", b);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule