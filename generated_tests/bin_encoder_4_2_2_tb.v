`timescale 1ns/1ps

module tb_bin_encoder_4_2;

  // Inputs
  reg [3:0] i;

  // Outputs
  wire y0;
  wire y1;

  // Instantiate the Unit Under Test (UUT)
  bin_encoder_4_2 uut (
    .i(i),
    .y0(y0),
    .y1(y1)
  );

  initial begin
    // Test case 1: Input = 4'b0000
    i = 4'b0000; #10;
    if (y0 !== 1'b0 || y1 !== 1'b0) $display("FAIL: Test case 1 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 2: Input = 4'b0001
    i = 4'b0001; #10;
    if (y0 !== 1'b0 || y1 !== 1'b0) $display("FAIL: Test case 2 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 3: Input = 4'b0010
    i = 4'b0010; #10;
    if (y0 !== 1'b0 || y1 !== 1'b1) $display("FAIL: Test case 3 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 4: Input = 4'b0011
    i = 4'b0011; #10;
    if (y0 !== 1'b1 || y1 !== 1'b1) $display("FAIL: Test case 4 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 5: Input = 4'b0100
    i = 4'b0100; #10;
    if (y0 !== 1'b0 || y1 !== 1'b1) $display("FAIL: Test case 5 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 6: Input = 4'b0101
    i = 4'b0101; #10;
    if (y0 !== 1'b1 || y1 !== 1'b1) $display("FAIL: Test case 6 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 7: Input = 4'b0110
    i = 4'b0110; #10;
    if (y0 !== 1'b1 || y1 !== 1'b1) $display("FAIL: Test case 7 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 8: Input = 4'b0111
    i = 4'b0111; #10;
    if (y0 !== 1'b1 || y1 !== 1'b1) $display("FAIL: Test case 8 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 9: Input = 4'b1000
    i = 4'b1000; #10;
    if (y0 !== 1'b1 || y1 !== 1'b0) $display("FAIL: Test case 9 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 10: Input = 4'b1001
    i = 4'b1001; #10;
    if (y0 !== 1'b1 || y1 !== 1'b0) $display("FAIL: Test case 10 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 11: Input = 4'b1010
    i = 4'b1010; #10;
    if (y0 !== 1'b1 || y1 !== 1'b1) $display("FAIL: Test case 11 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 12: Input = 4'b1011
    i = 4'b1011; #10;
    if (y0 !== 1'b1 || y1 !== 1'b1) $display("FAIL: Test case 12 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 13: Input = 4'b1100
    i = 4'b1100; #10;
    if (y0 !== 1'b1 || y1 !== 1'b1) $display("FAIL: Test case 13 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 14: Input = 4'b1101
    i = 4'b1101; #10;
    if (y0 !== 1'b1 || y1 !== 1'b1) $display("FAIL: Test case 14 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 15: Input = 4'b1110
    i = 4'b1110; #10;
    if (y0 !== 1'b1 || y1 !== 1'b1) $display("FAIL: Test case 15 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // Test case 16: Input = 4'b1111
    i = 4'b1111; #10;
    if (y0 !== 1'b1 || y1 !== 1'b1) $display("FAIL: Test case 16 failed with i = %b, got y0 = %b, y1 = %b", i, y0, y1);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule