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
    if (dout !== 3'b000) $display("FAIL: Test case 1 failed, expected dout = 000, got dout = %b", dout);

    // Test case 2: Second bit is high
    din = 8'b00000010; #10;
    if (dout !== 3'b001) $display("FAIL: Test case 2 failed, expected dout = 001, got dout = %b", dout);

    // Test case 3: Third bit is high
    din = 8'b00000100; #10;
    if (dout !== 3'b010) $display("FAIL: Test case 3 failed, expected dout = 010, got dout = %b", dout);

    // Test case 4: Fourth bit is high
    din = 8'b00001000; #10;
    if (dout !== 3'b011) $display("FAIL: Test case 4 failed, expected dout = 011, got dout = %b", dout);

    // Test case 5: Fifth bit is high
    din = 8'b00010000; #10;
    if (dout !== 3'b100) $display("FAIL: Test case 5 failed, expected dout = 100, got dout = %b", dout);

    // Test case 6: Sixth bit is high
    din = 8'b00100000; #10;
    if (dout !== 3'b101) $display("FAIL: Test case 6 failed, expected dout = 101, got dout = %b", dout);

    // Test case 7: Seventh bit is high
    din = 8'b01000000; #10;
    if (dout !== 3'b110) $display("FAIL: Test case 7 failed, expected dout = 110, got dout = %b", dout);

    // Test case 8: Eighth bit is high
    din = 8'b10000000; #10;
    if (dout !== 3'b111) $display("FAIL: Test case 8 failed, expected dout = 111, got dout = %b", dout);

    // Test case 9: Multiple bits high (highest priority bit should be selected)
    din = 8'b11000000; #10;
    if (dout !== 3'b111) $display("FAIL: Test case 9 failed, expected dout = 111, got dout = %b", dout);

    // Test case 10: All bits low
    din = 8'b00000000; #10;
    if (dout !== 3'bxxx) $display("FAIL: Test case 10 failed, expected dout = xxx, got dout = %b", dout);

    $display("PASS");
    $finish;
  end

endmodule