`timescale 1ns/1ps

module tb_priority_encoder;

  reg [7:0] in;
  wire [2:0] out;

  // Instantiate the module under test (uut)
  priority_encoder uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: Only the highest bit is set
    in = 8'b10000000; #10;
    if (out !== 3'b111) $display("FAIL: Test case 1 failed, expected 3'b111, got %b", out);

    // Test case 2: Second highest bit is set
    in = 8'b01000000; #10;
    if (out !== 3'b110) $display("FAIL: Test case 2 failed, expected 3'b110, got %b", out);

    // Test case 3: Middle bit is set
    in = 8'b00100000; #10;
    if (out !== 3'b101) $display("FAIL: Test case 3 failed, expected 3'b101, got %b", out);

    // Test case 4: Lower middle bit is set
    in = 8'b00010000; #10;
    if (out !== 3'b100) $display("FAIL: Test case 4 failed, expected 3'b100, got %b", out);

    // Test case 5: Lower bit is set
    in = 8'b00000010; #10;
    if (out !== 3'b001) $display("FAIL: Test case 5 failed, expected 3'b001, got %b", out);

    // Test case 6: No bits are set
    in = 8'b00000000; #10;
    if (out !== 3'b000) $display("FAIL: Test case 6 failed, expected 3'b000, got %b", out);

    // Test case 7: Multiple bits set, highest priority should be taken
    in = 8'b01100000; #10;
    if (out !== 3'b110) $display("FAIL: Test case 7 failed, expected 3'b110, got %b", out);

    // Test case 8: Multiple bits set, highest priority should be taken
    in = 8'b00000111; #10;
    if (out !== 3'b011) $display("FAIL: Test case 8 failed, expected 3'b011, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule