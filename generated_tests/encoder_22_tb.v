`timescale 1ns/1ps

module tb_encoder;
  reg [7:0] D;
  wire [2:0] y;

  // Instantiate the encoder module
  encoder uut (
    .D(D),
    .y(y)
  );

  initial begin
    // Test case 1: Only the highest bit is active
    D = 8'b10000000; #10;
    if (y !== 3'b111) $display("FAIL: Test case 1 failed, expected 3'b111 but got %b", y);

    // Test case 2: Second highest bit is active
    D = 8'b01000000; #10;
    if (y !== 3'b110) $display("FAIL: Test case 2 failed, expected 3'b110 but got %b", y);

    // Test case 3: Middle bit is active
    D = 8'b00100000; #10;
    if (y !== 3'b101) $display("FAIL: Test case 3 failed, expected 3'b101 but got %b", y);

    // Test case 4: Lower middle bit is active
    D = 8'b00010000; #10;
    if (y !== 3'b100) $display("FAIL: Test case 4 failed, expected 3'b100 but got %b", y);

    // Test case 5: Lower bit is active
    D = 8'b00001000; #10;
    if (y !== 3'b011) $display("FAIL: Test case 5 failed, expected 3'b011 but got %b", y);

    // Test case 6: Second lowest bit is active
    D = 8'b00000100; #10;
    if (y !== 3'b010) $display("FAIL: Test case 6 failed, expected 3'b010 but got %b", y);

    // Test case 7: Third lowest bit is active
    D = 8'b00000010; #10;
    if (y !== 3'b001) $display("FAIL: Test case 7 failed, expected 3'b001 but got %b", y);

    // Test case 8: Lowest bit is active
    D = 8'b00000001; #10;
    if (y !== 3'b000) $display("FAIL: Test case 8 failed, expected 3'b000 but got %b", y);

    // Test case 9: No bits are active
    D = 8'b00000000; #10;
    if (y !== 3'b000) $display("FAIL: Test case 9 failed, expected 3'b000 but got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule