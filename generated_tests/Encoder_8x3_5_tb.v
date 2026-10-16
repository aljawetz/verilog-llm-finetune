`timescale 1ns/1ps

module tb_Encoder_8x3;

  reg [7:0] i;
  wire [2:0] b;

  // Instantiate the module under test (uut)
  Encoder_8x3 uut (
    .i(i),
    .b(b)
  );

  initial begin
    // Test case 1: All inputs low
    i = 8'b00000000; #10;
    if (b !== 3'b000) $display("FAIL: Test case 1 failed, expected b = 000, got b = %b", b);

    // Test case 2: Only i[1] is high
    i = 8'b00000010; #10;
    if (b !== 3'b000) $display("FAIL: Test case 2 failed, expected b = 000, got b = %b", b);

    // Test case 3: i[3] is high
    i = 8'b00001000; #10;
    if (b !== 3'b001) $display("FAIL: Test case 3 failed, expected b = 001, got b = %b", b);

    // Test case 4: i[5] is high
    i = 8'b00100000; #10;
    if (b !== 3'b001) $display("FAIL: Test case 4 failed, expected b = 001, got b = %b", b);

    // Test case 5: i[7] is high
    i = 8'b10000000; #10;
    if (b !== 3'b001) $display("FAIL: Test case 5 failed, expected b = 001, got b = %b", b);

    // Test case 6: i[1] and i[3] are high
    i = 8'b00001010; #10;
    if (b !== 3'b001) $display("FAIL: Test case 6 failed, expected b = 001, got b = %b", b);

    // Test case 7: i[2] is high
    i = 8'b00000100; #10;
    if (b !== 3'b010) $display("FAIL: Test case 7 failed, expected b = 010, got b = %b", b);

    // Test case 8: i[6] is high
    i = 8'b01000000; #10;
    if (b !== 3'b010) $display("FAIL: Test case 8 failed, expected b = 010, got b = %b", b);

    // Test case 9: i[4] is high
    i = 8'b00010000; #10;
    if (b !== 3'b100) $display("FAIL: Test case 9 failed, expected b = 100, got b = %b", b);

    // Test case 10: All inputs high
    i = 8'b11111111; #10;
    if (b !== 3'b111) $display("FAIL: Test case 10 failed, expected b = 111, got b = %b", b);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule