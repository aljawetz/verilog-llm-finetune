`timescale 1ns/1ps

module tb_GFMUL8;

  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] z;

  // Instantiate the Unit Under Test (UUT)
  GFMUL8 uut (
    .a(a),
    .b(b),
    .z(z)
  );

  initial begin
    // Test cases
    // Test case 1: 0 * 0 = 0
    a = 8'h00; b = 8'h00; #10;
    if (z !== 8'h00) $display("FAIL: Test case 1 failed, expected 0, got %h", z);

    // Test case 2: 1 * 1 = 1
    a = 8'h01; b = 8'h01; #10;
    if (z !== 8'h01) $display("FAIL: Test case 2 failed, expected 1, got %h", z);

    // Test case 3: 2 * 2 = 4
    a = 8'h02; b = 8'h02; #10;
    if (z !== 8'h04) $display("FAIL: Test case 3 failed, expected 4, got %h", z);

    // Test case 4: 3 * 3 = 9
    a = 8'h03; b = 8'h03; #10;
    if (z !== 8'h09) $display("FAIL: Test case 4 failed, expected 9, got %h", z);

    // Test case 5: 5 * 5 = 25
    a = 8'h05; b = 8'h05; #10;
    if (z !== 8'h19) $display("FAIL: Test case 5 failed, expected 19, got %h", z);

    // Test case 6: 7 * 3 = 21
    a = 8'h07; b = 8'h03; #10;
    if (z !== 8'h15) $display("FAIL: Test case 6 failed, expected 15, got %h", z);

    // Test case 7: 9 * 5 = 45
    a = 8'h09; b = 8'h05; #10;
    if (z !== 8'h2D) $display("FAIL: Test case 7 failed, expected 2D, got %h", z);

    // Test case 8: 15 * 15 = 225
    a = 8'h0F; b = 8'h0F; #10;
    if (z !== 8'h01) $display("FAIL: Test case 8 failed, expected 01, got %h", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule