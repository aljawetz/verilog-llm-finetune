`timescale 1ns/1ps

module tb_half_sub;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire diff;
  wire barrow;

  // Instantiate the half_sub module
  half_sub uut (
    .a(a),
    .b(b),
    .diff(diff),
    .barrow(barrow)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (diff !== 0 || barrow !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (diff !== 1 || barrow !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (diff !== 1 || barrow !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (diff !== 0 || barrow !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule