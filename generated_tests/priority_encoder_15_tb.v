`timescale 1ns/1ps

module tb_priority_encoder;

  reg [7:0] d;
  wire [2:0] y;

  // Instantiate the priority encoder
  priority_encoder uut (
    .d(d),
    .y(y)
  );

  initial begin
    // Test case 1: Only the highest bit is active
    d = 8'b10000000; #10;
    if (y !== 3'b000) $display("FAIL: Expected y=000 for d=10000000, got y=%b", y);

    // Test case 2: Second highest bit is active
    d = 8'b01000000; #10;
    if (y !== 3'b001) $display("FAIL: Expected y=001 for d=01000000, got y=%b", y);

    // Test case 3: Middle bit is active
    d = 8'b00010000; #10;
    if (y !== 3'b011) $display("FAIL: Expected y=011 for d=00010000, got y=%b", y);

    // Test case 4: Lower bit is active
    d = 8'b00000010; #10;
    if (y !== 3'b111) $display("FAIL: Expected y=111 for d=00000010, got y=%b", y);

    // Test case 5: Multiple bits active, highest priority should be selected
    d = 8'b00110000; #10;
    if (y !== 3'b011) $display("FAIL: Expected y=011 for d=00110000, got y=%b", y);

    // Test case 6: All bits inactive
    d = 8'b00000000; #10;
    if (y !== 3'bxxx) $display("FAIL: Expected y=xxx for d=00000000, got y=%b", y);

    // Test case 7: Last bit active
    d = 8'b00000001; #10;
    if (y !== 3'b111) $display("FAIL: Expected y=111 for d=00000001, got y=%b", y);

    // Test case 8: Random active bits
    d = 8'b01010101; #10;
    if (y !== 3'b001) $display("FAIL: Expected y=001 for d=01010101, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule