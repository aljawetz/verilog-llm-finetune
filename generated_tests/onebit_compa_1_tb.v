`timescale 1ns/1ps

module tb_onebit_compa;

  reg a;
  reg b;
  wire equal;
  wire greater;
  wire lower;

  // Instantiate the module under test (uut)
  onebit_compa uut (
    .a(a),
    .b(b),
    .equal(equal),
    .greater(greater),
    .lower(lower)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (equal !== 1 || greater !== 0 || lower !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (equal !== 0 || greater !== 0 || lower !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (equal !== 0 || greater !== 1 || lower !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (equal !== 1 || greater !== 0 || lower !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule