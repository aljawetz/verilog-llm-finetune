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
    // Test cases
    // Test case 1: Highest priority bit set (Y = 8'b10000000)
    Y = 8'b10000000; #10;
    if (A !== 3'b111) $display("FAIL: Expected A = 3'b111 for Y = 8'b10000000, got A = %b", A);

    // Test case 2: Second highest priority bit set (Y = 8'b01000000)
    Y = 8'b01000000; #10;
    if (A !== 3'b110) $display("FAIL: Expected A = 3'b110 for Y = 8'b01000000, got A = %b", A);

    // Test case 3: Middle priority bit set (Y = 8'b00100000)
    Y = 8'b00100000; #10;
    if (A !== 3'b101) $display("FAIL: Expected A = 3'b101 for Y = 8'b00100000, got A = %b", A);

    // Test case 4: Lower priority bit set (Y = 8'b00010000)
    Y = 8'b00010000; #10;
    if (A !== 3'b100) $display("FAIL: Expected A = 3'b100 for Y = 8'b00010000, got A = %b", A);

    // Test case 5: Another lower priority bit set (Y = 8'b00001000)
    Y = 8'b00001000; #10;
    if (A !== 3'b011) $display("FAIL: Expected A = 3'b011 for Y = 8'b00001000, got A = %b", A);

    // Test case 6: Second lowest priority bit set (Y = 8'b00000100)
    Y = 8'b00000100; #10;
    if (A !== 3'b010) $display("FAIL: Expected A = 3'b010 for Y = 8'b00000100, got A = %b", A);

    // Test case 7: Second lowest priority bit set (Y = 8'b00000010)
    Y = 8'b00000010; #10;
    if (A !== 3'b001) $display("FAIL: Expected A = 3'b001 for Y = 8'b00000010, got A = %b", A);

    // Test case 8: No bits set (Y = 8'b00000000)
    Y = 8'b00000000; #10;
    if (A !== 3'b000) $display("FAIL: Expected A = 3'b000 for Y = 8'b00000000, got A = %b", A);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule