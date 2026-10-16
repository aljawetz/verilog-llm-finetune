`timescale 1ns/1ps

module tb_tri_buf;

  // Inputs
  reg a;
  reg en;

  // Output
  wire b;

  // Instantiate the Unit Under Test (UUT)
  tri_buf uut (
    .a(a),
    .en(en),
    .b(b)
  );

  initial begin
    // Initialize Inputs
    a = 0;
    en = 0;

    // Test sequence
    // Test 1: Enable is low, output should be high impedance
    #10;
    if (b !== 1'bz) begin
      $display("FAIL: Test 1 failed, expected b = Z when en = 0");
      $finish;
    end

    // Test 2: Enable is high, output should follow input
    en = 1;
    a = 1;
    #10;
    if (b !== 1'b1) begin
      $display("FAIL: Test 2 failed, expected b = 1 when en = 1 and a = 1");
      $finish;
    end

    // Test 3: Change input while enabled
    a = 0;
    #10;
    if (b !== 1'b0) begin
      $display("FAIL: Test 3 failed, expected b = 0 when en = 1 and a = 0");
      $finish;
    end

    // Test 4: Disable the buffer, output should be high impedance
    en = 0;
    #10;
    if (b !== 1'bz) begin
      $display("FAIL: Test 4 failed, expected b = Z when en = 0");
      $finish;
    end

    // Test 5: Re-enable and change input
    en = 1;
    a = 1;
    #10;
    if (b !== 1'b1) begin
      $display("FAIL: Test 5 failed, expected b = 1 when en = 1 and a = 1");
      $finish;
    end

    // Test 6: Final state check
    a = 0;
    #10;
    if (b !== 1'b0) begin
      $display("FAIL: Test 6 failed, expected b = 0 when en = 1 and a = 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule