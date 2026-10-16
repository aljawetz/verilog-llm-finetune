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
    // Test sequence
    // Test 1: Enable the buffer and check output
    in = 1'b0; enb = 1'b1; #10;
    if (out !== 1'b0) begin
      $display("FAIL: Test 1 failed, expected out = 0 when enb = 1 and in = 0");
      $finish;
    end

    // Test 2: Change input while enabled
    in = 1'b1; #10;
    if (out !== 1'b1) begin
      $display("FAIL: Test 2 failed, expected out = 1 when enb = 1 and in = 1");
      $finish;
    end

    // Test 3: Disable the buffer and check output
    enb = 1'b0; #10;
    if (out !== 1'bz) begin
      $display("FAIL: Test 3 failed, expected out = Z when enb = 0");
      $finish;
    end

    // Test 4: Enable again and check output
    enb = 1'b1; in = 1'b0; #10;
    if (out !== 1'b0) begin
      $display("FAIL: Test 4 failed, expected out = 0 when enb = 1 and in = 0");
      $finish;
    end

    // Test 5: Final check with different input
    in = 1'b1; #10;
    if (out !== 1'b1) begin
      $display("FAIL: Test 5 failed, expected out = 1 when enb = 1 and in = 1");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule