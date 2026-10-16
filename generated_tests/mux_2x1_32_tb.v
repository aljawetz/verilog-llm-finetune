`timescale 1ns/1ps

module tb_mux_2x1;
  reg a;
  reg b;
  reg s;
  wire y;

  // Instantiate the module under test (uut)
  mux_2x1 uut (
    .a(a),
    .b(b),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: s = 0, expect y = a
    a = 1'b0; b = 1'b0; s = 1'b0; #10;
    if (y !== a) begin
      $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 2: s = 0, expect y = a
    a = 1'b1; b = 1'b0; s = 1'b0; #10;
    if (y !== a) begin
      $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 3: s = 1, expect y = b
    a = 1'b0; b = 1'b1; s = 1'b1; #10;
    if (y !== b) begin
      $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // Test case 4: s = 1, expect y = b
    a = 1'b1; b = 1'b1; s = 1'b1; #10;
    if (y !== b) begin
      $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // Test case 5: s = 0, expect y = a
    a = 1'b0; b = 1'b1; s = 1'b0; #10;
    if (y !== a) begin
      $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 6: s = 1, expect y = b
    a = 1'b1; b = 1'b0; s = 1'b1; #10;
    if (y !== b) begin
      $display("FAIL: Test case 6 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule