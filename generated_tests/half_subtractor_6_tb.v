`timescale 1ns/1ps

module tb_half_subtractor;

  reg a;
  reg b;
  wire Diff;
  wire Barrow;

  // Instantiate the half_subtractor module
  half_subtractor uut (
    .a(a),
    .b(b),
    .Diff(Diff),
    .Barrow(Barrow)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (Diff !== 0 || Barrow !== 0) begin
      $display("FAIL: Test case 1 failed (a=0, b=0)");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (Diff !== 1 || Barrow !== 1) begin
      $display("FAIL: Test case 2 failed (a=0, b=1)");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (Diff !== 1 || Barrow !== 0) begin
      $display("FAIL: Test case 3 failed (a=1, b=0)");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (Diff !== 0 || Barrow !== 0) begin
      $display("FAIL: Test case 4 failed (a=1, b=1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule