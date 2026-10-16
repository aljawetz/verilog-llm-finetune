`timescale 1ns/1ps

module tb_s1;
  reg a;
  reg b;
  reg s1;
  wire q;

  // Instantiate the module under test (uut)
  s1 uut (
    .a(a),
    .b(b),
    .s1(s1),
    .q(q)
  );

  initial begin
    // Test sequence
    // Test case 1: s1 = 0, expect q = b
    a = 1; b = 0; s1 = 0;
    #10;
    if (q !== b) begin
      $display("FAIL: Test case 1 failed, expected q = %b, got q = %b", b, q);
      $finish;
    end

    // Test case 2: s1 = 0, expect q = b
    a = 0; b = 1; s1 = 0;
    #10;
    if (q !== b) begin
      $display("FAIL: Test case 2 failed, expected q = %b, got q = %b", b, q);
      $finish;
    end

    // Test case 3: s1 = 1, expect q = a
    a = 1; b = 0; s1 = 1;
    #10;
    if (q !== a) begin
      $display("FAIL: Test case 3 failed, expected q = %b, got q = %b", a, q);
      $finish;
    end

    // Test case 4: s1 = 1, expect q = a
    a = 0; b = 1; s1 = 1;
    #10;
    if (q !== a) begin
      $display("FAIL: Test case 4 failed, expected q = %b, got q = %b", a, q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule