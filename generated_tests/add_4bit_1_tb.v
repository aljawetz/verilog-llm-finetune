`timescale 1ns/1ps

module tb_add_4bit;

  reg [3:0] a;
  reg [3:0] b;
  wire [3:0] sum;

  // Instantiate the module under test (uut)
  add_4bit uut (
    .a(a),
    .b(b),
    .sum(sum)
  );

  initial begin
    // Test case 1: 0 + 0 = 0
    a = 4'b0000; b = 4'b0000; #10;
    if (sum !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0, got %b", sum);

    // Test case 2: 1 + 1 = 2
    a = 4'b0001; b = 4'b0001; #10;
    if (sum !== 4'b0010) $display("FAIL: Test case 2 failed, expected 2, got %b", sum);

    // Test case 3: 2 + 3 = 5
    a = 4'b0010; b = 4'b0011; #10;
    if (sum !== 4'b0101) $display("FAIL: Test case 3 failed, expected 5, got %b", sum);

    // Test case 4: 4 + 4 = 8
    a = 4'b0100; b = 4'b0100; #10;
    if (sum !== 4'b1000) $display("FAIL: Test case 4 failed, expected 8, got %b", sum);

    // Test case 5: 7 + 1 = 8
    a = 4'b0111; b = 4'b0001; #10;
    if (sum !== 4'b1000) $display("FAIL: Test case 5 failed, expected 8, got %b", sum);

    // Test case 6: 8 + 7 = 15
    a = 4'b1000; b = 4'b0111; #10;
    if (sum !== 4'b1111) $display("FAIL: Test case 6 failed, expected 15, got %b", sum);

    // Test case 7: 15 + 1 = 0 (overflow)
    a = 4'b1111; b = 4'b0001; #10;
    if (sum !== 4'b0000) $display("FAIL: Test case 7 failed, expected 0, got %b", sum);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule