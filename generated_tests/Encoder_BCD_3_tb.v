`timescale 1ns/1ps

module tb_Encoder_BCD;

  reg [9:0] Y;
  wire [3:0] A;

  // Instantiate the module under test
  Encoder_BCD uut (
    .Y(Y),
    .A(A)
  );

  initial begin
    // Test case 1: Input is 1 at position 0 (Y = 10'b0000000001)
    Y = 10'b0000000001; #10;
    if (A !== 4'b0000) $display("FAIL: Test case 1 failed, expected A = 0000, got A = %b", A);

    // Test case 2: Input is 1 at position 1 (Y = 10'b0000000010)
    Y = 10'b0000000010; #10;
    if (A !== 4'b0001) $display("FAIL: Test case 2 failed, expected A = 0001, got A = %b", A);

    // Test case 3: Input is 1 at position 2 (Y = 10'b0000000100)
    Y = 10'b0000000100; #10;
    if (A !== 4'b0010) $display("FAIL: Test case 3 failed, expected A = 0010, got A = %b", A);

    // Test case 4: Input is 1 at position 3 (Y = 10'b0000001000)
    Y = 10'b0000001000; #10;
    if (A !== 4'b0011) $display("FAIL: Test case 4 failed, expected A = 0011, got A = %b", A);

    // Test case 5: Input is 1 at position 4 (Y = 10'b0000010000)
    Y = 10'b0000010000; #10;
    if (A !== 4'b0100) $display("FAIL: Test case 5 failed, expected A = 0100, got A = %b", A);

    // Test case 6: Input is 1 at position 5 (Y = 10'b0000100000)
    Y = 10'b0000100000; #10;
    if (A !== 4'b0101) $display("FAIL: Test case 6 failed, expected A = 0101, got A = %b", A);

    // Test case 7: Input is 1 at position 6 (Y = 10'b0001000000)
    Y = 10'b0001000000; #10;
    if (A !== 4'b0110) $display("FAIL: Test case 7 failed, expected A = 0110, got A = %b", A);

    // Test case 8: Input is 1 at position 7 (Y = 10'b0010000000)
    Y = 10'b0010000000; #10;
    if (A !== 4'b0111) $display("FAIL: Test case 8 failed, expected A = 0111, got A = %b", A);

    // Test case 9: Input is 1 at position 8 (Y = 10'b0100000000)
    Y = 10'b0100000000; #10;
    if (A !== 4'b1000) $display("FAIL: Test case 9 failed, expected A = 1000, got A = %b", A);

    // Test case 10: Input is 1 at position 9 (Y = 10'b1000000000)
    Y = 10'b1000000000; #10;
    if (A !== 4'b1001) $display("FAIL: Test case 10 failed, expected A = 1001, got A = %b", A);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule