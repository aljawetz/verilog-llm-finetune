`timescale 1ns/1ps

module tb_encoder8x3;
  reg [7:0] A;
  wire [2:0] Y;

  // Instantiate the module under test
  encoder8x3 uut (
    .A(A),
    .Y(Y)
  );

  initial begin
    // Test case 1: A = 8'b00000000, expect Y = 3'b000
    A = 8'b00000000; #10;
    if (Y !== 3'b000) $display("FAIL: Test case 1 failed, expected Y = 3'b000, got Y = %b", Y);

    // Test case 2: A = 8'b00000001, expect Y = 3'b000
    A = 8'b00000001; #10;
    if (Y !== 3'b000) $display("FAIL: Test case 2 failed, expected Y = 3'b000, got Y = %b", Y);

    // Test case 3: A = 8'b00000010, expect Y = 3'b000
    A = 8'b00000010; #10;
    if (Y !== 3'b000) $display("FAIL: Test case 3 failed, expected Y = 3'b000, got Y = %b", Y);

    // Test case 4: A = 8'b00000100, expect Y = 3'b000
    A = 8'b00000100; #10;
    if (Y !== 3'b000) $display("FAIL: Test case 4 failed, expected Y = 3'b000, got Y = %b", Y);

    // Test case 5: A = 8'b00001000, expect Y = 3'b000
    A = 8'b00001000; #10;
    if (Y !== 3'b000) $display("FAIL: Test case 5 failed, expected Y = 3'b000, got Y = %b", Y);

    // Test case 6: A = 8'b00010000, expect Y = 3'b000
    A = 8'b00010000; #10;
    if (Y !== 3'b000) $display("FAIL: Test case 6 failed, expected Y = 3'b000, got Y = %b", Y);

    // Test case 7: A = 8'b00100000, expect Y = 3'b000
    A = 8'b00100000; #10;
    if (Y !== 3'b000) $display("FAIL: Test case 7 failed, expected Y = 3'b000, got Y = %b", Y);

    // Test case 8: A = 8'b01000000, expect Y = 3'b000
    A = 8'b01000000; #10;
    if (Y !== 3'b000) $display("FAIL: Test case 8 failed, expected Y = 3'b000, got Y = %b", Y);

    // Test case 9: A = 8'b10000000, expect Y = 3'b000
    A = 8'b10000000; #10;
    if (Y !== 3'b000) $display("FAIL: Test case 9 failed, expected Y = 3'b000, got Y = %b", Y);

    // Test case 10: A = 8'b00001111, expect Y = 3'b011
    A = 8'b00001111; #10;
    if (Y !== 3'b011) $display("FAIL: Test case 10 failed, expected Y = 3'b011, got Y = %b", Y);

    // Test case 11: A = 8'b11111111, expect Y = 3'b111
    A = 8'b11111111; #10;
    if (Y !== 3'b111) $display("FAIL: Test case 11 failed, expected Y = 3'b111, got Y = %b", Y);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule