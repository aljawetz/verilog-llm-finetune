`timescale 1ns/1ps

module tb_Encoder_8x3;

  reg [7:0] inn;
  wire [2:0] out;
  
  // Instantiate the Encoder_8x3 module
  Encoder_8x3 uut (
    .out(out),
    .inn(inn)
  );

  initial begin
    // Test case 1: Valid one-hot input
    inn = 8'b00000001; #10;
    if (out !== 3'b000) $display("FAIL: Expected 3'b000 for input 8'b00000001, got %b", out);

    // Test case 2: Valid one-hot input
    inn = 8'b00000010; #10;
    if (out !== 3'b001) $display("FAIL: Expected 3'b001 for input 8'b00000010, got %b", out);

    // Test case 3: Valid one-hot input
    inn = 8'b00000100; #10;
    if (out !== 3'b010) $display("FAIL: Expected 3'b010 for input 8'b00000100, got %b", out);

    // Test case 4: Valid one-hot input
    inn = 8'b00001000; #10;
    if (out !== 3'b011) $display("FAIL: Expected 3'b011 for input 8'b00001000, got %b", out);

    // Test case 5: Valid one-hot input
    inn = 8'b00010000; #10;
    if (out !== 3'b100) $display("FAIL: Expected 3'b100 for input 8'b00010000, got %b", out);

    // Test case 6: Valid one-hot input
    inn = 8'b00100000; #10;
    if (out !== 3'b101) $display("FAIL: Expected 3'b101 for input 8'b00100000, got %b", out);

    // Test case 7: Valid one-hot input
    inn = 8'b01000000; #10;
    if (out !== 3'b110) $display("FAIL: Expected 3'b110 for input 8'b01000000, got %b", out);

    // Test case 8: Valid one-hot input
    inn = 8'b10000000; #10;
    if (out !== 3'b111) $display("FAIL: Expected 3'b111 for input 8'b10000000, got %b", out);

    // Test case 9: Invalid input (not one-hot)
    inn = 8'b00000000; #10;
    if (out !== 3'bxxx) $display("FAIL: Expected 3'bxxx for input 8'b00000000, got %b", out);

    // Test case 10: Invalid input (not one-hot)
    inn = 8'b00000011; #10;
    if (out !== 3'bxxx) $display("FAIL: Expected 3'bxxx for input 8'b00000011, got %b", out);

    // Test case 11: Invalid input (not one-hot)
    inn = 8'b11111111; #10;
    if (out !== 3'bxxx) $display("FAIL: Expected 3'bxxx for input 8'b11111111, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule