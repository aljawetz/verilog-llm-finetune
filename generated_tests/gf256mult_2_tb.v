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
    if (z !== 8'h19) $display("FAIL: Test case 5 failed, expected 25, got %h", z); // 5*5 in GF(256)

    // Test case 6: 10 * 10 = 100
    a = 8'h0A; b = 8'h0A; #10;
    if (z !== 8'h4D) $display("FAIL: Test case 6 failed, expected 100, got %h", z); // 10*10 in GF(256)

    // Test case 7: 15 * 15 = 225
    a = 8'h0F; b = 8'h0F; #10;
    if (z !== 8'h1E) $display("FAIL: Test case 7 failed, expected 225, got %h", z); // 15*15 in GF(256)

    // Test case 8: 255 * 255 = 1
    a = 8'hFF; b = 8'hFF; #10;
    if (z !== 8'h01) $display("FAIL: Test case 8 failed, expected 1, got %h", z); // 255*255 in GF(256)

    // Test case 9: 1 * 255 = 255
    a = 8'h01; b = 8'hFF; #10;
    if (z !== 8'hFF) $display("FAIL: Test case 9 failed, expected 255, got %h", z);

    // Test case 10: 2 * 255 = 254
    a = 8'h02; b = 8'hFF; #10;
    if (z !== 8'hFE) $display("FAIL: Test case 10 failed, expected 254, got %h", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule