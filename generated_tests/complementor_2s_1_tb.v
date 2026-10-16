`timescale 1ns/1ps

module tb_complementor_2s;

  reg [3:0] a;
  wire [3:0] b;

  // Instantiate the module under test (uut)
  complementor_2s uut (
    .a(a),
    .b(b)
  );

  initial begin
    // Test cases
    // Test case 1: a = 0000 (0 in decimal)
    a = 4'b0000; #10;
    if (b !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", b);

    // Test case 2: a = 0001 (1 in decimal)
    a = 4'b0001; #10;
    if (b !== 4'b1111) $display("FAIL: Test case 2 failed, expected 1111, got %b", b);

    // Test case 3: a = 0010 (2 in decimal)
    a = 4'b0010; #10;
    if (b !== 4'b1110) $display("FAIL: Test case 3 failed, expected 1110, got %b", b);

    // Test case 4: a = 0011 (3 in decimal)
    a = 4'b0011; #10;
    if (b !== 4'b1101) $display("FAIL: Test case 4 failed, expected 1101, got %b", b);

    // Test case 5: a = 0100 (4 in decimal)
    a = 4'b0100; #10;
    if (b !== 4'b1100) $display("FAIL: Test case 5 failed, expected 1100, got %b", b);

    // Test case 6: a = 0111 (7 in decimal)
    a = 4'b0111; #10;
    if (b !== 4'b1001) $display("FAIL: Test case 6 failed, expected 1001, got %b", b);

    // Test case 7: a = 1000 (8 in decimal)
    a = 4'b1000; #10;
    if (b !== 4'b1000) $display("FAIL: Test case 7 failed, expected 1000, got %b", b);

    // Test case 8: a = 1111 (15 in decimal)
    a = 4'b1111; #10;
    if (b !== 4'b0001) $display("FAIL: Test case 8 failed, expected 0001, got %b", b);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule