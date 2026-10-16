`timescale 1ns/1ps

module tb_gf2mul;

  reg [1:0] a;
  reg [1:0] b;
  wire [1:0] q;

  // Instantiate the module under test
  gf2mul uut (
    .a(a),
    .b(b),
    .q(q)
  );

  initial begin
    // Test case 1: 00 * 00 = 00
    a = 2'b00; b = 2'b00; #10;
    if (q !== 2'b00) $display("FAIL: Test case 1 failed, expected 00, got %b", q);

    // Test case 2: 01 * 01 = 01
    a = 2'b01; b = 2'b01; #10;
    if (q !== 2'b01) $display("FAIL: Test case 2 failed, expected 01, got %b", q);

    // Test case 3: 10 * 10 = 00
    a = 2'b10; b = 2'b10; #10;
    if (q !== 2'b00) $display("FAIL: Test case 3 failed, expected 00, got %b", q);

    // Test case 4: 11 * 11 = 11
    a = 2'b11; b = 2'b11; #10;
    if (q !== 2'b11) $display("FAIL: Test case 4 failed, expected 11, got %b", q);

    // Test case 5: 01 * 10 = 10
    a = 2'b01; b = 2'b10; #10;
    if (q !== 2'b10) $display("FAIL: Test case 5 failed, expected 10, got %b", q);

    // Test case 6: 10 * 01 = 10
    a = 2'b10; b = 2'b01; #10;
    if (q !== 2'b10) $display("FAIL: Test case 6 failed, expected 10, got %b", q);

    // Test case 7: 01 * 11 = 11
    a = 2'b01; b = 2'b11; #10;
    if (q !== 2'b11) $display("FAIL: Test case 7 failed, expected 11, got %b", q);

    // Test case 8: 11 * 01 = 11
    a = 2'b11; b = 2'b01; #10;
    if (q !== 2'b11) $display("FAIL: Test case 8 failed, expected 11, got %b", q);

    // Test case 9: 11 * 10 = 10
    a = 2'b11; b = 2'b10; #10;
    if (q !== 2'b10) $display("FAIL: Test case 9 failed, expected 10, got %b", q);

    // Test case 10: 10 * 11 = 10
    a = 2'b10; b = 2'b11; #10;
    if (q !== 2'b10) $display("FAIL: Test case 10 failed, expected 10, got %b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule