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
    // Test all possible nibble values
    nibble = 4'b0000; #10; if (encoder !== 7'hC0) $display("FAIL: nibble 0x0 failed");
    nibble = 4'b0001; #10; if (encoder !== 7'hF9) $display("FAIL: nibble 0x1 failed");
    nibble = 4'b0010; #10; if (encoder !== 7'hA4) $display("FAIL: nibble 0x2 failed");
    nibble = 4'b0011; #10; if (encoder !== 7'hB0) $display("FAIL: nibble 0x3 failed");
    nibble = 4'b0100; #10; if (encoder !== 7'h99) $display("FAIL: nibble 0x4 failed");
    nibble = 4'b0101; #10; if (encoder !== 7'h92) $display("FAIL: nibble 0x5 failed");
    nibble = 4'b0110; #10; if (encoder !== 7'h82) $display("FAIL: nibble 0x6 failed");
    nibble = 4'b0111; #10; if (encoder !== 7'h7C) $display("FAIL: nibble 0x7 failed");
    nibble = 4'b1000; #10; if (encoder !== 7'h7F) $display("FAIL: nibble 0x8 failed");
    nibble = 4'b1001; #10; if (encoder !== 7'h6F) $display("FAIL: nibble 0x9 failed");
    nibble = 4'b1010; #10; if (encoder !== 7'h77) $display("FAIL: nibble 0xA failed");
    nibble = 4'b1011; #10; if (encoder !== 7'h7C) $display("FAIL: nibble 0xB failed");
    nibble = 4'b1100; #10; if (encoder !== 7'h39) $display("FAIL: nibble 0xC failed");
    nibble = 4'b1101; #10; if (encoder !== 7'h5E) $display("FAIL: nibble 0xD failed");
    nibble = 4'b1110; #10; if (encoder !== 7'h79) $display("FAIL: nibble 0xE failed");
    nibble = 4'b1111; #10; if (encoder !== 7'h71) $display("FAIL: nibble 0xF failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule