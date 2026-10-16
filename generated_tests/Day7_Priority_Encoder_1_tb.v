`timescale 1ns/1ps

module tb_Day7_Priority_Encoder;

  reg [7:0] data;
  wire [2:0] pos;
  
  // Instantiate the Unit Under Test (UUT)
  Day7_Priority_Encoder uut (
    .data(data),
    .pos(pos)
  );

  initial begin
    // Test case 1: Only the least significant bit is high
    data = 8'b00000001; #10;
    if (pos !== 3'b000) $display("FAIL: Test case 1 failed, expected pos = 000, got pos = %b", pos);

    // Test case 2: Second least significant bit is high
    data = 8'b00000010; #10;
    if (pos !== 3'b001) $display("FAIL: Test case 2 failed, expected pos = 001, got pos = %b", pos);

    // Test case 3: Third least significant bit is high
    data = 8'b00000100; #10;
    if (pos !== 3'b010) $display("FAIL: Test case 3 failed, expected pos = 010, got pos = %b", pos);

    // Test case 4: Fourth least significant bit is high
    data = 8'b00001000; #10;
    if (pos !== 3'b011) $display("FAIL: Test case 4 failed, expected pos = 011, got pos = %b", pos);

    // Test case 5: Fifth least significant bit is high
    data = 8'b00010000; #10;
    if (pos !== 3'b100) $display("FAIL: Test case 5 failed, expected pos = 100, got pos = %b", pos);

    // Test case 6: Sixth least significant bit is high
    data = 8'b00100000; #10;
    if (pos !== 3'b101) $display("FAIL: Test case 6 failed, expected pos = 101, got pos = %b", pos);

    // Test case 7: Seventh least significant bit is high
    data = 8'b01000000; #10;
    if (pos !== 3'b110) $display("FAIL: Test case 7 failed, expected pos = 110, got pos = %b", pos);

    // Test case 8: Most significant bit is high
    data = 8'b10000000; #10;
    if (pos !== 3'b111) $display("FAIL: Test case 8 failed, expected pos = 111, got pos = %b", pos);

    // Test case 9: Multiple bits high, least significant should take precedence
    data = 8'b00000111; #10;
    if (pos !== 3'b000) $display("FAIL: Test case 9 failed, expected pos = 000, got pos = %b", pos);

    // Test case 10: All bits low
    data = 8'b00000000; #10;
    if (pos !== 3'b000) $display("FAIL: Test case 10 failed, expected pos = 000, got pos = %b", pos);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule