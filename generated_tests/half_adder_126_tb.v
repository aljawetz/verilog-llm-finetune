`timescale 1ns/1ps

module tb_half_adder;
  reg a;
  reg b;
  wire s0;
  wire c0;

  // Instantiate the half_adder module
  half_adder uut (
    .a(a),
    .b(b),
    .s0(s0),
    .c0(c0)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (s0 !== 0 || c0 !== 0) begin
      $display("FAIL: Test case 1 failed (a=0, b=0)");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (s0 !== 1 || c0 !== 0) begin
      $display("FAIL: Test case 2 failed (a=0, b=1)");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (s0 !== 1 || c0 !== 0) begin
      $display("FAIL: Test case 3 failed (a=1, b=0)");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (s0 !== 0 || c0 !== 1) begin
      $display("FAIL: Test case 4 failed (a=1, b=1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule