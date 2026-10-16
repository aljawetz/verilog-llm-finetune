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
    // Test case 1: Only the highest bit is set
    Y = 8'b10000000; // Expected output: 3'b111
    #10;
    if (A !== 3'b111) $display("FAIL: Test case 1 failed, expected 3'b111 but got %b", A);

    // Test case 2: Second highest bit is set
    Y = 8'b01000000; // Expected output: 3'b110
    #10;
    if (A !== 3'b110) $display("FAIL: Test case 2 failed, expected 3'b110 but got %b", A);

    // Test case 3: Middle bit is set
    Y = 8'b00100000; // Expected output: 3'b101
    #10;
    if (A !== 3'b101) $display("FAIL: Test case 3 failed, expected 3'b101 but got %b", A);

    // Test case 4: Lower middle bit is set
    Y = 8'b00010000; // Expected output: 3'b100
    #10;
    if (A !== 3'b100) $display("FAIL: Test case 4 failed, expected 3'b100 but got %b", A);

    // Test case 5: Lower bit is set
    Y = 8'b00000010; // Expected output: 3'b001
    #10;
    if (A !== 3'b001) $display("FAIL: Test case 5 failed, expected 3'b001 but got %b", A);

    // Test case 6: No bits are set
    Y = 8'b00000000; // Expected output: 3'b000
    #10;
    if (A !== 3'b000) $display("FAIL: Test case 6 failed, expected 3'b000 but got %b", A);

    // Test case 7: Multiple bits set, highest bit should take priority
    Y = 8'b11000000; // Expected output: 3'b111
    #10;
    if (A !== 3'b111) $display("FAIL: Test case 7 failed, expected 3'b111 but got %b", A);

    // Test case 8: Multiple bits set, lower bit should not affect output
    Y = 8'b00001111; // Expected output: 3'b010
    #10;
    if (A !== 3'b010) $display("FAIL: Test case 8 failed, expected 3'b010 but got %b", A);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule