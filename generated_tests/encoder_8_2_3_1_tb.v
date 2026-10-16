`timescale 1ns/1ps

module tb_encoder_8_2_3;

  reg [7:0] i;
  wire [2:0] O;

  // Instantiate the module under test (uut)
  encoder_8_2_3 uut (
    .i(i),
    .O(O)
  );

  initial begin
    // Test case 1: Input is one-hot at position 0
    i = 8'b0000_0001; #10;
    if (O !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", O);

    // Test case 2: Input is one-hot at position 1
    i = 8'b0000_0010; #10;
    if (O !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", O);

    // Test case 3: Input is one-hot at position 2
    i = 8'b0000_0100; #10;
    if (O !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", O);

    // Test case 4: Input is one-hot at position 3
    i = 8'b0000_1000; #10;
    if (O !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", O);

    // Test case 5: Input is one-hot at position 4
    i = 8'b0001_0000; #10;
    if (O !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", O);

    // Test case 6: Input is one-hot at position 5
    i = 8'b0010_0000; #10;
    if (O !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", O);

    // Test case 7: Input is one-hot at position 6
    i = 8'b0100_0000; #10;
    if (O !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", O);

    // Test case 8: Input is one-hot at position 7
    i = 8'b1000_0000; #10;
    if (O !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", O);

    // Test case 9: No valid input
    i = 8'b0000_0000; #10;
    if (O !== 3'b000) $display("FAIL: Test case 9 failed, expected 000, got %b", O);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule