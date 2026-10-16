`timescale 1ns/1ps

module tb_and3;

  reg w;
  reg x;
  reg y;
  wire z;

  // Instantiate the module under test (uut)
  and3 uut (
    .z(z),
    .w(w),
    .x(x),
    .y(y)
  );

  initial begin
    // Test case 1: All inputs low
    w = 0; x = 0; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 1 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 2: One input high
    w = 1; x = 0; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 2 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 3: Two inputs high
    w = 1; x = 1; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 3 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 4: All inputs high
    w = 1; x = 1; y = 1;
    #10;
    if (z !== 1) begin
      $display("FAIL: Test case 4 failed, expected z=1, got z=%b", z);
      $finish;
    end

    // Test case 5: Two inputs high, one low
    w = 0; x = 1; y = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 5 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 6: Two inputs high, one low
    w = 1; x = 0; y = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 6 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 7: Two inputs high, one low
    w = 1; x = 1; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 7 failed, expected z=0, got z=%b", z);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule