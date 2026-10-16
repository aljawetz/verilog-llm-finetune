`timescale 1ns/1ps

module tb_gf256mult;

  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] z;

  // Instantiate the module under test
  gf256mult uut (
    .a(a),
    .b(b),
    .z(z)
  );

  initial begin
    // Test case 1: 1 * 1 = 1
    a = 8'h01; b = 8'h01; #10;
    if (z !== 8'h01) $display("FAIL: Test case 1 failed, expected 0x01, got 0x%02h", z);

    // Test case 2: 2 * 2 = 4
    a = 8'h02; b = 8'h02; #10;
    if (z !== 8'h04) $display("FAIL: Test case 2 failed, expected 0x04, got 0x%02h", z);

    // Test case 3: 3 * 3 = 9
    a = 8'h03; b = 8'h03; #10;
    if (z !== 8'h09) $display("FAIL: Test case 3 failed, expected 0x09, got 0x%02h", z);

    // Test case 4: 5 * 5 = 25
    a = 8'h05; b = 8'h05; #10;
    if (z !== 8'h19) $display("FAIL: Test case 4 failed, expected 0x19, got 0x%02h", z);

    // Test case 5: 0 * 5 = 0
    a = 8'h00; b = 8'h05; #10;
    if (z !== 8'h00) $display("FAIL: Test case 5 failed, expected 0x00, got 0x%02h", z);

    // Test case 6: 255 * 1 = 255
    a = 8'hFF; b = 8'h01; #10;
    if (z !== 8'hFF) $display("FAIL: Test case 6 failed, expected 0xFF, got 0x%02h", z);

    // Test case 7: 255 * 255 = 1
    a = 8'hFF; b = 8'hFF; #10;
    if (z !== 8'h01) $display("FAIL: Test case 7 failed, expected 0x01, got 0x%02h", z);

    // Test case 8: 10 * 20 = 200
    a = 8'h0A; b = 8'h14; #10;
    if (z !== 8'hC8) $display("FAIL: Test case 8 failed, expected 0xC8, got 0x%02h", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule