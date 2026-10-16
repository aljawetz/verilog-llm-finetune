`timescale 1ns/1ps

module tb_add_sub;

  // Inputs
  reg a;
  reg b;
  reg mode;

  // Outputs
  wire s_d;
  wire cout;

  // Instantiate the Unit Under Test (UUT)
  add_sub uut (
    .a(a),
    .b(b),
    .mode(mode),
    .s_d(s_d),
    .cout(cout)
  );

  initial begin
    // Test case 1: Addition (mode = 0)
    a = 1; b = 1; mode = 0; #10;
    if (s_d !== 0 || cout !== 1) begin
      $display("FAIL: Test case 1 failed (Addition 1 + 1)");
      $finish;
    end

    // Test case 2: Addition (mode = 0)
    a = 0; b = 1; mode = 0; #10;
    if (s_d !== 1 || cout !== 0) begin
      $display("FAIL: Test case 2 failed (Addition 0 + 1)");
      $finish;
    end

    // Test case 3: Subtraction (mode = 1)
    a = 1; b = 0; mode = 1; #10;
    if (s_d !== 1 || cout !== 0) begin
      $display("FAIL: Test case 3 failed (Subtraction 1 - 0)");
      $finish;
    end

    // Test case 4: Subtraction (mode = 1)
    a = 0; b = 1; mode = 1; #10;
    if (s_d !== 1 || cout !== 1) begin
      $display("FAIL: Test case 4 failed (Subtraction 0 - 1)");
      $finish;
    end

    // Test case 5: Subtraction (mode = 1)
    a = 1; b = 1; mode = 1; #10;
    if (s_d !== 0 || cout !== 0) begin
      $display("FAIL: Test case 5 failed (Subtraction 1 - 1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule