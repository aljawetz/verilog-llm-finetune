`timescale 1ns/1ps

module tb_tri_buf;

  reg a;
  reg ctrl;
  wire b;

  // Instantiate the tri_buf module
  tri_buf uut (
    .a(a),
    .ctrl(ctrl),
    .b(b)
  );

  initial begin
    // Initialize inputs
    a = 0;
    ctrl = 0;

    // Test case 1: ctrl is low, b should be high-impedance
    #10;
    if (b !== 1'bz) begin
      $display("FAIL: Test case 1 failed, expected b to be high-impedance when ctrl is low.");
      $finish;
    end

    // Test case 2: ctrl is high, a is 0, b should be 0
    ctrl = 1;
    a = 0;
    #10;
    if (b !== 0) begin
      $display("FAIL: Test case 2 failed, expected b to be 0 when a is 0 and ctrl is high.");
      $finish;
    end

    // Test case 3: ctrl is high, a is 1, b should be 1
    a = 1;
    #10;
    if (b !== 1) begin
      $display("FAIL: Test case 3 failed, expected b to be 1 when a is 1 and ctrl is high.");
      $finish;
    end

    // Test case 4: ctrl goes low again, b should be high-impedance
    ctrl = 0;
    #10;
    if (b !== 1'bz) begin
      $display("FAIL: Test case 4 failed, expected b to be high-impedance when ctrl is low.");
      $finish;
    end

    // Test case 5: ctrl is high, a is 0 again, b should be 0
    ctrl = 1;
    a = 0;
    #10;
    if (b !== 0) begin
      $display("FAIL: Test case 5 failed, expected b to be 0 when a is 0 and ctrl is high.");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule