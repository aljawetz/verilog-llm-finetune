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
    // Test cases
    nibble = 4'b0000; #10; if (encoder !== 7'b1100000) $display("FAIL: Test case 0 failed");
    nibble = 4'b0001; #10; if (encoder !== 7'b1111101) $display("FAIL: Test case 1 failed");
    nibble = 4'b0010; #10; if (encoder !== 7'b0100100) $display("FAIL: Test case 2 failed");
    nibble = 4'b0011; #10; if (encoder !== 7'b1010000) $display("FAIL: Test case 3 failed");
    nibble = 4'b0100; #10; if (encoder !== 7'b1000011) $display("FAIL: Test case 4 failed");
    nibble = 4'b0101; #10; if (encoder !== 7'b0100100) $display("FAIL: Test case 5 failed");
    nibble = 4'b0110; #10; if (encoder !== 7'b0100001) $display("FAIL: Test case 6 failed");
    nibble = 4'b0111; #10; if (encoder !== 7'b1111100) $display("FAIL: Test case 7 failed");
    nibble = 4'b1000; #10; if (encoder !== 7'b0000000) $display("FAIL: Test case 8 failed");
    nibble = 4'b1001; #10; if (encoder !== 7'b0100000) $display("FAIL: Test case 9 failed");
    nibble = 4'b1010; #10; if (encoder !== 7'b1001000) $display("FAIL: Test case 10 failed");
    nibble = 4'b1011; #10; if (encoder !== 7'b0011100) $display("FAIL: Test case 11 failed");
    nibble = 4'b1100; #10; if (encoder !== 7'b1100010) $display("FAIL: Test case 12 failed");
    nibble = 4'b1101; #10; if (encoder !== 7'b0100011) $display("FAIL: Test case 13 failed");
    nibble = 4'b1110; #10; if (encoder !== 7'b1000000) $display("FAIL: Test case 14 failed");
    nibble = 4'b1111; #10; if (encoder !== 7'b0111000) $display("FAIL: Test case 15 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule