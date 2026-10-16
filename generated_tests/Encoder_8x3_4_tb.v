`timescale 1ns/1ps

module tb_Encoder_8x3;

  reg en;
  reg [7:0] i;
  wire [2:0] y;

  // Instantiate the Encoder_8x3 module
  Encoder_8x3 uut (
    .en(en),
    .i(i),
    .y(y)
  );

  initial begin
    // Test case 1: Enable with input 8'b00000001
    en = 1;
    i = 8'b00000001; // Should output 3'b001
    #10;
    if (y !== 3'b001) $display("FAIL: Test case 1 failed, expected 3'b001 but got %b", y);

    // Test case 2: Enable with input 8'b00000010
    i = 8'b00000010; // Should output 3'b010
    #10;
    if (y !== 3'b010) $display("FAIL: Test case 2 failed, expected 3'b010 but got %b", y);

    // Test case 3: Enable with input 8'b00000100
    i = 8'b00000100; // Should output 3'b011
    #10;
    if (y !== 3'b011) $display("FAIL: Test case 3 failed, expected 3'b011 but got %b", y);

    // Test case 4: Enable with input 8'b00001000
    i = 8'b00001000; // Should output 3'b100
    #10;
    if (y !== 3'b100) $display("FAIL: Test case 4 failed, expected 3'b100 but got %b", y);

    // Test case 5: Enable with input 8'b00010000
    i = 8'b00010000; // Should output 3'b101
    #10;
    if (y !== 3'b101) $display("FAIL: Test case 5 failed, expected 3'b101 but got %b", y);

    // Test case 6: Enable with input 8'b00100000
    i = 8'b00100000; // Should output 3'b110
    #10;
    if (y !== 3'b110) $display("FAIL: Test case 6 failed, expected 3'b110 but got %b", y);

    // Test case 7: Enable with input 8'b01000000
    i = 8'b01000000; // Should output 3'b111
    #10;
    if (y !== 3'b111) $display("FAIL: Test case 7 failed, expected 3'b111 but got %b", y);

    // Test case 8: Enable with input 8'b00000000
    i = 8'b00000000; // Should output 3'b000
    #10;
    if (y !== 3'b000) $display("FAIL: Test case 8 failed, expected 3'b000 but got %b", y);

    // Test case 9: Disable the encoder
    en = 0;
    i = 8'b11111111; // Should output 3'bzzz
    #10;
    if (y !== 3'bzzz) $display("FAIL: Test case 9 failed, expected 3'bzzz but got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule