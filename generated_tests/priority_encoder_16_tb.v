`timescale 1ns/1ps

module tb_priority_encoder;

  reg [7:0] i;
  wire [2:0] y;

  // Instantiate the module under test (uut)
  priority_encoder uut (
    .i(i),
    .y(y)
  );

  initial begin
    // Test case 1: Input with highest bit set
    i = 8'b10000000; // Expect y = 7
    #10;
    if (y !== 3'b111) $display("FAIL: Test case 1 failed, expected y = 7, got y = %b", y);

    // Test case 2: Input with second highest bit set
    i = 8'b01000000; // Expect y = 6
    #10;
    if (y !== 3'b110) $display("FAIL: Test case 2 failed, expected y = 6, got y = %b", y);

    // Test case 3: Input with middle bit set
    i = 8'b00010000; // Expect y = 3
    #10;
    if (y !== 3'b011) $display("FAIL: Test case 3 failed, expected y = 3, got y = %b", y);

    // Test case 4: Input with lowest bit set
    i = 8'b00000001; // Expect y = 0
    #10;
    if (y !== 3'b000) $display("FAIL: Test case 4 failed, expected y = 0, got y = %b", y);

    // Test case 5: Input with no bits set
    i = 8'b00000000; // Expect y = 0
    #10;
    if (y !== 3'b000) $display("FAIL: Test case 5 failed, expected y = 0, got y = %b", y);

    // Test case 6: Input with multiple bits set
    i = 8'b01100000; // Expect y = 6
    #10;
    if (y !== 3'b110) $display("FAIL: Test case 6 failed, expected y = 6, got y = %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule