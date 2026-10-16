`timescale 1ns/1ps

module tb_buffer;

  reg in;
  reg enb;
  wire out;

  // Instantiate the module under test
  buffer uut (
    .in(in),
    .enb(enb),
    .out(out)
  );

  initial begin
    // Initialize inputs
    in = 0;
    enb = 0;

    // Test sequence
    // Test 1: Enable is low, output should be high impedance (Z)
    #10;
    if (out !== 1'bz) begin
      $display("FAIL: Test 1 failed, expected out = Z when enb = 0");
      $finish;
    end

    // Test 2: Enable is high, input is 0, output should be 0
    enb = 1;
    in = 0;
    #10;
    if (out !== 0) begin
      $display("FAIL: Test 2 failed, expected out = 0 when in = 0 and enb = 1");
      $finish;
    end

    // Test 3: Enable is high, input is 1, output should be 1
    in = 1;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test 3 failed, expected out = 1 when in = 1 and enb = 1");
      $finish;
    end

    // Test 4: Change enable to low, output should be high impedance (Z)
    enb = 0;
    #10;
    if (out !== 1'bz) begin
      $display("FAIL: Test 4 failed, expected out = Z when enb = 0");
      $finish;
    end

    // Test 5: Enable is high again, input is 0, output should be 0
    enb = 1;
    in = 0;
    #10;
    if (out !== 0) begin
      $display("FAIL: Test 5 failed, expected out = 0 when in = 0 and enb = 1");
      $finish;
    end

    // Test 6: Enable is high, input is 1, output should be 1
    in = 1;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test 6 failed, expected out = 1 when in = 1 and enb = 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule