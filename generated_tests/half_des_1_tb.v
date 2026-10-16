`timescale 1ns/1ps

module tb_half_des;

  reg a;
  reg b;
  wire d;
  wire bo;

  // Instantiate the half subtractor
  half_des uut (
    .a(a),
    .b(b),
    .d(d),
    .bo(bo)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (d !== 0 || bo !== 0) begin
      $display("FAIL: Test case 1 failed (a=0, b=0)");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (d !== 1 || bo !== 1) begin
      $display("FAIL: Test case 2 failed (a=0, b=1)");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (d !== 1 || bo !== 0) begin
      $display("FAIL: Test case 3 failed (a=1, b=0)");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (d !== 0 || bo !== 0) begin
      $display("FAIL: Test case 4 failed (a=1, b=1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule