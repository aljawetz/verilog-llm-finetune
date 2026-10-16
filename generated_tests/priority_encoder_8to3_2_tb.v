`timescale 1ns/1ps

module tb_priority_encoder_8to3;

  reg [7:0] din;
  wire [2:0] dout;

  // Instantiate the Unit Under Test (UUT)
  priority_encoder_8to3 uut (
    .dout(dout),
    .din(din)
  );

  initial begin
    // Test case 1: Only the least significant bit is high
    din = 8'b00000001; #10;
    if (dout !== 3'b000) $display("FAIL: Expected dout = 000 for din = 00000001, got dout = %b", dout);

    // Test case 2: Second bit is high
    din = 8'b00000010; #10;
    if (dout !== 3'b001) $display("FAIL: Expected dout = 001 for din = 00000010, got dout = %b", dout);

    // Test case 3: Third bit is high
    din = 8'b00000100; #10;
    if (dout !== 3'b010) $display("FAIL: Expected dout = 010 for din = 00000100, got dout = %b", dout);

    // Test case 4: Fourth bit is high
    din = 8'b00001000; #10;
    if (dout !== 3'b011) $display("FAIL: Expected dout = 011 for din = 00001000, got dout = %b", dout);

    // Test case 5: Fifth bit is high
    din = 8'b00010000; #10;
    if (dout !== 3'b100) $display("FAIL: Expected dout = 100 for din = 00010000, got dout = %b", dout);

    // Test case 6: Sixth bit is high
    din = 8'b00100000; #10;
    if (dout !== 3'b101) $display("FAIL: Expected dout = 101 for din = 00100000, got dout = %b", dout);

    // Test case 7: Seventh bit is high
    din = 8'b01000000; #10;
    if (dout !== 3'b110) $display("FAIL: Expected dout = 110 for din = 01000000, got dout = %b", dout);

    // Test case 8: Eighth bit is high
    din = 8'b10000000; #10;
    if (dout !== 3'b111) $display("FAIL: Expected dout = 111 for din = 10000000, got dout = %b", dout);

    // Test case 9: Multiple bits high (highest priority bit should be taken)
    din = 8'b11000000; #10;
    if (dout !== 3'b111) $display("FAIL: Expected dout = 111 for din = 11000000, got dout = %b", dout);

    // Test case 10: All bits low
    din = 8'b00000000; #10;
    if (dout !== 3'bxxx) $display("FAIL: Expected dout = xxx for din = 00000000, got dout = %b", dout);

    $display("PASS");
    $finish;
  end

endmodule