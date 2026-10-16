`timescale 1ns/1ps

module tb_priority_encoder;

  reg [7:0] Y;
  wire [2:0] A;

  // Instantiate the module under test (uut)
  priority_encoder uut (
    .Y(Y),
    .A(A)
  );

  initial begin
    // Test case 1: Check highest priority (Y[7] = 1)
    Y = 8'b10000000; // Expect A = 3'b111
    #10;
    if (A !== 3'b111) $display("FAIL: Test case 1 failed, expected A = 3'b111, got A = %b", A);

    // Test case 2: Check next highest priority (Y[6] = 1)
    Y = 8'b01000000; // Expect A = 3'b110
    #10;
    if (A !== 3'b110) $display("FAIL: Test case 2 failed, expected A = 3'b110, got A = %b", A);

    // Test case 3: Check middle priority (Y[4] = 1)
    Y = 8'b00010000; // Expect A = 3'b100
    #10;
    if (A !== 3'b100) $display("FAIL: Test case 3 failed, expected A = 3'b100, got A = %b", A);

    // Test case 4: Check lower priority (Y[1] = 1)
    Y = 8'b00000010; // Expect A = 3'b001
    #10;
    if (A !== 3'b001) $display("FAIL: Test case 4 failed, expected A = 3'b001, got A = %b", A);

    // Test case 5: Check all zeros (no input high)
    Y = 8'b00000000; // Expect A = 3'b000
    #10;
    if (A !== 3'b000) $display("FAIL: Test case 5 failed, expected A = 3'b000, got A = %b", A);

    // Test case 6: Check multiple inputs high (Y[5] = 1, Y[6] = 1)
    Y = 8'b01100000; // Expect A = 3'b110 (Y[6] has higher priority)
    #10;
    if (A !== 3'b110) $display("FAIL: Test case 6 failed, expected A = 3'b110, got A = %b", A);

    // Test case 7: Check multiple inputs high (Y[3] = 1, Y[5] = 1)
    Y = 8'b00101000; // Expect A = 3'b101 (Y[5] has higher priority)
    #10;
    if (A !== 3'b101) $display("FAIL: Test case 7 failed, expected A = 3'b101, got A = %b", A);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule