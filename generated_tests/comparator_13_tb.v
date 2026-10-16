`timescale 1ns/1ps

module tb_comparator;
  reg a;
  reg b;
  wire aeb;
  wire alb;
  wire agb;

  // Instantiate the comparator module
  comparator uut (
    .a(a),
    .b(b),
    .aeb(aeb),
    .alb(alb),
    .agb(agb)
  );

  initial begin
    // Test case 1: a = 0, b = 0 (should be equal)
    a = 0; b = 0;
    #10;
    if (aeb !== 1'b1 || alb !== 1'b0 || agb !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a = 1, b = 0 (a > b)
    a = 1; b = 0;
    #10;
    if (aeb !== 1'b0 || alb !== 1'b0 || agb !== 1'b1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a = 0, b = 1 (a < b)
    a = 0; b = 1;
    #10;
    if (aeb !== 1'b0 || alb !== 1'b1 || agb !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a = 1, b = 1 (should be equal)
    a = 1; b = 1;
    #10;
    if (aeb !== 1'b1 || alb !== 1'b0 || agb !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a = 0, b = 0 (should be equal)
    a = 0; b = 0;
    #10;
    if (aeb !== 1'b1 || alb !== 1'b0 || agb !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a = 1, b = 1 (should be equal)
    a = 1; b = 1;
    #10;
    if (aeb !== 1'b1 || alb !== 1'b0 || agb !== 1'b0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule