`timescale 1ns/1ps

module tb_decoder;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire d0;
  wire d1;
  wire d2;
  wire d3;

  // Instantiate the Unit Under Test (UUT)
  decoder uut (
    .a(a),
    .b(b),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3)
  );

  initial begin
    // Test case 1: a=0, b=0 -> d0 should be 1
    a = 0; b = 0;
    #10;
    if (d0 !== 1'b1 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a=0, b=1 -> d1 should be 1
    a = 0; b = 1;
    #10;
    if (d0 !== 1'b0 || d1 !== 1'b1 || d2 !== 1'b0 || d3 !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a=1, b=0 -> d2 should be 1
    a = 1; b = 0;
    #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b1 || d3 !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a=1, b=1 -> d3 should be 1
    a = 1; b = 1;
    #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule