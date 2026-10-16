`timescale 1ns/1ps

module tb_priorityencoder;

  reg [7:0] in;
  wire [2:0] out;

  // Instantiate the module under test (uut)
  priorityencoder uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: Only the highest bit is high
    in = 8'b10000000; // Expected output: 3'b111
    #10;
    if (out !== 3'b111) $display("FAIL: Test case 1 failed, expected 3'b111 but got %b", out);

    // Test case 2: Middle bit is high
    in = 8'b00100000; // Expected output: 3'b101
    #10;
    if (out !== 3'b101) $display("FAIL: Test case 2 failed, expected 3'b101 but got %b", out);

    // Test case 3: Lower bit is high
    in = 8'b00000010; // Expected output: 3'b001
    #10;
    if (out !== 3'b001) $display("FAIL: Test case 3 failed, expected 3'b001 but got %b", out);

    // Test case 4: Multiple bits high, highest should be prioritized
    in = 8'b01100000; // Expected output: 3'b110
    #10;
    if (out !== 3'b110) $display("FAIL: Test case 4 failed, expected 3'b110 but got %b", out);

    // Test case 5: No bits high
    in = 8'b00000000; // Expected output: 3'b000
    #10;
    if (out !== 3'b000) $display("FAIL: Test case 5 failed, expected 3'b000 but got %b", out);

    // Test case 6: Highest bit and lower bits high
    in = 8'b11111111; // Expected output: 3'b111
    #10;
    if (out !== 3'b111) $display("FAIL: Test case 6 failed, expected 3'b111 but got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule