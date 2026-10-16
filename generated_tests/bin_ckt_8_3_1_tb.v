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
    i = 8'b00000000;
    #10;
    if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", y);

    // Test case 2: All inputs are 1
    i = 8'b11111111;
    #10;
    if (y !== 3'b111) $display("FAIL: Test case 2 failed, expected 111, got %b", y);

    // Test case 3: Alternating bits
    i = 8'b10101010;
    #10;
    if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", y);

    // Test case 4: Only the last four bits are 1
    i = 8'b00001111;
    #10;
    if (y !== 3'b111) $display("FAIL: Test case 4 failed, expected 111, got %b", y);

    // Test case 5: Random pattern
    i = 8'b11010101;
    #10;
    if (y !== 3'b101) $display("FAIL: Test case 5 failed, expected 101, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule