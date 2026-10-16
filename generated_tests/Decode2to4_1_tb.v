`timescale 1ns/1ps

module tb_Decode2to4;

  reg en;
  reg a;
  reg b;
  wire [3:0] y;

  // Instantiate the module under test (uut)
  Decode2to4 uut (
    .en(en),
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    // Test case 1: Enable is high
    en = 1'b1; a = 1'b0; b = 1'b0; #10;
    if (y !== 4'b1111) $display("FAIL: Test case 1 failed, expected 4'b1111, got %b", y);

    // Test case 2: Enable is low, a=0, b=0
    en = 1'b0; a = 1'b0; b = 1'b0; #10;
    if (y !== 4'b1110) $display("FAIL: Test case 2 failed, expected 4'b1110, got %b", y);

    // Test case 3: Enable is low, a=0, b=1
    en = 1'b0; a = 1'b0; b = 1'b1; #10;
    if (y !== 4'b1101) $display("FAIL: Test case 3 failed, expected 4'b1101, got %b", y);

    // Test case 4: Enable is low, a=1, b=0
    en = 1'b0; a = 1'b1; b = 1'b0; #10;
    if (y !== 4'b1011) $display("FAIL: Test case 4 failed, expected 4'b1011, got %b", y);

    // Test case 5: Enable is low, a=1, b=1
    en = 1'b0; a = 1'b1; b = 1'b1; #10;
    if (y !== 4'b0111) $display("FAIL: Test case 5 failed, expected 4'b0111, got %b", y);

    // Test case 6: Enable is high again
    en = 1'b1; a = 1'b1; b = 1'b1; #10;
    if (y !== 4'b1111) $display("FAIL: Test case 6 failed, expected 4'b1111, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule