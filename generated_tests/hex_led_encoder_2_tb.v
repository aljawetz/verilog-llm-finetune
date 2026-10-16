`timescale 1ns/1ps

module tb_hex_led_encoder;

  reg [3:0] nibble;
  wire [6:0] encoder;

  // Instantiate the module under test (uut)
  hex_led_encoder uut (
    .encoder(encoder),
    .nibble(nibble)
  );

  initial begin
    // Test all possible nibbles
    nibble = 4'b0000; #10;
    if (encoder !== 7'b1100000) $display("FAIL: nibble 0x0 expected 0x3F, got %b", encoder);
    
    nibble = 4'b0001; #10;
    if (encoder !== 7'b1111101) $display("FAIL: nibble 0x1 expected 0x06, got %b", encoder);
    
    nibble = 4'b0010; #10;
    if (encoder !== 7'b0100100) $display("FAIL: nibble 0x2 expected 0x5B, got %b", encoder);
    
    nibble = 4'b0011; #10;
    if (encoder !== 7'b0100000) $display("FAIL: nibble 0x3 expected 0x4F, got %b", encoder);
    
    nibble = 4'b0100; #10;
    if (encoder !== 7'b1011011) $display("FAIL: nibble 0x4 expected 0x66, got %b", encoder);
    
    nibble = 4'b0101; #10;
    if (encoder !== 7'b0100100) $display("FAIL: nibble 0x5 expected 0x6D, got %b", encoder);
    
    nibble = 4'b0110; #10;
    if (encoder !== 7'b0010010) $display("FAIL: nibble 0x6 expected 0x7D, got %b", encoder);
    
    nibble = 4'b0111; #10;
    if (encoder !== 7'b1111100) $display("FAIL: nibble 0x7 expected 0x07, got %b", encoder);
    
    nibble = 4'b1000; #10;
    if (encoder !== 7'b0000000) $display("FAIL: nibble 0x8 expected 0x7F, got %b", encoder);
    
    nibble = 4'b1001; #10;
    if (encoder !== 7'b0010000) $display("FAIL: nibble 0x9 expected 0x6F, got %b", encoder);
    
    nibble = 4'b1010; #10;
    if (encoder !== 7'b1001000) $display("FAIL: nibble 0xA expected 0x77, got %b", encoder);
    
    nibble = 4'b1011; #10;
    if (encoder !== 7'b0011100) $display("FAIL: nibble 0xB expected 0x7C, got %b", encoder);
    
    nibble = 4'b1100; #10;
    if (encoder !== 7'b1100010) $display("FAIL: nibble 0xC expected 0x39, got %b", encoder);
    
    nibble = 4'b1101; #10;
    if (encoder !== 7'b0100011) $display("FAIL: nibble 0xD expected 0x5E, got %b", encoder);
    
    nibble = 4'b1110; #10;
    if (encoder !== 7'b1000010) $display("FAIL: nibble 0xE expected 0x79, got %b", encoder);
    
    nibble = 4'b1111; #10;
    if (encoder !== 7'b0100110) $display("FAIL: nibble 0xF expected 0x71, got %b", encoder);
    
    $display("PASS");
    $finish;
  end

endmodule