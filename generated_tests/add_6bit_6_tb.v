`timescale 1ns/1ps

module tb_add_6bit;

  reg [5:0] a;
  reg [5:0] b;
  wire [5:0] sum;

  // Instantiate the module under test (uut)
  add_6bit uut (
    .a(a),
    .b(b),
    .sum(sum)
  );

  initial begin
    // Test case 1: 0 + 0 = 0
    a = 6'b000000; b = 6'b000000; #10;
    if (sum !== 6'b000000) $display("FAIL: Test case 1 failed, expected 0, got %b", sum);

    // Test case 2: 1 + 1 = 2
    a = 6'b000001; b = 6'b000001; #10;
    if (sum !== 6'b000010) $display("FAIL: Test case 2 failed, expected 2, got %b", sum);

    // Test case 3: 15 + 1 = 16 (overflow, should wrap around)
    a = 6'b001111; b = 6'b000001; #10;
    if (sum !== 6'b000000) $display("FAIL: Test case 3 failed, expected 0, got %b", sum);

    // Test case 4: 20 + 5 = 25 (should wrap around)
    a = 6'b010100; b = 6'b000101; #10;
    if (sum !== 6'b011001) $display("FAIL: Test case 4 failed, expected 25, got %b", sum);

    // Test case 5: 32 + 32 = 0 (overflow, should wrap around)
    a = 6'b100000; b = 6'b100000; #10;
    if (sum !== 6'b000000) $display("FAIL: Test case 5 failed, expected 0, got %b", sum);

    // Test case 6: 63 + 0 = 63
    a = 6'b111111; b = 6'b000000; #10;
    if (sum !== 6'b111111) $display("FAIL: Test case 6 failed, expected 63, got %b", sum);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule