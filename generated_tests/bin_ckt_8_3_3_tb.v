`timescale 1ns/1ps

module tb_bin_ckt_8_3;

  // Inputs
  reg [7:0] i;

  // Outputs
  wire [2:0] y;

  // Instantiate the Unit Under Test (UUT)
  bin_ckt_8_3 uut (
    .i(i),
    .y(y)
  );

  initial begin
    // Test case 1: All inputs are 0
    i = 8'b00000000; #10;
    if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected y = 000, got y = %b", y);

    // Test case 2: Only the first bit is 1
    i = 8'b00000001; #10;
    if (y !== 3'b000) $display("FAIL: Test case 2 failed, expected y = 000, got y = %b", y);

    // Test case 3: Only the second bit is 1
    i = 8'b00000010; #10;
    if (y !== 3'b000) $display("FAIL: Test case 3 failed, expected y = 000, got y = %b", y);

    // Test case 4: Bits 1 and 3 are 1
    i = 8'b00001010; #10;
    if (y !== 3'b001) $display("FAIL: Test case 4 failed, expected y = 001, got y = %b", y);

    // Test case 5: Bits 2 and 3 are 1
    i = 8'b00001100; #10;
    if (y !== 3'b001) $display("FAIL: Test case 5 failed, expected y = 001, got y = %b", y);

    // Test case 6: Bits 4 and 5 are 1
    i = 8'b00110000; #10;
    if (y !== 3'b010) $display("FAIL: Test case 6 failed, expected y = 010, got y = %b", y);

    // Test case 7: All bits are 1
    i = 8'b11111111; #10;
    if (y !== 3'b111) $display("FAIL: Test case 7 failed, expected y = 111, got y = %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule