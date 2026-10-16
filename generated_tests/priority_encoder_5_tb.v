`timescale 1ns/1ps

module tb_priority_encoder;

  reg [7:0] i;
  wire [2:0] y;
  wire valid;

  // Instantiate the module under test (uut)
  priority_encoder uut (
    .i(i),
    .y(y),
    .valid(valid)
  );

  initial begin
    // Test case 1: Highest bit set (i = 8'b10000000)
    i = 8'b10000000; #10;
    if (y !== 3'b111 || valid !== 1) $display("FAIL: Test case 1 failed");

    // Test case 2: Second highest bit set (i = 8'b01000000)
    i = 8'b01000000; #10;
    if (y !== 3'b110 || valid !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: Middle bit set (i = 8'b00010000)
    i = 8'b00010000; #10;
    if (y !== 3'b100 || valid !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: Lower bit set (i = 8'b00000010)
    i = 8'b00000010; #10;
    if (y !== 3'b001 || valid !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: No bits set (i = 8'b00000000)
    i = 8'b00000000; #10;
    if (y !== 3'b000 || valid !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: Multiple bits set (i = 8'b00101000)
    i = 8'b00101000; #10;
    if (y !== 3'b101 || valid !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: Last bit set (i = 8'b00000001)
    i = 8'b00000001; #10;
    if (y !== 3'b000 || valid !== 1) $display("FAIL: Test case 7 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule