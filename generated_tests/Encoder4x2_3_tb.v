`timescale 1ns/1ps

module tb_Encoder4x2;

  reg [3:0] Y;
  wire [1:0] A;

  // Instantiate the Encoder4x2 module
  Encoder4x2 uut (
    .Y(Y),
    .A(A)
  );

  initial begin
    // Test case 1: Y = 4'b0000, expect A = 2'b00
    Y = 4'b0000; #10;
    if (A !== 2'b00) $display("FAIL: Test case 1 failed, expected A = 00, got A = %b", A);

    // Test case 2: Y = 4'b0001, expect A = 2'b00
    Y = 4'b0001; #10;
    if (A !== 2'b00) $display("FAIL: Test case 2 failed, expected A = 00, got A = %b", A);

    // Test case 3: Y = 4'b0010, expect A = 2'b00
    Y = 4'b0010; #10;
    if (A !== 2'b00) $display("FAIL: Test case 3 failed, expected A = 00, got A = %b", A);

    // Test case 4: Y = 4'b0011, expect A = 2'b01
    Y = 4'b0011; #10;
    if (A !== 2'b01) $display("FAIL: Test case 4 failed, expected A = 01, got A = %b", A);

    // Test case 5: Y = 4'b0100, expect A = 2'b01
    Y = 4'b0100; #10;
    if (A !== 2'b01) $display("FAIL: Test case 5 failed, expected A = 01, got A = %b", A);

    // Test case 6: Y = 4'b0101, expect A = 2'b01
    Y = 4'b0101; #10;
    if (A !== 2'b01) $display("FAIL: Test case 6 failed, expected A = 01, got A = %b", A);

    // Test case 7: Y = 4'b1000, expect A = 2'b10
    Y = 4'b1000; #10;
    if (A !== 2'b10) $display("FAIL: Test case 7 failed, expected A = 10, got A = %b", A);

    // Test case 8: Y = 4'b1001, expect A = 2'b10
    Y = 4'b1001; #10;
    if (A !== 2'b10) $display("FAIL: Test case 8 failed, expected A = 10, got A = %b", A);

    // Test case 9: Y = 4'b1010, expect A = 2'b10
    Y = 4'b1010; #10;
    if (A !== 2'b10) $display("FAIL: Test case 9 failed, expected A = 10, got A = %b", A);

    // Test case 10: Y = 4'b1111, expect A = 2'b11
    Y = 4'b1111; #10;
    if (A !== 2'b11) $display("FAIL: Test case 10 failed, expected A = 11, got A = %b", A);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule