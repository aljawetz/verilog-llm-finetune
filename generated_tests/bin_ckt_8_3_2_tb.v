`timescale 1ns/1ps

module tb_bin_ckt_8_3;

  reg [7:0] i;
  wire [2:0] y;

  // Instantiate the module under test (uut)
  bin_ckt_8_3 uut (
    .i(i),
    .y(y)
  );

  initial begin
    // Test case 1: All inputs are 0
    i = 8'b00000000; #10;
    if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", y);

    // Test case 2: Only the first bit is 1
    i = 8'b00000001; #10;
    if (y !== 3'b000) $display("FAIL: Test case 2 failed, expected 000, got %b", y);

    // Test case 3: Only the second bit is 1
    i = 8'b00000010; #10;
    if (y !== 3'b000) $display("FAIL: Test case 3 failed, expected 000, got %b", y);

    // Test case 4: i = 8'b00001111 (1s in positions 0, 1, 2, 3)
    i = 8'b00001111; #10;
    if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", y);

    // Test case 5: i = 8'b11111111 (All bits are 1)
    i = 8'b11111111; #10;
    if (y !== 3'b111) $display("FAIL: Test case 5 failed, expected 111, got %b", y);

    // Test case 6: i = 8'b10101010 (Alternating bits)
    i = 8'b10101010; #10;
    if (y !== 3'b100) $display("FAIL: Test case 6 failed, expected 100, got %b", y);

    // Test case 7: i = 8'b11001100 (Two pairs of 1s)
    i = 8'b11001100; #10;
    if (y !== 3'b100) $display("FAIL: Test case 7 failed, expected 100, got %b", y);

    // Test case 8: i = 8'b11110000 (Four 1s in the upper half)
    i = 8'b11110000; #10;
    if (y !== 3'b011) $display("FAIL: Test case 8 failed, expected 011, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule