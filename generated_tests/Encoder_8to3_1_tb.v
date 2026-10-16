`timescale 1ns/1ps

module tb_Encoder_8to3;

  reg [7:0] data_in;
  wire [2:0] encoded_output;

  // Instantiate the module under test
  Encoder_8to3 uut (
    .data_in(data_in),
    .encoded_output(encoded_output)
  );

  initial begin
    // Test case 1: Single high bit at position 0
    data_in = 8'b00000001; #10;
    if (encoded_output !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", encoded_output);

    // Test case 2: Single high bit at position 1
    data_in = 8'b00000010; #10;
    if (encoded_output !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", encoded_output);

    // Test case 3: Single high bit at position 2
    data_in = 8'b00000100; #10;
    if (encoded_output !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", encoded_output);

    // Test case 4: Single high bit at position 3
    data_in = 8'b00001000; #10;
    if (encoded_output !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", encoded_output);

    // Test case 5: Single high bit at position 4
    data_in = 8'b00010000; #10;
    if (encoded_output !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", encoded_output);

    // Test case 6: Single high bit at position 5
    data_in = 8'b00100000; #10;
    if (encoded_output !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", encoded_output);

    // Test case 7: Single high bit at position 6
    data_in = 8'b01000000; #10;
    if (encoded_output !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", encoded_output);

    // Test case 8: Single high bit at position 7
    data_in = 8'b10000000; #10;
    if (encoded_output !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", encoded_output);

    // Test case 9: No high bits
    data_in = 8'b00000000; #10;
    if (encoded_output !== 3'b000) $display("FAIL: Test case 9 failed, expected 000, got %b", encoded_output);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule