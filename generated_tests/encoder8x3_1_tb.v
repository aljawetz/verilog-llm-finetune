`timescale 1ns/1ps

module tb_encoder8x3;

reg [7:0] d;
wire [2:0] y;

// Instantiate the module under test
encoder8x3 uut (
    .d(d),
    .y(y)
);

initial begin
    // Test case 1: Valid one-hot input
    d = 8'b00000001; #10;
    if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", y);

    // Test case 2: Valid one-hot input
    d = 8'b00000010; #10;
    if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", y);

    // Test case 3: Valid one-hot input
    d = 8'b00000100; #10;
    if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", y);

    // Test case 4: Valid one-hot input
    d = 8'b00001000; #10;
    if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", y);

    // Test case 5: Valid one-hot input
    d = 8'b00010000; #10;
    if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", y);

    // Test case 6: Valid one-hot input
    d = 8'b00100000; #10;
    if (y !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", y);

    // Test case 7: Valid one-hot input
    d = 8'b01000000; #10;
    if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", y);

    // Test case 8: Valid one-hot input
    d = 8'b10000000; #10;
    if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", y);

    // Test case 9: Invalid input (not one-hot)
    d = 8'b00000000; #10;
    if (y !== 3'bXXX) $display("FAIL: Test case 9 failed, expected XXX, got %b", y);

    // Test case 10: Invalid input (not one-hot)
    d = 8'b00000011; #10;
    if (y !== 3'bXXX) $display("FAIL: Test case 10 failed, expected XXX, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule