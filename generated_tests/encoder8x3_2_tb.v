`timescale 1ns/1ps

module tb_encoder8x3;

  reg [7:0] in;
  wire [2:0] out;

  // Instantiate the encoder module
  encoder8x3 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: One-hot input for 0
    in = 8'b0000_0001; #10;
    if (out !== 3'b000) $display("FAIL: Expected 3'b000 for input 8'b0000_0001, got %b", out);

    // Test case 2: One-hot input for 1
    in = 8'b0000_0010; #10;
    if (out !== 3'b001) $display("FAIL: Expected 3'b001 for input 8'b0000_0010, got %b", out);

    // Test case 3: One-hot input for 2
    in = 8'b0000_0100; #10;
    if (out !== 3'b010) $display("FAIL: Expected 3'b010 for input 8'b0000_0100, got %b", out);

    // Test case 4: One-hot input for 3
    in = 8'b0000_1000; #10;
    if (out !== 3'b011) $display("FAIL: Expected 3'b011 for input 8'b0000_1000, got %b", out);

    // Test case 5: One-hot input for 4
    in = 8'b0001_0000; #10;
    if (out !== 3'b100) $display("FAIL: Expected 3'b100 for input 8'b0001_0000, got %b", out);

    // Test case 6: One-hot input for 5
    in = 8'b0010_0000; #10;
    if (out !== 3'b101) $display("FAIL: Expected 3'b101 for input 8'b0010_0000, got %b", out);

    // Test case 7: One-hot input for 6
    in = 8'b0100_0000; #10;
    if (out !== 3'b110) $display("FAIL: Expected 3'b110 for input 8'b0100_0000, got %b", out);

    // Test case 8: One-hot input for 7
    in = 8'b1000_0000; #10;
    if (out !== 3'b111) $display("FAIL: Expected 3'b111 for input 8'b1000_0000, got %b", out);

    // Test case 9: Invalid input (no one-hot)
    in = 8'b0000_0000; #10;
    if (out !== 3'bzzz) $display("FAIL: Expected 3'bzzz for input 8'b0000_0000, got %b", out);

    // Test case 10: Invalid input (multiple bits high)
    in = 8'b0000_0011; #10;
    if (out !== 3'bzzz) $display("FAIL: Expected 3'bzzz for input 8'b0000_0011, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule