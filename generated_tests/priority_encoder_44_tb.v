`timescale 1ns/1ps

module tb_priority_encoder;

  reg [7:0] Y;
  wire [2:0] A;

  // Instantiate the module under test
  priority_encoder uut (
    .Y(Y),
    .A(A)
  );

  initial begin
    // Test case 1: Highest bit set is Y[7]
    Y = 8'b10000000; #10;
    if (A !== 3'b111) $display("FAIL: Expected A=111 for Y=10000000, got A=%b", A);

    // Test case 2: Highest bit set is Y[6]
    Y = 8'b01000000; #10;
    if (A !== 3'b110) $display("FAIL: Expected A=110 for Y=01000000, got A=%b", A);

    // Test case 3: Highest bit set is Y[5]
    Y = 8'b00100000; #10;
    if (A !== 3'b101) $display("FAIL: Expected A=101 for Y=00100000, got A=%b", A);

    // Test case 4: Highest bit set is Y[4]
    Y = 8'b00010000; #10;
    if (A !== 3'b100) $display("FAIL: Expected A=100 for Y=00010000, got A=%b", A);

    // Test case 5: Highest bit set is Y[3]
    Y = 8'b00001000; #10;
    if (A !== 3'b011) $display("FAIL: Expected A=011 for Y=00001000, got A=%b", A);

    // Test case 6: Highest bit set is Y[2]
    Y = 8'b00000100; #10;
    if (A !== 3'b010) $display("FAIL: Expected A=010 for Y=00000100, got A=%b", A);

    // Test case 7: Highest bit set is Y[1]
    Y = 8'b00000010; #10;
    if (A !== 3'b001) $display("FAIL: Expected A=001 for Y=00000010, got A=%b", A);

    // Test case 8: No bits set
    Y = 8'b00000000; #10;
    if (A !== 3'b000) $display("FAIL: Expected A=000 for Y=00000000, got A=%b", A);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule