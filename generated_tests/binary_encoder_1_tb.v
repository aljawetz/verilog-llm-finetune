`timescale 1ns/1ps

module tb_binary_encoder;
  reg [7:0] d;
  wire [2:0] y;

  // Instantiate the module under test (uut)
  binary_encoder uut (
    .d(d),
    .y(y)
  );

  initial begin
    // Test case 1: Only the first bit is active
    d = 8'b00000001; // Expected output: 3'b000
    #10;
    if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000 but got %b", y);

    // Test case 2: Only the second bit is active
    d = 8'b00000010; // Expected output: 3'b001
    #10;
    if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 001 but got %b", y);

    // Test case 3: Only the third bit is active
    d = 8'b00000100; // Expected output: 3'b010
    #10;
    if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 010 but got %b", y);

    // Test case 4: Only the fourth bit is active
    d = 8'b00001000; // Expected output: 3'b011
    #10;
    if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 011 but got %b", y);

    // Test case 5: Only the fifth bit is active
    d = 8'b00010000; // Expected output: 3'b100
    #10;
    if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 100 but got %b", y);

    // Test case 6: Only the sixth bit is active
    d = 8'b00100000; // Expected output: 3'b101
    #10;
    if (y !== 3'b101) $display("FAIL: Test case 6 failed, expected 101 but got %b", y);

    // Test case 7: Only the seventh bit is active
    d = 8'b01000000; // Expected output: 3'b110
    #10;
    if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 110 but got %b", y);

    // Test case 8: Only the eighth bit is active
    d = 8'b10000000; // Expected output: 3'b111
    #10;
    if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 111 but got %b", y);

    // Test case 9: Multiple bits active (e.g., 3rd and 5th)
    d = 8'b00101000; // Expected output: 3'b100 (5th bit is highest priority)
    #10;
    if (y !== 3'b100) $display("FAIL: Test case 9 failed, expected 100 but got %b", y);

    // Test case 10: All bits active
    d = 8'b11111111; // Expected output: 3'b111 (8th bit is highest priority)
    #10;
    if (y !== 3'b111) $display("FAIL: Test case 10 failed, expected 111 but got %b", y);

    $display("PASS");
    $finish;
  end
endmodule