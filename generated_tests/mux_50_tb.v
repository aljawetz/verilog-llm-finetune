`timescale 1ns/1ps

module tb_mux;

  // Inputs
  reg a;
  reg b;
  reg s;

  // Output
  wire q;

  // Instantiate the Unit Under Test (UUT)
  mux uut (
    .a(a),
    .b(b),
    .s(s),
    .q(q)
  );

  initial begin
    // Test case 1: s = 0, expect q = a
    a = 1'b0; b = 1'b1; s = 1'b0;
    #10;
    if (q !== a) begin
      $display("FAIL: Test case 1 failed, expected q = %b, got q = %b", a, q);
      $finish;
    end

    // Test case 2: s = 1, expect q = b
    a = 1'b0; b = 1'b1; s = 1'b1;
    #10;
    if (q !== b) begin
      $display("FAIL: Test case 2 failed, expected q = %b, got q = %b", b, q);
      $finish;
    end

    // Test case 3: s = 0, expect q = a
    a = 1'b1; b = 1'b0; s = 1'b0;
    #10;
    if (q !== a) begin
      $display("FAIL: Test case 3 failed, expected q = %b, got q = %b", a, q);
      $finish;
    end

    // Test case 4: s = 1, expect q = b
    a = 1'b1; b = 1'b0; s = 1'b1;
    #10;
    if (q !== b) begin
      $display("FAIL: Test case 4 failed, expected q = %b, got q = %b", b, q);
      $finish;
    end

    // Test case 5: s = 0, expect q = a
    a = 1'b0; b = 1'b0; s = 1'b0;
    #10;
    if (q !== a) begin
      $display("FAIL: Test case 5 failed, expected q = %b, got q = %b", a, q);
      $finish;
    end

    // Test case 6: s = 1, expect q = b
    a = 1'b0; b = 1'b0; s = 1'b1;
    #10;
    if (q !== b) begin
      $display("FAIL: Test case 6 failed, expected q = %b, got q = %b", b, q);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule