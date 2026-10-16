`timescale 1ns/1ps

module tb_priorityencoder;

  reg [7:0] A;
  wire [2:0] Y;

  // Instantiate the module under test
  priorityencoder uut (
    .A(A),
    .Y(Y)
  );

  initial begin
    // Test case 1: Only the least significant bit is high
    A = 8'b00000001; #10;
    if (Y !== 3'b000) $display("FAIL: Test case 1 failed, expected Y=000, got Y=%b", Y);

    // Test case 2: Second least significant bit is high
    A = 8'b00000010; #10;
    if (Y !== 3'b001) $display("FAIL: Test case 2 failed, expected Y=001, got Y=%b", Y);

    // Test case 3: Third least significant bit is high
    A = 8'b00000100; #10;
    if (Y !== 3'b010) $display("FAIL: Test case 3 failed, expected Y=010, got Y=%b", Y);

    // Test case 4: Fourth least significant bit is high
    A = 8'b00001000; #10;
    if (Y !== 3'b011) $display("FAIL: Test case 4 failed, expected Y=011, got Y=%b", Y);

    // Test case 5: Fifth least significant bit is high
    A = 8'b00010000; #10;
    if (Y !== 3'b100) $display("FAIL: Test case 5 failed, expected Y=100, got Y=%b", Y);

    // Test case 6: Sixth least significant bit is high
    A = 8'b00100000; #10;
    if (Y !== 3'b101) $display("FAIL: Test case 6 failed, expected Y=101, got Y=%b", Y);

    // Test case 7: Seventh least significant bit is high
    A = 8'b01000000; #10;
    if (Y !== 3'b110) $display("FAIL: Test case 7 failed, expected Y=110, got Y=%b", Y);

    // Test case 8: Most significant bit is high
    A = 8'b10000000; #10;
    if (Y !== 3'b111) $display("FAIL: Test case 8 failed, expected Y=111, got Y=%b", Y);

    // Test case 9: Multiple bits high (highest priority)
    A = 8'b11000000; #10;
    if (Y !== 3'b111) $display("FAIL: Test case 9 failed, expected Y=111, got Y=%b", Y);

    // Test case 10: No bits high
    A = 8'b00000000; #10;
    if (Y !== 3'bx) $display("FAIL: Test case 10 failed, expected Y=x, got Y=%b", Y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule